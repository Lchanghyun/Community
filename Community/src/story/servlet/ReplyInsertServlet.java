package story.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import story.beans.ReplyDao;
import story.beans.ReplyDto;

@WebServlet(urlPatterns = "/board/reply_insert.do")
public class ReplyInsertServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			ReplyDto replyDto = new ReplyDto();
			replyDto.setBoard_no(Integer.parseInt(req.getParameter("board_no")));
			replyDto.setMember_no(Integer.parseInt(req.getParameter("member_no")));
			replyDto.setReply_content(req.getParameter("reply_content"));
			
			ReplyDao replyDao = new ReplyDao();
			replyDao.insert(replyDto);
			
			resp.sendRedirect("detail.jsp?board_no="+replyDto.getBoard_no());
		}
		catch(Exception e) {
			e.printStackTrace();

		}
	}
}
