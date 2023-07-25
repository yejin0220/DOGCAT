package com.kh.chat;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.member.model.vo.Member;

//handshake 설정하기 위한 클래스를 지정한다.
@ServerEndpoint(value = "/chattingServer", configurator = HttpSessionConfigurator.class)
public class ChattingServer {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	private HttpSession hSession;
	
	@OnOpen // 
	public void onConnect(Session session, EndpointConfig config) { 
		this.hSession = (HttpSession)config.getUserProperties().get("hSession"); // 넣어놨던 HTTP Session을 꺼낸다.
		
		int crNo = (int)hSession.getAttribute("crNo");
		session.getUserProperties().put("crNo", crNo);
		
		clients.add(session);
//		System.out.println(hSession.getAttribute("loginUser")); // 세션 안의 키를 통해 값을 꺼낸다.
		
	}
	
	@OnMessage
	public void onMessage(String message) {
		synchronized (clients) {
			
			int crNo = (int)hSession.getAttribute("crNo");
			Member loginUser = (Member) hSession.getAttribute("loginUser");
			int loginUserNo = loginUser.getUserNo();
				
			try {
				for(Session client : clients) {
					
					if((int)client.getUserProperties().get("crNo") == crNo) {
						JsonObject data = new JsonObject();
						data.addProperty("sender", loginUserNo);
						data.addProperty("msg", message);
						
						JsonArray arr = new JsonArray();
						arr.add(data);

						client.getBasicRemote().sendText(arr.toString());						
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnClose // 연결을 클라이언트에서 끊었을 때 동작
	public void onClose(Session session) {
		clients.remove(session); // 이 세션은 이 엔드포인트에서만 사용한다.
	}
}
