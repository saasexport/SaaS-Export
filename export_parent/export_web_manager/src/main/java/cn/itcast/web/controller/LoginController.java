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
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private ModuleService moduleService;

    private Jedis jedis;
    private JedisPool jedisPool;

    @RequestMapping("/firstLogin")
    public String firstLogin(String email, String password, String openId) {
        try {
            if (!userService.findByEmail(email).getOpenId().equals(null)) {
                request.setAttribute("error", "此用户已绑定微信账号,请重试");
                return "forward:login.jsp";
            } else {
                UsernamePasswordToken token = new UsernamePasswordToken(email, password);
                Subject subject = SecurityUtils.getSubject();
                subject.login(token);
                User user = (User) subject.getPrincipal();
                session.setAttribute("loginUser", user);
                List<Module> modules = moduleService.findModuleByUser(user);
                session.setAttribute("modules", modules);
                userService.AddOpenId(openId, email);
                return "home/main";
            }
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
        String openId = null;
        try {
            openId = map.get("openid").toString();
            jedisPool = new JedisPool(new JedisPoolConfig(), "39.106.187.252");
            jedis = jedisPool.getResource();
            jedis.set("openId", openId);
        } catch (Exception e) {
            openId = jedis.get("openId");
            e.printStackTrace();
        }
        User user = userService.findByOpenId(openId);
        if (user == null) {
            User user1 = new User();
            user1.setOpenId(openId);
            request.setAttribute("user", user1);
            return "/weiXinLogin";
        } else {
            //免密登录
            Subject subject = SecurityUtils.getSubject();
            String email = user.getOpenId();
            String password = Encrypt.md5(openId, email);
            UsernamePasswordToken upToken = new UsernamePasswordToken(openId, password);
            subject.login(upToken);
            User users = (User) subject.getPrincipal();
            session.setAttribute("loginUser", users);
            List<Module> moduleList = moduleService.findModuleByUser(users);
            session.setAttribute("modules", moduleList);
            Enumeration attributeNames = session.getAttributeNames();
            while (attributeNames.hasMoreElements()) {
                String string = (String) attributeNames.nextElement();
                System.out.println("-----------------------" + string);
                System.out.println(session.getAttribute(string));
            }
            //5、进行登录
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

        /*        if (request.getParameter("openId") == null) {*/
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
/*        } else {
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
        }*/
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
