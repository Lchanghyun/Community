package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import story.util.JdbcUtil;

public class ChatDao {
	private static String USERNAME="story";
	private static String PASSWORD="story";
	
	//시퀀스 생성
	public int getSeq() throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select chat_seq.nextval from dual";
		PreparedStatement ps =con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;
	}
	//채팅방 만들기!
	public void insert(ChatDto dto) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="insert into chat values(?,?,?)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, dto.getChat_no());
		ps.setString(2, dto.getChat_pw());
		ps.setString(3, dto.getChat_name());
		ps.execute();
		con.close();
	}
	
	public List<ChatVO> list(int start, int end) throws Exception{
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select * from (select rownum rn, TMP.* from("
				+ "select C.chat_name, CJ.join_no, CJ.member_no, CJ.chat_no "
				+ "from (chat C left outer join chat_join CJ on C.chat_no=CJ.chat_no) "
				+ "group by C.chat_name, CJ.join_no, CJ.member_no, CJ.chat_no order by CJ.chat_no desc) TMP) where rn between ? and ?";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		List<ChatVO> list = new ArrayList<>();
		while(rs.next()) {
			ChatVO vo = new ChatVO();
			vo.setChat_no(rs.getInt("chat_no"));
			vo.setChat_name(rs.getString("chat_name"));
			vo.setJoin_no(rs.getInt("join_no"));
			vo.setMember_no(rs.getInt("member_no"));
			list.add(vo);
		}
		con.close();
		return list;
	}
	
	public int count() throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select count(*) from chat";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		
		return count;
	}
	
	public int count(String key) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select count(*) from chat where instr(chat_name,?)>0";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, key);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		
		return count;
	}
	public ChatDto find(int chat_no) throws Exception {
		Connection con =JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select * from chat where chat_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, chat_no);
		ResultSet rs = ps.executeQuery();
		ChatDto dto;
		if(rs.next()) {
			dto = new ChatDto();
			dto.setChat_no(rs.getInt("chat_no"));
			dto.setChat_pw(rs.getString("chat_pw"));
			dto.setChat_name(rs.getString("chat_name"));
		}
		else dto=null;
		con.close();
		return dto;
	}
}
