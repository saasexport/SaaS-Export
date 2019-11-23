package cn.itcast.web.weebsocket;

import net.sf.json.JSONObject;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
/**
 * @author 高策
 * @version V1.0
 * @Package cn.itcast.web.weebsocket
 * @date 2019/11/23 13:46
 * @Copyright © 2018-2019 黑马程序员（顺义）校区
 */

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/{userId}")
public class WebSocketChat {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<WebSocketChat> webSocketSet = new CopyOnWriteArraySet<WebSocketChat>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;



    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId,Session session){
        this.session = session;
        HelpUtil.sessionMap.put(userId, this.session);
        webSocketSet.add(this);     //加入set中
        addOnlineCount(userId);           //在线数加1
        HelpUtil.listsList.add(userId);
        System.out.println("当前在线人数为" + getOnlineCount());
        Map<String,Object> contantMap=new HashMap<String,Object>();
        contantMap.put("isInit", "1");
        contantMap.put("contacts", HelpUtil.listsList);
        JSONObject jsonArray=JSONObject.fromObject(contantMap);
        System.err.println(jsonArray.toString());
        //广播消息
        for(WebSocketChat item: webSocketSet){
            try {
                item.sendMessage(jsonArray.toString());
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("userId") String userId){
        webSocketSet.remove(this);  //从set中删除
        HelpUtil.listsList.remove(userId);
        HelpUtil.sessionMap.remove(userId);
        subOnlineCount(userId);           //在线数减1
        System.out.println("当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        JSONObject jsonObject=JSONObject.fromObject(message);
        String fromer=jsonObject.getString("fromer");//发送者
        String sender=jsonObject.getString("sender");//接受者
        String msg=jsonObject.getString("msg");//消息内容
        Session session2=(Session) HelpUtil.sessionMap.get(sender);
        Map<String,Object> resultMap=new HashMap<String,Object>();
        resultMap.put("isInit", "0");
        resultMap.put("msg", msg);
        resultMap.put("fromer", fromer);//消息来源人ID
        resultMap.put("time", HelpUtil.getNowDateTime());
        JSONObject jsonArray=JSONObject.fromObject(resultMap);
        try {
            //单点消息
            session2.getBasicRemote().sendText(jsonArray.toString());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount(String userId) {
        System.out.println(userId+"上线了");
        WebSocketChat.onlineCount++;
    }

    public static synchronized void subOnlineCount(String userId) {
        System.out.println(userId+"下线了");
        WebSocketChat.onlineCount--;
    }
}