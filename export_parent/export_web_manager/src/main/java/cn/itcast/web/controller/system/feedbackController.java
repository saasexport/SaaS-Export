package cn.itcast.web.controller.system;

import cn.itcast.common.utils.MailUtil;
import cn.itcast.domain.system.FeedBack;
import cn.itcast.domain.system.FeedBackExample;
import cn.itcast.service.system.FeedBackService;
import cn.itcast.service.system.UserService;
import cn.itcast.web.controller.BaseController;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @ProjectName: export_parent
 * @Package: cn.itcast.web.controller.system
 * @ClassName: feedbackController
 * @Author: chenxi
 * @Description:
 * @Date: 2019/11/21 18:17
 * @Version: 1.0
 */
@Controller
@RequestMapping("/system/feedback")
public class feedbackController extends BaseController {
    @Autowired
    private FeedBackService feedBackService;
    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
        FeedBackExample feedBackExample = new FeedBackExample();

        if (loginUser.getDegree() != 0) {
            FeedBackExample.Criteria criteria = feedBackExample.createCriteria();
            criteria.andInputByEqualTo(loginUser.getUserName());

        }

        PageInfo feedBacksList = feedBackService.findAll(feedBackExample, page, size);

        request.setAttribute("page", feedBacksList);


        return "system/feedback/feedback-list";
    }


    @RequestMapping(value = "/toAdd", name = "跳转新增反馈")
    public String toAdd() {

        return "system/feedback/feedback-add";
    }

    @RequestMapping(value = "/add", name = "保存反馈信息")
    public String add(FeedBack feedBack) {
        feedBack.setCompanyId(companyId);
        feedBack.setCompanyName(companyName);


        feedBack.setCreateBy(loginUser.getId());
        feedBack.setCreateDept(loginUser.getDeptId());
        feedBack.setState("0");
        feedBackService.save(feedBack);
        String email = userService.findSaasEmail(0);
//这里因为账号邮箱不能使用，所以改成固定值
        String email1 = "463003465@qq.com";
        try {
            MailUtil.sendMsg(email1, "用户反馈",
                    "您好,您有新的反馈,请及时处理"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "redirect:/system/feedback/list.do";
    }

    @RequestMapping(value = "delete", name = "删除")
    public String delete(String id) {

        feedBackService.delete(id);

        return "redirect:/system/feedback/list.do";
    }

    @RequestMapping(value = "toView", name = "查看")
    public String toView(String id) {

        FeedBack feedBack = feedBackService.findById(id);
        request.setAttribute("feedback", feedBack);
        return "system/feedback/feedback-view";
    }

    @RequestMapping(value = "/toProcess", name = "跳转到处理列表")
    public String toProcess(String id) {

        FeedBack feedBack = feedBackService.findById(id);
        request.setAttribute("feedback", feedBack);

        return "system/feedback/feedback-process";
    }

    @RequestMapping(value = "/updateFeedback", name = "保存处理反馈")
    public String updateFeedback(FeedBack feedBack) {

        feedBackService.updateFeedback(feedBack);

        return "redirect:/system/feedback/list.do";
    }

}
