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

@WebServlet(urlPatterns = "/member/find-id.do")
public class MemberFindidServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("application/x-json; charset=UTF-8");
			req.setCharacterEncoding("UTF-8");
			
			//1. 회원 정보 추출
			MemberDto dto = new MemberDto();
			dto.setMember_name(req.getParameter("member_name"));
			dto.setMember_birth(req.getParameter("member_birth"));
			dto.setMember_email(req.getParameter("member_email"));
			
			//Member 아이디 찾기
			MemberDao dao = new MemberDao();
			boolean findId = dao.findID(dto);
			String findID;
			if(findId) {	
				MemberDto membarDto = dao.detail(dto.getMember_email());//아이디로 회원 정보 불러오기
				findID = membarDto.getMember_id();
			}else {
				findID = "";
			}
			resp.setHeader("Content-Type", "application/json");
			resp.setHeader("Content-Encoding", "UTF-8");
			
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(findID);
			resp.getWriter().print(json);
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
