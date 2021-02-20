package story.servlet;

import java.util.*;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/chat/websocket")
public class WebSocket{
	
	List<Session> sessionList = new ArrayList<>(); //사용자의 세션을 저장하는 리스트
	Map<Integer, List<Session>> map = new HashMap<>(); // 채팅방 별로 리스트를 관리하는 Map 
	//webSocket이 열리면(브라우저와 연결되면) 요청되는 함수 
	@OnOpen
	public void open(Session session) {
		System.out.println("채팅창 오픈");
		sessionList.add(session); //세션을 받아서 세션리스트에 저장		
	}
	//webSocket에 메세지가 도착하면 요청되는 함수
	@OnMessage
	public String message(String message, Session session) {
		System.out.println("메세지 : " + message);
		return message;
	}
	//webSocket이 닫히면(브라우저와 연결이 끊기면) 요청되는 함수
	@OnClose
	public void close() {
		System.out.println("채팅창 닫힘");
	}
	//에러 발생시 요청되는 함수
	@OnError
	public void error(Throwable t) {
		t.printStackTrace();
	}
}
