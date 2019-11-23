package cn.itcast.web.controller.system;

import cn.itcast.common.utils.MailUtil;
import cn.itcast.domain.system.Dept;
import cn.itcast.domain.system.Role;
import cn.itcast.domain.system.User;
import cn.itcast.service.system.DeptService;
import cn.itcast.service.system.RoleService;
import cn.itcast.service.system.UserService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/system/user")
public class UserController extends BaseController{

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/list", name = "分页查询用户列表")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        PageInfo pageInfo = userService.findAll(companyId, page, size);
        request.setAttribute("page", pageInfo);
        return "system/user/user-list";
    }


    @RequestMapping(value = "/toAdd", name = "跳转用户新增页面")
    public String toAdd(){
        List<Dept> list = deptService.findAll(companyId);
        request.setAttribute("deptList", list);
        return "system/user/user-add";
    }


    @RequestMapping(value = "/edit", name = "保存用户信息")
    public String edit(User user) throws Exception {

        user.setCompanyId(companyId);
        user.setCompanyName(companyName);

        if (StringUtil.isEmpty(user.getId())){

            String password = user.getPassword();
            userService.save(user);

            //发送邮件，1、必须要在写入数据库之后
            //2、注意密码一定不是加密的密码
            MailUtil.sendMsg(user.getEmail(), "欢迎进入SaaS-Export大家庭",
                    "SaaS-Export平台登录地址是：http://localhost:8080/login.do   "+
                            "你的用户名是："+user.getEmail()+" 你的密码是："+password);
        }else {
            userService.update(user);
        }
        return "redirect: /system/user/list.do";
    }

    @RequestMapping(value = "/toUpdate", name = "跳转编辑页面")
    public String toUpdate(String id){
        User user = userService.findById(id);
        request.setAttribute("user", user);

        List<Dept> list = deptService.findAll(companyId);
        request.setAttribute("deptList", list);

        return "system/user/user-update";
    }

    @RequestMapping(value = "/delete", name = "删除用户")
    public String delete(String id){
        userService.delete(id);
        return "redirect: /system/user/list.do";
    }


    //注入roleService
    @Autowired
    private RoleService roleService;

    /**
     *
     * @param id 用户的id   user.id
     * @return
     */
    @RequestMapping(value = "/roleList", name = "跳转到用户分配角色页面")
    public String roleList(String id){
        //1、通过id查找用户对象
        User user = userService.findById(id);
        //2、把用户对象放入request域当中
        request.setAttribute("user", user);

        //3、通过roleService查询所有的角色信息，不分页
        List<Role> roleList = roleService.findAll(companyId);
        //4、把roleList对象放入request域当中
        request.setAttribute("roleList", roleList);

        //5、通过用户id查找所有该用户下的角色信息 List
        List<Role> userRoleList = roleService.findByUserId(id);
        //6、循环list构建一个userRoleStr
        String userRoleStr = "";
        for (Role role : userRoleList) {
            userRoleStr = userRoleStr + role.getId() + ",";
        }
        //7、把userRoleStr放入request域当中
        request.setAttribute("userRoleStr", userRoleStr);

        //8、跳转页面
        return "system/user/user-role";
    }

    @RequestMapping(value = "/changeRole")
    public String changeRole(String userid, String [] roleIds){
        //1、调用roleService保存
        roleService.changeRole(userid, roleIds);
        //2、跳转页面
        return "redirect: /system/user/list.do";
    }

}
