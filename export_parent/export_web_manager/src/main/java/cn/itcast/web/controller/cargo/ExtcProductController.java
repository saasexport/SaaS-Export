package cn.itcast.web.controller.cargo;

import cn.itcast.domain.cargo.ExtCproduct;
import cn.itcast.domain.cargo.ExtCproductExample;
import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;
import cn.itcast.service.cargo.ExtCProductService;
import cn.itcast.service.cargo.FactoryService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/cargo/extCproduct")
public class ExtcProductController extends BaseController {


    @Reference
    private FactoryService factoryService;

    @Reference
    private ExtCProductService extCProductService;

    @RequestMapping(value = "/list")
    public String list(String contractId, String contractProductId, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){

        //1、通过factoryService查询所有的厂家，条件必须货物
        FactoryExample factoryExample = new FactoryExample();
        FactoryExample.Criteria factoryCriteria = factoryExample.createCriteria();
        factoryCriteria.andCtypeEqualTo("附件");
        List<Factory> factoryList = factoryService.findAll(factoryExample);
        //2、factoryList放入request域当中
        request.setAttribute("factoryList", factoryList);

        ExtCproductExample extCproductExample = new ExtCproductExample();
        ExtCproductExample.Criteria criteria = extCproductExample.createCriteria();
        criteria.andContractProductIdEqualTo(contractProductId);
        PageInfo pageInfo = extCProductService.findAll(extCproductExample, page, size);
        request.setAttribute("page", pageInfo);
        request.setAttribute("contractId", contractId);
        request.setAttribute("contractProductId", contractProductId);
        return "cargo/extc/extc-list";
    }


    @RequestMapping(value = "/edit")
    public String edit(String contractId, String contractProductId, ExtCproduct extCproduct){

        extCproduct.setCompanyId(companyId);
        extCproduct.setCompanyName(companyName);

        if (StringUtil.isEmpty(extCproduct.getId())){
            extCproduct.setContractId(contractId);
            extCproduct.setContractProductId(contractProductId);

            extCProductService.save(extCproduct);
        }else {
            extCProductService.update(extCproduct);
        }

        request.setAttribute("contractId", contractId);
        request.setAttribute("contractProductId", contractProductId);
        return "redirect:/cargo/extCproduct/list.do?contractId="+contractId+"&contractProductId="+contractProductId;
    }


    @RequestMapping(value = "/toUpdate")
    public String toUpdate(String id, String contractId, String contractProductId){

        //1、通过factoryService查询所有的厂家，条件必须货物
        FactoryExample factoryExample = new FactoryExample();
        FactoryExample.Criteria factoryCriteria = factoryExample.createCriteria();
        factoryCriteria.andCtypeEqualTo("附件");
        List<Factory> factoryList = factoryService.findAll(factoryExample);
        //2、factoryList放入request域当中
        request.setAttribute("factoryList", factoryList);


        ExtCproduct extCproduct = extCProductService.findById(id);
        request.setAttribute("extCproduct", extCproduct);
        request.setAttribute("contractId", contractId);
        request.setAttribute("contractProductId", contractProductId);
        return "cargo/extc/extc-update";
    }


    @RequestMapping(value = "/delete")
    public String delete(String id, String contractId, String contractProductId){
        extCProductService.delete(id);
        request.setAttribute("contractId", contractId);
        request.setAttribute("contractProductId", contractProductId);
        return "redirect:/cargo/extCproduct/list.do?contractId="+contractId+"&contractProductId="+contractProductId;
    }
}
