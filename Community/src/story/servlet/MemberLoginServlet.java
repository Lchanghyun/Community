package story.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import story.beans.MemberDao;
import story.beans.MemberDto;


@WebServlet(urlPatterns = "/member/login.do")
public class MemberLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//1. 아이디 및 비밀 번호 추출
			req.setCharacterEncoding("UTF-8");
			MemberDto dto = new MemberDto();
			dto.setMember_id(req.getParameter("member_id"));
			dto.setMember_pw(req.getParameter("member_pw"));
			
			//Member 로그인
			MemberDao dao = new MemberDao();
			boolean login = dao.login(dto);
			
			if(login) {
				MemberDto membarDto = dao.find(dto.getMember_id());//아이디로 회원 정보 불러오기
				req.getSession().setAttribute("check", membarDto.getMember_no());
				resp.sendRedirect(req.getContextPath()+"/index.jsp");//절대경로
			}else {
				resp.sendRedirect("login.jsp?error");//상대경로
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	
	}
}
