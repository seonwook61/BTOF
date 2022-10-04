package com.product.controller;



import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.member.service.MemberService;


@Controller
@ServerEndpoint(value="/echo")
public class AuctionController {
    
	@Autowired
	MemberService memberService;
	
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
    private static String oldPrice;
    public AuctionController() {
        System.out.println("서버가 시작되었습니다.");
    }
    
    
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
//          final Basic basic=session.getBasicRemote(); // 아래 기본 메세지 쓸 일 없어져서 주석 처리
//          basic.sendText(oldPrice); // 갱신된 값과 충돌이 일어나 주석 처리
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }

    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : AuctionController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	oldPrice = message;
    	System.out.println(oldPrice);
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}


