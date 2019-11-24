package cn.itcast.web.controller.basic;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;
import cn.itcast.domain.message.ProductExample;
import cn.itcast.service.cargo.FactoryService;
import cn.itcast.service.message.ProductService;
import cn.itcast.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/basics/factory")
public class FactoryController extends BaseController {
    @Reference
    private FactoryService factoryService;
    @Reference
    private ProductService ProductService;

    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "5") Integer size,
                       Model model) {

        FactoryExample example = new FactoryExample();
        PageInfo pageInfo = factoryService.findAll(example, page, size);

        model.addAttribute("page", pageInfo);

        return "basics/factory/factory-list";

    }

    @RequestMapping("/toAdd")
    public String toAdd() {

        return "basics/factory/factory-add";

    }

    //查看厂家的货物
    @RequestMapping("/toView")
    public String toView(String id,
                         @RequestParam(defaultValue = "1") Integer page,
                         @RequestParam(defaultValue = "5") Integer size) {

        Factory factory = factoryService.selectByPrimaryKey(id);
        request.setAttribute("factory", factory);

        ProductExample productExample = new ProductExample();
        ProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andFactoryIdEqualTo(id);

        PageInfo pageInfo = ProductService.findAll(productExample, page, size);

        request.setAttribute("page", pageInfo);

        return "basics/factory/factoryproduct-list";

    }

    @RequestMapping("/edit")
    public String edit(Factory factory) {

        if (StringUtils.isEmpty(factory.getId())) {

            factory.setCompanyId(companyId);
            factory.setCompanyName(companyName);
            factory.setCreateBy(loginUser.getId());
            factory.setCreateDept(loginUser.getDeptId());

            factoryService.save(factory);

        } else {

            factoryService.update(factory);

        }

        return "redirect:/basics/factory/list.do";

    }

    @RequestMapping("/toUpdate")
    public String toUpdate(String id, Model model) {

        Factory factory = factoryService.selectByPrimaryKey(id);

        model.addAttribute("factory", factory);

        return "basics/factory/factory-update";

    }

    @RequestMapping("/delete")
    public String delete(String id) {

        factoryService.deleteByPrimaryKey(id);

        return "redirect:/basics/factory/list.do";

    }

}
