package cn.itcast.web.controller.cargo;

import cn.itcast.domain.cargo.*;
import cn.itcast.domain.company.Company;
import cn.itcast.domain.vo.ExportProductVo;
import cn.itcast.domain.vo.ExportResult;
import cn.itcast.domain.vo.ExportVo;
import cn.itcast.service.cargo.ContractService;
import cn.itcast.service.cargo.ExportProductService;
import cn.itcast.service.cargo.ExportService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.apache.cxf.jaxrs.client.WebClient;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/cargo/export")
public class ExportController extends BaseController{

    @Reference
    private ExportService exportService;

    @Reference
    private ExportProductService exportProductService;

    @Reference
    private ContractService contractService;


    @RequestMapping(value = "/contractList")
    public String contractList(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){

        ContractExample example = new ContractExample();
        ContractExample.Criteria criteria = example.createCriteria();
        criteria.andStateEqualTo(1);
        criteria.andCompanyIdEqualTo(companyId);
        PageInfo pageInfo = contractService.findAll(example, page, size);
        request.setAttribute("page", pageInfo);

        return "cargo/export/export-contractList";
    }


    @RequestMapping(value = "/list")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        ExportExample exportExample = new ExportExample();
        ExportExample.Criteria criteria = exportExample.createCriteria();
        criteria.andCompanyIdEqualTo(companyId);
        PageInfo pageInfo = exportService.findAll(exportExample, page, size);
        request.setAttribute("page", pageInfo);
        return "cargo/export/export-list";
    }

    // id --> contractIds
    // 合同的数组
    @RequestMapping(value = "/toExport")
    public String toExport(String id){
        request.setAttribute("id", id);
        return "cargo/export/export-toExport";
    }


    //保存报运单
    @RequestMapping(value = "/edit")
    public String edit(Export export, String contractIds){

        //除了字符串以外，其他都必须判断
        //字符串，判断字符串不能为空

//        System.out.println("==========="+export+"===="+contractIds);

        export.setContractIds(contractIds);
        export.setCompanyId(companyId);
        export.setCompanyName(companyName);

        //调用exportService保存
        if (StringUtil.isEmpty(export.getId())){
            exportService.save(export);
        }else {
            exportService.update(export);
        }

        return "redirect:/cargo/export/list.do";
    }


    @RequestMapping(value = "/toView")
    public String toView(String id){
        Export export = exportService.findById(id);
        request.setAttribute("export", export);
        return "cargo/export/export-view";
    }

    @RequestMapping(value = "/toUpdate")
    public String toUpdate(String id){
        Export export = exportService.findById(id);
        request.setAttribute("export", export);

        ExportProductExample exportProductExample = new ExportProductExample();
        ExportProductExample.Criteria criteria = exportProductExample.createCriteria();
        criteria.andExportIdEqualTo(id);
        criteria.andCompanyIdEqualTo(companyId);
        //select * from exportPorduct where export_id = 123123
        List<ExportProduct> list = exportProductService.findAll(exportProductExample);
        request.setAttribute("eps", list);

        return "cargo/export/export-update";
    }

    @RequestMapping(value = "/submit")
    public String submit(String id){
        //1、id报运单编号，通过id查询报运单实体
        Export export = exportService.findById(id);
        //2、设置报运单的状态=1
        export.setState(1);
        //3、调用exportService.update更新
        exportService.update(export);
        //4、跳转重定向页面
        return "redirect:/cargo/export/list.do";
    }


    @RequestMapping(value = "/cancel")
    public String cancel(String id){
        //1、id报运单编号，通过id查询报运单实体
        Export export = exportService.findById(id);
        //2、设置报运单的状态=1
        export.setState(0);
        //3、调用exportService.update更新
        exportService.update(export);
        //4、跳转重定向页面
        return "redirect:/cargo/export/list.do";
    }


    //id指的是报运单的id
    @RequestMapping(value = "/exportE")
    public String exportE(String id){
        //1、通过id查询报运单实体
        Export export = exportService.findById(id);
        //2、通过报运单实体构造给海关的数据，主数据
        ExportVo exportVo = new ExportVo();
        //3、从报运单复制到海关数据的实体
        BeanUtils.copyProperties(export, exportVo);
        exportVo.setExportId(id);

        //4、通过id查询报运单的商品
        ExportProductExample exportProductExample = new ExportProductExample();
        ExportProductExample.Criteria epCriteria = exportProductExample.createCriteria();
        epCriteria.andExportIdEqualTo(id);
        List<ExportProduct> epList = exportProductService.findAll(exportProductExample);
        List<ExportProductVo> epVoList = new ArrayList<ExportProductVo>();

        //5、构造给海关的数据，商品数据
        for (ExportProduct exportProduct : epList) {
            ExportProductVo epVo = new ExportProductVo();
            BeanUtils.copyProperties(exportProduct, epVo);
            epVo.setExportId(id);
            epVo.setExportProductId(exportProduct.getId());
            epVoList.add(epVo);
        }

        //6、把海关商品数据和主数据合并成一个
        exportVo.setProducts(epVoList);

        //7、调用海关的接口，第一次调用，把数据传给海关，返回成功或者失败
        WebClient wc = WebClient.create("http://localhost:8088/ws/export/user");
        wc.post(exportVo);

        //8、调用海关的接口，第二次调用，把id传给海关，返回的实体类
        wc = WebClient.create("http://localhost:8088/ws/export/user/"+id);
        ExportResult exportResult = wc.get(ExportResult.class);

        System.out.println("========================调用海关接口："+exportResult.toString());
        //9、通过海关返回的实体类更新税金
        exportService.updateE(exportResult);

        return "redirect:/cargo/export/list.do";
    }
}
