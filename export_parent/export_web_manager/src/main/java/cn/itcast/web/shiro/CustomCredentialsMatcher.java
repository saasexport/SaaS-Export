package cn.itcast.web.shiro;

import cn.itcast.common.utils.Encrypt;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

    /**
     * 密码比较方法
     * @param token  //upToken
     * @param info   //身份认证的info，安全数据（User），用户的数据库密码
     * @return
     */
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        //1、转化token，取用户输入的密码
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String userPassword = String.valueOf(upToken.getPassword());
        String email = upToken.getUsername();
        if (userPassword.equals(String.valueOf(info.getCredentials()))){
            //免密登录
            return true;
        }else{
            //1.1、加密
            String md5Password = Encrypt.md5(userPassword, email);
            //2、通过AuthenticationInfo取数据库密码
            String dbPassword = String.valueOf(info.getCredentials());
            //3、比较两个密码
            return md5Password.equals(dbPassword);
        }
    }
}
