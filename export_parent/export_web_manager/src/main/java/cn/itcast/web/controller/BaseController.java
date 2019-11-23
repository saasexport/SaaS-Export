package cn.itcast.web.controller;

import cn.itcast.domain.system.User;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BaseController {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;

    protected String companyId;
    protected String companyName;
    protected User loginUser;

    @ModelAttribute
    public void init(HttpServletRequest request, HttpSession session, HttpServletResponse response){
        this.request = request;
        this.session = session;
        this.response = response;

        User user = (User) session.getAttribute("loginUser");

        if (user!=null){
            this.loginUser = user;
            this.companyId = user.getCompanyId();
            this.companyName = user.getCompanyName();
        }
    }
    protected User getLoginUser() {
        Object obj = session.getAttribute("loginUser");
        if (obj != null) {
            User user = (User) obj;
            return user;
        }
        return null;
    }
}
