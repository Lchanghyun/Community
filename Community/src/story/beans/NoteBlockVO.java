package story.beans;

import java.sql.Date;

public class NoteBlockVO {
	private int block_no;
	private int blocking_no;
	private int blocked_no;
	private Date block_time;
	private String member_nick;
	public NoteBlockVO() {
		super();
	}
	public int getBlock_no() {
		return block_no;
	}
	public void setBlock_no(int block_no) {
		this.block_no = block_no;
	}
	public int getBlocking_no() {
		return blocking_no;
	}
	public void setBlocking_no(int blocking_no) {
		this.blocking_no = blocking_no;
	}
	public int getBlocked_no() {
		return blocked_no;
	}
	public void setBlocked_no(int blocked_no) {
		this.blocked_no = blocked_no;
	}
	public Date getBlock_time() {
		return block_time;
	}
	public void setBlock_time(Date block_time) {
		this.block_time = block_time;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
}
