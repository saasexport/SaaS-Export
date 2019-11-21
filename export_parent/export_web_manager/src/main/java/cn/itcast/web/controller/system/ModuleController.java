package cn.itcast.web.controller.system;

import cn.itcast.domain.system.Module;
import cn.itcast.service.system.ModuleService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/system/module")
public class ModuleController extends BaseController{

    @Autowired
    private ModuleService moduleService;

    @RequestMapping(value = "/list", name = "模块列表")
    @RequiresPermissions(value = "模块管理")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        PageInfo pageInfo = moduleService.findAll(page, size);
        request.setAttribute("page", pageInfo);
        return "system/module/module-list";
    }

    @RequestMapping(value = "/toAdd", name = "跳转到模块新建页面")
    public String toAdd(){
        List<Module> list = moduleService.findAll();
        request.setAttribute("menus", list);
        return "system/module/module-add";
    }


    @RequestMapping(value = "/edit", name = "保存模块信息")
    public String edit(Module module){

        if (StringUtil.isEmpty(module.getId())){
            moduleService.save(module);
        }else {
            moduleService.update(module);
        }

        return "redirect:/system/module/list.do";
    }


    @RequestMapping(value = "/toUpdate", name = "跳转到模块编辑页面")
    public String toUpdate(String id){
        Module module = moduleService.findById(id);
        request.setAttribute("module", module);

        List<Module> list = moduleService.findAll();
        request.setAttribute("menus", list);

        return "system/module/module-update";
    }


    @RequestMapping(value = "/delete", name = "删除一个模块")
    public String delete(String id){
        moduleService.delete(id);
        return "redirect:/system/module/list.do";
    }
}
