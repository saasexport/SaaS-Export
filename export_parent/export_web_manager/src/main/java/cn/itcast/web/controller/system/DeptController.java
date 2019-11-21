package cn.itcast.web.controller.system;

import cn.itcast.domain.system.Dept;
import cn.itcast.service.system.DeptService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import javafx.scene.media.VideoTrack;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/system/dept")
public class DeptController extends BaseController{

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/list", name = "分页查询部门列表")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        PageInfo pageInfo = deptService.findAll(companyId, page, size);
        request.setAttribute("page", pageInfo);
        return "system/dept/dept-list";
    }


    @RequestMapping(value = "/toAdd", name = "跳转部门新增页面")
    public String toAdd(){
        List<Dept> list = deptService.findAll(companyId);
        request.setAttribute("deptList", list);
        return "system/dept/dept-add";
    }


    @RequestMapping(value = "/edit", name = "保存部门信息")
    public String edit(Dept dept){

        dept.setCompanyId(companyId);
        dept.setCompanyName(companyName);

        if (StringUtil.isEmpty(dept.getId())){
            System.out.println(dept.toString());
            deptService.save(dept);
        }else {
            deptService.update(dept);
        }
        return "redirect: /system/dept/list.do";
    }

    @RequestMapping(value = "/toUpdate", name = "跳转编辑页面")
    public String toUpdate(String id){
        Dept dept = deptService.findById(id);
        request.setAttribute("dept", dept);

        List<Dept> list = deptService.findAll(companyId);
        request.setAttribute("deptList", list);

        return "system/dept/dept-update";
    }

    @RequestMapping(value = "/delete", name = "删除部门")
    public String delete(String id){
        deptService.delete(id);
        return "redirect: /system/dept/list.do";
    }
}
