package cn.itcast.web.controller.cargo;

import cn.itcast.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 高策
 * @version V1.0
 * @Package cn.itcast.web.controller.cargo
 * @date 2019/11/23 1:28
 * @Copyright © 2018-2019 黑马程序员（顺义）校区
 * @name 轮船位置信息跟踪
 */

@Controller
@RequestMapping(value = "/cargo/trace")
public class TraceController extends BaseController {
    @RequestMapping(value = "/list", name = "轮船位置信息跟踪")
    public String list(){
        return "cargo/trace/trace-list";
    }
}
