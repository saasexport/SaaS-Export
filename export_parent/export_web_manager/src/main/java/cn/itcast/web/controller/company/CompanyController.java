package cn.itcast.web.controller.company;

import cn.itcast.common.entity.PageResult;
import cn.itcast.domain.company.Company;
import cn.itcast.service.company.CompanyService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.sun.net.httpserver.Authenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/company")
public class CompanyController extends BaseController{

    @Autowired
    private CompanyService companyService;

    //列表查询
    /*@RequestMapping(value = "/list")
    public String list(){ //int page, int size

//        int i = 1/0;

        List<Company> list = companyService.findAll();
        //PageResult page = companyService.findAll(page, size);
        //request.setAttribute("list", page.list);
        request.setAttribute("list", list);

        ///WEB-INF/pages/
        //.jsp
        //   /WEB-INF/pages/company/company-list.jsp

        return "company/company-list";
    }*/


    @RequestMapping(value = "/list")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
//        PageResult pageResult = companyService.findByPage(page, size);
//        request.setAttribute("page", pageResult);

        PageInfo pageInfo = companyService.findByHelper(page, size);
        System.out.println("通过PageHelper分页："+pageInfo.getList().size());
        request.setAttribute("page", pageInfo);
        return "company/company-list";
    }


    @RequestMapping(value = "/save")
    public String save(Date date){
        System.out.println(date);
        return "success";
    }


    //新建企业页面跳转
    @RequestMapping(value = "/toAdd", name = "新建企业")
    public String toAdd(){
        return "company/company-add";
    }


    @RequestMapping(value = "/edit", name = "保存企业信息")
    public String edit(Company company) {
        System.out.println("我接收到了一个实体类"+company);
        if (StringUtil.isEmpty(company.getId())){
            //新建
            companyService.save(company);
        }else {
            //修改
            companyService.update(company);
        }
        return "redirect: /company/list.do";
    }

    @RequestMapping(value = "/toUpdate", name = "编辑企业信息")
    public String toUpdate(String id){
        System.out.println("我接收到了一个id"+id);
        Company company = companyService.findById(id);
        request.setAttribute("company", company);
        return "company/company-update";
    }


    @RequestMapping(value = "/delete", name = "删除一条企业信息")
    public String delete(String id){
        System.out.println("我接收到了一个id"+id);
        companyService.delete(id);
        return "redirect: /company/list.do";
    }
}
