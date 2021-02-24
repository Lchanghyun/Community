package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import story.util.JdbcUtil;



public class ReplyDao {
	public static final String USERNAME = "story";
	public static final String PASSWORD = "story";
	
	// 등록
	public void insert(ReplyDto replyDto) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		
		String sql = "insert into reply values(reply_seq.nextval,?,?,?,0,0,0,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyDto.getBoard_no());
		ps.setInt(2, replyDto.getMember_no());
		ps.setString(3, replyDto.getReply_content());
		ps.execute();
		con.close();
	}
	// 목록
	public List<ReplyDto> select(int board_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		
		String sql = "select * from reply where board_no=? order by reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		ResultSet rs = ps.executeQuery();
		List<ReplyDto> replylist = new ArrayList<>();
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReply_no(rs.getInt("reply_no"));
			replyDto.setBoard_no(rs.getInt("board_no"));
			replyDto.setMember_no(rs.getInt("member_no"));
			replyDto.setReply_content(rs.getString("reply_content"));
			replyDto.setReply_good(rs.getInt("reply_good"));
			replyDto.setReply_bad(rs.getInt("reply_bad"));
			replyDto.setClaim_count(rs.getInt("claim_count"));
			replyDto.setReply_time(rs.getDate("reply_time"));
			replylist.add(replyDto);
		}
		con.close();
		return replylist;
	}
	
	// 수정
	public void update(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		
		String sql = "update reply set reply_content = ? where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReply_content());
		ps.setInt(2, replyDto.getReply_no());
		ps.execute();
		
		con.close();
	}
	
	// 삭제
	public void delete(int reply_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		
		String sql = "delete reply where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ps.execute();
		con.close();
	}
	
	// 총 갯수
	public void count(int board_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql ="select count(reply_no) from reply where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		ps.execute();
		con.close();
	} 
	
	public void plusGood(ReplyDto replyDto) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "update reply set reply_good=reply_good+1 where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyDto.getReply_no());
		ps.execute();
		con.close();
	}
}
