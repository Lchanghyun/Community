package story.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import story.util.JdbcUtil;

public class NoteDao {
	public static final String USERNAME = "story";
	public static final String PASSWORD = "story";
	
	//받은쪽지함 목록구하기
		public List<ReceiveNoteVO> ReceiveNoteList(int receive_no) throws Exception{
			Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
			String sql = "select R.*, member_nick from(receivenote R inner join member M on R.send_no=M.member_no) "
					+ "where receive_no=? and store_check='0' order by note_no desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, receive_no);
			ResultSet rs = ps.executeQuery();
			List<ReceiveNoteVO> list = new ArrayList<>();
			while(rs.next()) {
				ReceiveNoteVO vo = new ReceiveNoteVO();
				vo.setNote_no(rs.getInt("note_no"));
				vo.setNote_content(rs.getString("note_content"));
				vo.setSend_date(rs.getDate("send_date"));
				vo.setSend_no(rs.getInt("send_no"));
				vo.setReceive_no(rs.getInt("receive_no"));
				vo.setRead_check(rs.getString("read_check"));
				vo.setStore_check(rs.getString("store_check"));
				vo.setMember_nick(rs.getString("member_nick"));
				list.add(vo);
			}
			con.close();
			return list;
		}
	
	//보낸쪽지함 목록구하기
	public List<SendNoteVO> SendNoteList(int send_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select S.*, member_nick from(sendnote S inner join member M on S.receive_no=M.member_no) "
				+ "where send_no=? and tempstore='0' order by note_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, send_no);
		ResultSet rs = ps.executeQuery();
		List<SendNoteVO> list = new ArrayList<>();
		while(rs.next()) {
			SendNoteVO vo = new SendNoteVO();
			vo.setNote_no(rs.getInt("note_no"));
			vo.setConnect_no(rs.getInt("connect_no"));
			vo.setNote_content(rs.getString("note_content"));
			vo.setSend_date(rs.getDate("send_date"));
			vo.setSend_no(rs.getInt("send_no"));
			vo.setReceive_no(rs.getInt("receive_no"));
			vo.setRead_check(rs.getString("read_check"));
			vo.setTempstore(rs.getString("tempstore"));
			vo.setMember_nick(rs.getString("member_nick"));
			list.add(vo);
		}
		con.close();
		return list;
	}
	
	//보관쪽지함 목록구하기
	public List<ReceiveNoteVO> StoreNoteList(int member_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select R.*, member_nick from(receivenote R inner join member M on R.send_no=M.member_no) "
				+ "where receive_no=? and store_check='1' order by note_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();
		List<ReceiveNoteVO> list = new ArrayList<>();
		while(rs.next()) {
			ReceiveNoteVO vo = new ReceiveNoteVO();
			vo.setNote_no(rs.getInt("note_no"));
			vo.setNote_content(rs.getString("note_content"));
			vo.setSend_date(rs.getDate("send_date"));
			vo.setSend_no(rs.getInt("send_no"));
			vo.setReceive_no(rs.getInt("receive_no"));
			vo.setRead_check(rs.getString("read_check"));
			vo.setStore_check(rs.getString("store_check"));
			vo.setMember_nick(rs.getString("member_nick"));
			list.add(vo);
		}
		con.close();
		return list;
	}
	
	//임시저장함 목록구하기
	public List<SendNoteVO> TempNoteList(int member_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select S.*, member_nick from(sendnote S inner join member M on S.receive_no=M.member_no) "
				+ "where send_no=? and (tempstore='1' or tempstore='2') order by note_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();
		List<SendNoteVO> list = new ArrayList<>();
		while(rs.next()) {
			SendNoteVO vo = new SendNoteVO();
			vo.setNote_no(rs.getInt("note_no"));
			vo.setConnect_no(rs.getInt("connect_no"));
			vo.setNote_content(rs.getString("note_content"));
			vo.setSend_date(rs.getDate("send_date"));
			vo.setSend_no(rs.getInt("send_no"));
			vo.setReceive_no(rs.getInt("receive_no"));
			vo.setRead_check(rs.getString("read_check"));
			vo.setTempstore(rs.getString("tempstore"));
			vo.setMember_nick(rs.getString("member_nick"));
			list.add(vo);
		}
		con.close();
		return list;
	}
	
