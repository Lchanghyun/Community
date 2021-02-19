package story.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import story.beans.MemberDao;
import story.beans.MemberDto;

@WebServlet(urlPatterns = "/member/id_check.do")
public class MemberIdCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {	
			resp.setContentType("application/x-json; charset=UTF-8");
			req.setCharacterEncoding("UTF-8");
			
			String member_id = req.getParameter("member_id");

			MemberDao dao = new MemberDao();
			Boolean idCheck = dao.idCheck(member_id);
			
			
			resp.setHeader("Content-Type", "application/json");
			resp.setHeader("Content-Encoding", "UTF-8");	
			 
			resp.getWriter().print(idCheck);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	
	}
}
