package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

import story.util.JdbcUtil;

public class MemberDao {
	public static final String USERNAME = "story";
	public static final String PASSWORD = "story";
	
	//회원 등록
	public void insert(MemberDto memberDto)throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "insert into member values ("
				+ "member_seq.nextval, ?, ?, ?, ?, ?, ?, '1', ?, ?, ?, sysdate, '1', '1')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMember_id());
		ps.setString(2, memberDto.getMember_pw());
		ps.setString(3, memberDto.getMember_name());
		ps.setString(4, memberDto.getMember_nick());
		ps.setString(5, memberDto.getMember_email());
		ps.setString(6, memberDto.getMember_auth());
		ps.setString(7, memberDto.getMember_phone());
		ps.setString(8, memberDto.getMember_birth());
		ps.setString(9, memberDto.getMember_gender());
		ps.execute();
		
		con.close();
	}
	

}