	//검색했을 때 상황에 따른 쪽지목록구하기
	public List<ReceiveNoteVO> SearchNoteList(String type1, String type2, String key, int member_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql;
		PreparedStatement ps;
		if(type1.equals("receive")) {//받은쪽지함
			sql="select R.*, member_nick from(receivenote R inner join member M on R.send_no=M.member_no) "
					+ "where instr(#1,?)>0 and receive_no=? and store_check='0' order by note_no desc";
			sql = sql.replace("#1", type2);
			ps = con.prepareStatement(sql);
			ps.setString(1, key);
			ps.setInt(2, member_no);
		}
		else if(type1.equals("send")) {//보낸쪽지함
			sql="select S.*, member_nick from(sendnote S inner join member M on S.receive_no=M.member_no) "
					+ "where instr(#1,?)>0 and send_no=? and tempstore='0' order by note_no desc";
			sql = sql.replace("#1", type2);
			ps = con.prepareStatement(sql);
			ps.setString(1, key);
			ps.setInt(2, member_no);
		}
		else if(type1.equals("store")){//보관한 쪽지목록
			sql="select R.*, member_nick from(receivenote R inner join member M on R.send_no=M.member_no) "
					+ "where instr(#1,?)>0 and receive_no=? and store_check='1' order by note_no desc";
			sql = sql.replace("#1", type2);
			ps = con.prepareStatement(sql);
			ps.setString(1, key);
			ps.setInt(2, member_no);
		}
		else {//임시저장 쪽지함
			sql="select S.*, member_nick from(sendnote S inner join member M on S.receive_no=M.member_no) "
					+ "where instr(#1,?)>0 and send_no=? and (tempstore='1' or tempstore='2') order by note_no desc";
			sql = sql.replace("#1", type2);
			ps = con.prepareStatement(sql);
			ps.setString(1, key);
			ps.setInt(2, member_no);
		}
		ResultSet rs = ps.executeQuery();
		List<ReceiveNoteVO> list = new ArrayList<>();
		while(rs.next()) {
			ReceiveNoteVO vo = new ReceiveNoteVO();
			vo.setNote_no(rs.getInt("note_no"));
			vo.setNote_content(rs.getString("note_content"));
			vo.setSend_date(rs.getDate("send_date"));
			vo.setSend_no(rs.getInt("send_no"));
			vo.setReceive_no(rs.getInt("receive_no"));
			vo.setRead_check(rs.getString("read_check"));
			//vo.setStore_check(rs.getString("store_check"));
			vo.setMember_nick(rs.getString("member_nick"));
			list.add(vo);
		}
		con.close();
		return list;
	}
	
	//차단회원 목록
	public List<NoteBlockVO> BlockList(int member_no) throws Exception{
		Connection con = JdbcUtil.getConnection(USERNAME, PASSWORD);
		String sql = "select B.*, member_nick from(block B inner join member M on B.blocked_no=M.member_no) "
				+ "where blocking_no=? order by block_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();
		List<NoteBlockVO> list = new ArrayList<>();
		while(rs.next()) {
			NoteBlockVO vo = new NoteBlockVO();
			vo.setBlock_no(rs.getInt("block_no"));
			vo.setBlocking_no(rs.getInt("blocking_no"));
			vo.setBlocked_no(rs.getInt("blocked_no"));
			vo.setBlock_time(rs.getDate("block_time"));
			vo.setMember_nick(rs.getString("member_nick"));
			list.add(vo);
		}
		con.close();
		return list;
	}
}
