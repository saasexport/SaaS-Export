package cn.itcast.service.cargo.impl;

import cn.itcast.dao.cargo.*;
import cn.itcast.domain.cargo.*;
import cn.itcast.domain.vo.ExportProductResult;
import cn.itcast.domain.vo.ExportResult;
import cn.itcast.service.cargo.ExportService;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.SignatureException;
import java.util.*;

//报运单的主表service
@Service
public class ExportServiceImpl implements ExportService{


    @Autowired
    private ExportDao exportDao;  //报运单dao

    @Autowired
    private ContractDao contractDao;   //合同dao

    @Autowired
    private ContractProductDao contractProductDao;  //合同的货物对应的dao

    @Autowired
    private ExportProductDao exportProductDao;  //报运单的商品对应的dao

    @Autowired
    private ExtCproductDao extCproductDao;  //合同的附件dao

    @Autowired
    private ExtEproductDao extEproductDao;  //报运单的附件dao

    public Export findById(String id) {
        return exportDao.selectByPrimaryKey(id);
    }

    public void save(Export export) {
        //1、设置export的ID
        export.setId(UUID.randomUUID().toString());
        //   设置export的状态为0
        export.setState(0);
        //2、通过export.contractIds获取合同id集合
        String[] contractIds = export.getContractIds().split(",");
        //-----------------------------------------------操作合同

        int proNum = 0;
        int extNum = 0;

        //3、循环合同id集合
        for (String contractId : contractIds) {
            //4、通过id查找合同实体类
            Contract contract = contractDao.selectByPrimaryKey(contractId);
            //5、设置合同状态为已经报运
            contract.setState(2);
            //6、合同的更新
            contractDao.updateByPrimaryKeySelective(contract);
            //-----------------------------------------------操作货物
            //7、通过合同id查找货物列表
            ContractProductExample contractProductExample = new ContractProductExample();
            ContractProductExample.Criteria contractProductCriteria = contractProductExample.createCriteria();
            contractProductCriteria.andContractIdEqualTo(contractId);
            List<ContractProduct> cpList = contractProductDao.selectByExample(contractProductExample);

            //key:货物id，values: 报运商品id
            Map<String, String> map = new HashMap<String, String>();

            //8、循环货物列表
            for (ContractProduct contractProduct : cpList) {
                //9、构造报运商品实体类
                ExportProduct exportProduct = new ExportProduct();
                //10、将货物内容写入到报运商品
                BeanUtils.copyProperties(contractProduct, exportProduct);
                //11、设置将报运商品的exportId
                exportProduct.setExportId(export.getId());
                //12、设置商品自己的ID
                exportProduct.setId(UUID.randomUUID().toString());
                //13、保存报运商品
                exportProductDao.insertSelective(exportProduct);

                map.put(contractProduct.getId(), exportProduct.getId());

                proNum = proNum + contractProduct.getCnumber();
            }
            //-----------------------------------------------操作附件
            //14、通过合同id查找附件列表
            ExtCproductExample extCproductExample = new ExtCproductExample();
            ExtCproductExample.Criteria extCproductCriteria = extCproductExample.createCriteria();
            extCproductCriteria.andContractIdEqualTo(contractId);
            List<ExtCproduct> extCproducts = extCproductDao.selectByExample(extCproductExample);
            //15、循环附件列表
            for (ExtCproduct extCproduct : extCproducts) {
                //16、构造报运附件实体类
                ExtEproduct extEproduct = new ExtEproduct();
                //17、将附件内容写入到报运附件中
                BeanUtils.copyProperties(extCproduct, extEproduct);
                //18、设置附件商品的exportId
                extEproduct.setExportId(export.getId());
                //19、设置附件自己的ID
                extEproduct.setId(UUID.randomUUID().toString());
                //20、设置附件对应的报运商品ID
                String exportProductId = map.get(extCproduct.getContractProductId());
                extEproduct.setExportProductId(exportProductId);
                //24、保存报运单的附件
                extEproductDao.insertSelective(extEproduct);
                extNum = extNum + extCproduct.getCnumber();
            }
            //------------------------------------------------

        }
        //21、设置报运单的商品数量
        export.setProNum(proNum);
        //22、设置报运单的附件数量
        export.setExtNum(extNum);
        //23、保存报运单
        exportDao.insertSelective(export);
    }

    public void update(Export export) {
        //1、更新报运单信息
        exportDao.updateByPrimaryKeySelective(export);
        //2、获取报运单的货物列表

        List<ExportProduct> exportProducts = export.getExportProducts();

        if (exportProducts!=null){
            //3、循环货物列表保存货物信息
            for (ExportProduct exportProduct : exportProducts) {
                exportProductDao.updateByPrimaryKeySelective(exportProduct);
            }
        }
    }

    public void delete(String id) {

    }

    public PageInfo findAll(ExportExample example, int page, int size) {
        PageHelper.startPage(page, size);
        List<Export> list = exportDao.selectByExample(example);
        return new PageInfo(list);
    }

    public void updateE(ExportResult exportResult) {
        /*Export export = new Export();
        export.setId(exportResult.getExportId());
        export.setState(exportResult.getState());
        export.setRemark(exportResult.getRemark());
        exportDao.updateByPrimaryKeySelective(export);*/

        Export export = exportDao.selectByPrimaryKey(exportResult.getExportId());
        export.setState(exportResult.getState());
        export.setRemark(exportResult.getRemark());
        exportDao.updateByPrimaryKeySelective(export);

        Set<ExportProductResult> products = exportResult.getProducts();
        for (ExportProductResult product : products) {
            ExportProduct ep = new ExportProduct();
            ep.setId(product.getExportProductId());
            ep.setTax(product.getTax());
            exportProductDao.updateByPrimaryKeySelective(ep);
        }
    }

    public List<Export> findStateExport(ExportExample exportExample) {
        return exportDao.selectByExample(exportExample);
    }
}
