package cn.itcast.web.controller.stat;

import cn.itcast.service.stat.StatService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/stat")
public class StatController extends BaseController {

    @Reference
    private StatService statService;

    @RequestMapping(value = "/toCharts")
    public String toCharts(String chartsType) {
        return "stat/stat-" + chartsType;
    }


    @RequestMapping(value = "/getFactoryData")
    public @ResponseBody
    List<Map> getFactoryData() {
        return statService.getFactoryData(companyId);
    }

    @RequestMapping(value = "/getSellData")
    public @ResponseBody
    List<Map> getSellData() {
        return statService.getSellData(companyId);
    }

    @RequestMapping(value = "/getOnlineData")
    public @ResponseBody
    List<Map> getOnlineData() {
        return statService.getOnlineData(companyId);
    }

    @RequestMapping(value = "/getMakertData")
    public @ResponseBody
    List<Map> getMakertData() {
        return statService.getMakertData(companyId);
    }

    //获取访问IP前十名(高策)
    @RequestMapping(value = "/getIpRankData")
    public @ResponseBody
    List<Map> getIpRankData() {
        return statService.getIpRankData(companyId);
    }
}
