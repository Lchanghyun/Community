package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import story.util.JdbcUtil;

public class ChatJoinDao {
	private static String USERNAME="story";
	private static String PASSWORD="story";
	
	public int getSeq() throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select chat_join_seq.nextval from dual";
		PreparedStatement ps =con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}
	
	public void insert(ChatJoinDto dto) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="insert into chat_join values(?,?,?,sysdate)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, dto.getJoin_no());
		ps.setInt(2, dto.getChat_no());
		ps.setInt(3, dto.getMember_no());
		ps.execute();
		con.close();
	}
	public ChatJoinDto find(int member_no) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select * from chat_join where member_no=?";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs= ps.executeQuery();
		ChatJoinDto dto;
		if(rs.next()) {
			dto=new ChatJoinDto();
			dto.setChat_no(rs.getInt("chat_no"));
			dto.setJoin_no(rs.getInt("join_no"));
			dto.setMember_no(rs.getInt("member_no"));
		}
		else {
			dto=null;
		}
		con.close();
		return dto;
	}
	public int joinCount(int chat_no) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select count(*) from chat_join where chat_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, chat_no);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		
		return count;
	}
}
