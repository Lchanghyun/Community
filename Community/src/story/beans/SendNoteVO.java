package story.beans;

import java.sql.Date;

public class SendNoteVO {
	private int note_no;
	private int connect_no;
	private int send_no;
	private int receive_no;
	private String note_content;
	private Date send_date;
	private String read_check;
	private String tempstore;
	private String member_nick;
	public SendNoteVO() {
		super();
	}
	public int getNote_no() {
		return note_no;
	}
	public void setNote_no(int note_no) {
		this.note_no = note_no;
	}
	public int getConnect_no() {
		return connect_no;
	}
	public void setConnect_no(int connect_no) {
		this.connect_no = connect_no;
	}
	public int getSend_no() {
		return send_no;
	}
	public void setSend_no(int send_no) {
		this.send_no = send_no;
	}
	public int getReceive_no() {
		return receive_no;
	}
	public void setReceive_no(int receive_no) {
		this.receive_no = receive_no;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public String getRead_check() {
		return read_check;
	}
	public void setRead_check(String read_check) {
		this.read_check = read_check;
	}
	public String getTempstore() {
		return tempstore;
	}
	public void setTempstore(String tempstore) {
		this.tempstore = tempstore;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
}
