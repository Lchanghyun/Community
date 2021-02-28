package story.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import story.beans.*;

@WebServlet(urlPatterns = "/chat/pwCheck.do")
public class PwCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String chat_pw = req.getParameter("chat_pw");
			int chat_no = Integer.parseInt(req.getParameter("chat_no"));
			
			ChatDao chatDao = new ChatDao();
			ChatDto chatDto = chatDao.find(chat_no);
			if(chat_pw.equals(chatDto.getChat_pw())) {
				resp.sendRedirect("chat.jsp?chat_no="+chat_no);
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("pwCheck.jsp");
				dispatcher.forward(req, resp);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
