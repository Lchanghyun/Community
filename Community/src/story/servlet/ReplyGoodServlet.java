package story.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import story.beans.ReplyDao;
import story.beans.ReplyDto;

@WebServlet(urlPatterns = "/board/reply_good")
public class ReplyGoodServlet extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				
				ReplyDto replyDto = new ReplyDto();
				replyDto.setReply_no(Integer.parseInt(req.getParameter("reply_no")));
				replyDto.setBoard_no(Integer.parseInt(req.getParameter("board_no")));
				
				ReplyDao replyDao = new ReplyDao();
				replyDao.plusGood(replyDto);
				
				resp.sendRedirect("detail.jsp?board_no="+replyDto.getBoard_no());
			}
			catch(Exception e) {
				e.printStackTrace();

			}
		}
	}