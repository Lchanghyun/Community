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
	//상세보기(단일조회)
	public MemberDto find(String member_id) throws Exception {
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql="select * from member where member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
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
		con.close();
		return dto;
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
		con.close();
		return dto;
	}

	// Id 중복 검사
	public boolean idCheck(String member_id)throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select member_id from member where member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ResultSet rs = ps.executeQuery();
		
		boolean result = rs.next(); // id가 있는지 확인
		
		con.close();
		return result;
	}
	// 닉네임 중복검사
	public boolean nickCheck(String member_nick)throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select member_id from member where member_nick=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_nick);
		ResultSet rs = ps.executeQuery();
		
		boolean result = rs.next(); // nick가 있는지 확인
		
		con.close();
		return result;
	}
	//로그인 검사
	public boolean login(MemberDto memberDto) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select * from member where member_id=? and member_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMember_id());
		ps.setString(2, memberDto.getMember_pw());
		ResultSet rs = ps.executeQuery();
		
		boolean result = rs.next(); // id와 pw가 있는지 확인
		
		con.close();
		return result;
	}
}
