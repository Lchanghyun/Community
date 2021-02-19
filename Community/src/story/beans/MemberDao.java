package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	public MemberDto find(int member_no) throws Exception {
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select * from member where member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs= ps.executeQuery();
		
		MemberDto dto;
		if(rs.next()) {
			dto=new MemberDto();
			dto.setMember_no(rs.getInt("member_no"));;
			dto.setMember_id(rs.getString("member_id"));
			dto.setMember_pw(rs.getString("member_pw"));
			dto.setMember_name(rs.getString("member_name"));
			dto.setMember_nick(rs.getString("member_nick"));
			dto.setMember_email(rs.getString("member_email"));
			dto.setMember_auth(rs.getString("member_auth"));
			dto.setMember_phone(rs.getString("member_phone"));
			dto.setMember_birth(rs.getString("member_birth"));
			dto.setMember_gender(rs.getString("member_gender"));
		}
		else {
			dto=null;
		}
		return dto;
	}

}
