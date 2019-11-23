package cn.itcast.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author 高策
 * @version V1.0
 * @Package cn.itcast.web.controller
 * @date 2019/11/23 13:40
 * @Copyright © 2018-2019 黑马程序员（顺义）校区
 */
@Controller
@RequestMapping("/chat")
public class ChatController extends BaseController{
    @RequestMapping("/list")
    public String list() {
        return "chat/chat";
    }
}
