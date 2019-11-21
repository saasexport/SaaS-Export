package cn.itcast.service.cargo.impl;

import cn.itcast.dao.cargo.ContractDao;
import cn.itcast.dao.cargo.ContractProductDao;
import cn.itcast.dao.cargo.ExtCproductDao;
import cn.itcast.domain.cargo.*;
import cn.itcast.service.cargo.ContractService;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

@Service
public class ContractServiceImpl implements ContractService{

    @Autowired
    private ContractDao contractDao;   //合同的dao

    @Autowired
    private ContractProductDao contractProductDao;    //货物的dao

    @Autowired
    private ExtCproductDao extCproductDao;    //附件的dao

    public PageInfo findAll(ContractExample example, int page, int size) {
        PageHelper.startPage(page, size);
        List<Contract> list = contractDao.selectByExample(example);
        return new PageInfo(list);
    }

    public void save(Contract contract) {
        contract.setId(UUID.randomUUID().toString());
        contractDao.insertSelective(contract);
    }

    public Contract findById(String id) {
        return contractDao.selectByPrimaryKey(id);
    }

    public void update(Contract contract) {
        contractDao.updateByPrimaryKeySelective(contract);
    }

    //合同ID
    public void delete(String id) {
        //------------------------------------------------
        //第一种：
        //通过合同id查找所有的附件
        /*ExtCproductExample extCproductExample = new ExtCproductExample();
        ExtCproductExample.Criteria extcCriteria = extCproductExample.createCriteria();
        extcCriteria.andContractIdEqualTo(id);
        List<ExtCproduct> extCproducts = extCproductDao.selectByExample(extCproductExample);

        //循环附件进行删除
        for (ExtCproduct extCproduct : extCproducts) {
            extCproductDao.deleteByPrimaryKey(extCproduct.getId());
        }

        //通过合同id查找所有的货物
        ContractProductExample contractProductExample = new ContractProductExample();
        ContractProductExample.Criteria contractProductExampleCriteria = contractProductExample.createCriteria();
        contractProductExampleCriteria.andContractIdEqualTo(id);
        List<ContractProduct> contractProducts = contractProductDao.selectByExample(contractProductExample);
        //循环货物进行删除
        for (ContractProduct contractProduct : contractProducts) {
            contractProductDao.deleteByPrimaryKey(contractProduct.getId());
        }*/
        //------------------------------------------------


        //------------------------------------------------
        //第二种：
        //直接调用附件dao删除所有附件，条件是合同id
        extCproductDao.deleteByContractId(id);

        //直接调用货物dao删除所有货物，条件是合同id
        contractProductDao.deleteByContractId(id);


        contractDao.deleteByPrimaryKey(id);
    }
}
