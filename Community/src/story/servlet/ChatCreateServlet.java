package story.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import story.beans.*;

@WebServlet(urlPatterns ="/chat/create.do")
public class ChatCreateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int member_no= Integer.parseInt(req.getParameter("member_no"));
			String chat_name = req.getParameter("chat_name");
			ChatDao chatDao = new ChatDao();
			int chat_no=chatDao.getSeq();
			ChatDto chatDto = new ChatDto();
			chatDto.setChat_no(chat_no);
			chatDto.setChat_name(chat_name);
			//임시 비밀번호 발급
			List<String> list = new ArrayList<>();
			for(int i=0; i<10; i++) {
				list.add(String.valueOf(i));
			}
			for(char i='a'; i<='z'; i++) {
				list.add(String.valueOf(i));
				list.add(String.valueOf(i).toUpperCase());
			}
			Collections.shuffle(list);
			String password="";
			for(int i=0; i<10; i++) {
				password+=list.get(i);
			}
			chatDto.setChat_pw(password);
			chatDao.insert(chatDto);
			ChatJoinDao chatJoinDao = new ChatJoinDao();
			
			ChatJoinDto chatJoinDto = new ChatJoinDto();
			int join_no=chatJoinDao.getSeq();
			chatJoinDto.setJoin_no(join_no);
			chatJoinDto.setChat_no(chat_no);
			chatJoinDto.setMember_no(member_no);
			chatJoinDao.insert(chatJoinDto);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
