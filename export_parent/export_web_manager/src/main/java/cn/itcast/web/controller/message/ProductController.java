package cn.itcast.web.controller.message;

import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;
import cn.itcast.domain.message.Product;
import cn.itcast.domain.message.ProductExample;
import cn.itcast.domain.system.User;
import cn.itcast.service.cargo.FactoryService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;

import com.itcast.service.message.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/message/product")
public class ProductController extends BaseController {

    @Reference
    private ProductService productService;

    @Reference
    private FactoryService factoryService;

    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer size) {
        ProductExample example = new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyIdEqualTo(companyId);
        PageInfo info = productService.findAll(example, page, size);
        request.setAttribute("page", info);
        return "message/product/product-list";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        //工厂相关
        FactoryExample factoryExample = new FactoryExample();
        FactoryExample.Criteria fCriteria = factoryExample.createCriteria();
        fCriteria.andCtypeEqualTo("货物");
      List<Factory> factories = factoryService.findAll(factoryExample);
        request.setAttribute("factoryList", factories);
        return "message/product/product-add";
    }

    @RequestMapping("/edit")
    public String edit(Product product) {
        product.setCompanyId(companyId);
        product.setCompanyName(companyName);
        User user = getLoginUser();
        //判断if是否为空
        if (StringUtils.isEmpty(product.getId())) {
            //为空 保存
            product.setCreateBy(user.getUserName());
            product.setCreateDept(user.getDeptName());
            productService.save(product);
        } else {
            //不为空 更新
            productService.update(product);
        }
        return "redirect:/message/product/list.do";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(String id) {
        Product product = productService.findById(id);
        //工厂相关
        FactoryExample factoryExample = new FactoryExample();
        FactoryExample.Criteria fCriteria = factoryExample.createCriteria();
        fCriteria.andCtypeEqualTo("货物");
       List<Factory> factories = factoryService.findAll(factoryExample);
        request.setAttribute("factoryList", factories);
        request.setAttribute("product", product);
        return "message/product/product-update";
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        productService.delete(id);
        return "redirect:/message/product/list.do";
    }

}
