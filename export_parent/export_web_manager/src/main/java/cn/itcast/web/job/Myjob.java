package cn.itcast.web.job;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Myjob {

    public void excute(){
        //写业务逻辑
        System.out.println("===================="+
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));


        //1、查询出来要汇总的数据
        // findByDate

        //2、通过汇总的数据写入一个中间表
        // save
    }
}
