package cn.itcast.web.controller.system;

import cn.itcast.domain.system.Module;
import cn.itcast.domain.system.Role;
import cn.itcast.service.system.ModuleService;
import cn.itcast.service.system.RoleService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.swing.StringUIClientPropertyKey;

import java.security.SignatureException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/system/role")
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/list", name = "角色列表")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        PageInfo pageInfo = roleService.findAll(companyId, page, size);
        request.setAttribute("page", pageInfo);
        return "system/role/role-list";
    }

    @RequestMapping(value = "/toAdd", name = "跳转角色新建页面")
    public String toAdd(){
        return "system/role/role-add";
    }

    @RequestMapping(value = "/edit", name = "保存角色信息")
    public String edit(Role role){

        role.setCompanyId(companyId);
        role.setCompanyName(companyName);

        if (StringUtil.isEmpty(role.getId())){
            roleService.save(role);
        }else {
            roleService.update(role);
        }
        return "redirect:/system/role/list.do";
    }

    @RequestMapping(value = "/toUpdate", name = "跳转角色修改页面")
    public String toUpdate(String id){
        Role role = roleService.findById(id);
        request.setAttribute("role", role);
        return "system/role/role-update";
    }

    @RequestMapping(value = "/delete", name = "删除一个角色")
    public String delete(String id){
        roleService.delete(id);
        return "redirect:/system/role/list.do";
    }


    @RequestMapping(value = "/roleModule", name = "给角色分配菜单，跳转菜单权限页面")
    public String roleModule(String roleid){
        Role role = roleService.findById(roleid);
        request.setAttribute("role", role);
        return "system/role/role-module";
    }

    @Autowired
    private ModuleService moduleService;

    /**
     *[
     { id:11, pId:1, name:"随意勾选 1-1"},
     { id:111, pId:11, name:"随意勾选 1-1-1"}]
     *
     */
    @RequestMapping(value = "/initModuleData")
    public @ResponseBody List<Map> initModuleData(String roleId){
        //1、查询所有模块
        List<Module> moduleList = moduleService.findAll();

        //通过roleId拿到该角色的模块信息
        System.out.println(roleId);
        List<Module> roleModule = moduleService.findModuleByRoleId(roleId);
        System.out.println(roleModule);

        //2、构造zNodes，List
        List<Map> zNodes = new ArrayList<Map>();

        for (Module module : moduleList) {
            Map map = new HashMap();
            map.put("id", module.getId());
            map.put("pId", module.getParentId());
            map.put("name", module.getName());

            //如果该角色有module这个模块，map.put"checked"
            if (roleModule.contains(module)){
                map.put("checked", true);
            }

            zNodes.add(map);
        }

        return zNodes;
    }

    @RequestMapping(value = "/updateRoleModule", name = "更新角色的新模块信息")
    public String updateRoleModule(String roleid, String moduleIds){
        moduleService.insertRoleModule(roleid, moduleIds);
        return "redirect:/system/role/list.do";
    }

}
