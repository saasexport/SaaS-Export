package cn.itcast.web.weebsocket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 高策
 * @version V1.0
 * @Package cn.itcast.web.weebsocket
 * @date 2019/11/23 13:46
 * @Copyright © 2018-2019 黑马程序员（顺义）校区
 */
public class HelpUtil {

    //存放联系人列表
    public static List<String> listsList=new ArrayList<String>();

    //存放每个用户对应得session
    public static Map<String,Object> sessionMap=new HashMap<String,Object>();

    /**
     *
     * 功能 ： 返回时间字符串(yyyy-MM-dd HH:mm:ss)
     */
    public static String getNowDateTime() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        return dateString;
    }
}
