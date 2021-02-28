package story.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@ServerEndpoint("/chat/websocket")
public class WebSocket extends HttpServlet{
	
	private static Map<String, List<Session>> chatMap = new HashMap<>();	 // 채팅방 별로 리스트를 관리하는 Map
	private static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>()); //사용자의 세션을 저장하는 리스트
	
	//webSocket이 열리면(브라우저와 연결되면) 요청되는 함수 
	@OnOpen
	public void open(Session session) {
		System.out.println("채팅창 오픈");
	}
	//webSocket에 메세지가 도착하면 요청되는 함수
	@OnMessage
	public String message(String data, Session userSession) throws ParseException {
		System.out.println(data);
		
		JSONParser parser = new JSONParser(); //String으로 받은 걸 다시 JSON형식으로 바꿔주기 위한 객체 생성
		Object obj = parser.parse(data);      //Object에 담고
		JSONObject json = (JSONObject) obj;   //JSON으로 변환
		
		//JSON에서 값을 추출
		String chat_no = (String) json.get("chat_no"); 
		String msg = (String) json.get("msg");
		String nick = (String) json.get("nick");
		String type = (String) json.get("type");
		//화면에 출력할 메세지 생성
		String result="";
		switch(type) {
			case "open" : 
				result=nick+"님이 "+msg;
				if(chatMap.get(chat_no)==null) {
					chatMap.put(chat_no,sessionList); //최초 개설이면 map에 chat_no을 삽입
				}
				else {
					sessionList=chatMap.get(chat_no);
					sessionList.add(userSession);	//이미 개설된 채팅방이면 session을 추가
					chatMap.put(chat_no,sessionList); //sessionList 갱신
				}
				break;
			case "msg" : result=nick+" : "+msg;
				break;
			case "close" : result=nick+"님이 "+msg;
				sessionList=chatMap.get(chat_no);
				sessionList.remove(userSession); //session 제거
				chatMap.put(chat_no,sessionList); //sessionList 갱신
				break;
		}		
		//같은 chat_no에 속해 있는 session들에게 메세지 뿌리기
		chatMap.get(chat_no).forEach(session->{
			
			if(session==userSession) {
				return; //중복방지
			}
			else {
				try {
					session.getBasicRemote().sendText(data); //data원형을 뿌려주기
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("error!");
				}
			}
		});
		return result;
	}
	//webSocket이 닫히면(브라우저와 연결이 끊기면) 요청되는 함수
	@OnClose
	public void close(Session session) {
		System.out.println("채팅창 닫힘");
	}
	//에러 발생시 요청되는 함수
	@OnError
	public void error(Throwable t) {
		t.printStackTrace();
	}
}
