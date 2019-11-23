package cn.itcast.web.controller;


import cn.itcast.common.utils.Encrypt;
import cn.itcast.common.utils.HttpUtils;
import cn.itcast.domain.system.Module;
import cn.itcast.domain.system.User;
import cn.itcast.service.system.ModuleService;
import cn.itcast.service.system.UserService;
import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.util.StringUtil;
import jdk.Exported;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private ModuleService moduleService;

	/*@RequestMapping("/login")
	public String login(String email,String password) {
	    //1、判断传入的参数
        if (StringUtil.isEmpty(email)||StringUtil.isEmpty(password)){
            //2、如果email和password有一项没有输，跳转登录页面，提示
            request.setAttribute("error", "请输入用户名或密码！");
            return "forward:login.jsp";
        }

        //3、通过email查询用户实体类
        User user = userService.findByEmail(email);

        //4、查到了 user!=null，数据库密码 == 输入的密码
        if (user!=null && user.getPassword().equals(password)){

            Enumeration attributeNames = session.getAttributeNames();
            while (attributeNames.hasMoreElements()){
                String string = (String) attributeNames.nextElement();
                System.out.println("-----------------------"+string);
                System.out.println(session.getAttribute(string));
            }

            //查找用户对应的菜单（模块）
            List<Module> moduleList = moduleService.findModuleByUser(user);
            session.setAttribute("modules", moduleList);

            //5、写入session，并且跳转home/main
            session.setAttribute("loginUser", user);

            Enumeration attributeNames1 = session.getAttributeNames();
            while (attributeNames1.hasMoreElements()){
                String string = (String) attributeNames1.nextElement();
                System.out.println("========"+string);
                System.out.println(session.getAttribute(string));
            }

            return "home/main";
        }else {
            //6、如果没有查到user或者密码不对，跳转登录页面，提示
            request.setAttribute("error", "用户名或密码不正确！");
            return "forward:login.jsp";
        }
	}*/


    @RequestMapping("/firstLogin")
    public String firstLogin(String email, String password, String openId) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(email, password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            User user = (User) subject.getPrincipal();
            session.setAttribute("loginUser", user);
            List<Module> modules = moduleService.findModuleByUser(user);
            session.setAttribute("modules", modules);
            userService.AddOpenId(openId, email);
            return "home/main";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "用户名或密码错误");
            return "/weiXinLogin";
        }
    }

    @RequestMapping("/weiXinLogin")
    public String weiXinLogin(String code) {
        String appId = "wx3bdb1192c22883f3";
        String secret = "db9d6b88821df403e5ff11742e799105";
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appId + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";
        Map<String, Object> map = HttpUtils.sendGet(url);
        String openId = map.get("openid").toString();
        User user = userService.findByOpenId(openId);
        if (user == null) {
            User user1 = new User();
            user1.setOpenId(openId);
            request.setAttribute("user", user1);
            return "/weiXinLogin";
        } else {
            System.out.println("免密登录修改");
            return "home/main";
            }
    }

    //通过shiro进行登录
    @RequestMapping("/login")
    public String login(String email, String password) {
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(password)) {
            request.setAttribute("error", "用户名或密码为空");
            return "forward:/login.jsp";
        }
        //构造token 获取subject对象 调用subject的login方法进行登录

        if (request.getParameter("openId") == null) {
            try {
                //1、创建subject
                Subject subject = SecurityUtils.getSubject();
                //1.1、通过email,password创建token
                UsernamePasswordToken upToken = new UsernamePasswordToken(email, password);
                //2、利用subject.login方法进行登录
                subject.login(upToken);  //两个方法：1、身份认证；2、密码比较

                //3、通过subject取到安全数据（user对象存入安全数据）
                User user = (User) subject.getPrincipal();

                if (user != null) {
                    //4、放入到session
                    session.setAttribute("loginUser", user);
                    List<Module> moduleList = moduleService.findModuleByUser(user);
                    session.setAttribute("modules", moduleList);


                    Enumeration attributeNames = session.getAttributeNames();
                    while (attributeNames.hasMoreElements()) {
                        String string = (String) attributeNames.nextElement();
                        System.out.println("-----------------------" + string);
                        System.out.println(session.getAttribute(string));
                    }

                    //5、进行登录
                    return "home/main";
                } else {
                    request.setAttribute("error", "用户不存在！");
                    return "forward:login.jsp";
                }
            } catch (Exception e) {
                request.setAttribute("error", "用户名或密码不正确！");
                return "forward:login.jsp";
            }
        } else {
            String openId = request.getParameter("openId");
            String enterEmail = request.getParameter("email");
            String enterPassword = request.getParameter("password");
            UsernamePasswordToken token = new UsernamePasswordToken(enterEmail, enterPassword, openId);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            //获取User对象
            User user = (User) subject.getPrincipal();
            session.setAttribute("loginUser", user);
            List<Module> modules = moduleService.findModuleByUser(user);
            session.setAttribute("modules", modules);
            return "home/main";
        }
    }

    //退出
    @RequestMapping(value = "/logout", name = "用户登出")
    public String logout() {
        SecurityUtils.getSubject().logout();   //登出
        return "forward:login.jsp";
    }

    @RequestMapping("/home")
    public String home() {
        return "home/home";
    }

    @RequestMapping("/changePassword")
    public @ResponseBody
    int changePassword(String oldPassword, String newPassword) {
        User user = getLoginUser();
        oldPassword = Encrypt.md5(oldPassword, user.getEmail());
        if (oldPassword.equals(user.getPassword())) {
            //1代表密码正确,然后更新密码
            user.setPassword(newPassword);
            userService.update(user);
            return 1;
        } else {
            return 0;
        }

    }

}
