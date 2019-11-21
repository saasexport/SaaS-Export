package cn.itcast.web.shiro;

import cn.itcast.domain.system.Module;
import cn.itcast.domain.system.User;
import cn.itcast.service.system.ModuleService;
import cn.itcast.service.system.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private ModuleService moduleService;

    /**
     * 授权
     * @param principalCollection 安全数据集合
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //1、获取安全数据User对象
        User user = (User) principalCollection.getPrimaryPrincipal();

        //通过User对象拿到菜单
        List<Module> modules = moduleService.findModuleByUser(user);

        //1.1、构造set集合，放入菜单
        Set<String> set = new HashSet<String>();

        for (Module module : modules) {
            set.add(module.getName());
        }

        //2、返回AuthorizationInfo里有一个 set集合stringPermissions
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(set);
        return info;
    }


    @Autowired
    private UserService userService;

    /**
     * 身份认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //1、将authenticationToken转化为upToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;

        //2、通过upToken取用户名，email
        String email = upToken.getUsername();

        //3、查找用户实体类，放入安全数据
        User user = userService.findByEmail(email);
        // Object principal 安全数据，User
        // Object credentials 用户的数据库密码
        // String realmName 可以随意取名，但是我们一般用类名
        AuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
        //4、返回AuthenticationInfo
        return info;
    }
}
