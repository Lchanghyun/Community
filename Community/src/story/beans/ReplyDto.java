package story.beans;

import java.util.Date;

public class ReplyDto {

	private int reply_no;
	private int board_no;
	private int member_no;
	private String reply_content;
	private int reply_good;
	private int reply_bad;
	private int claim_count;
	private Date reply_time;
	public ReplyDto() {
		super();
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getReply_good() {
		return reply_good;
	}
	public void setReply_good(int reply_good) {
		this.reply_good = reply_good;
	}
	public int getReply_bad() {
		return reply_bad;
	}
	public void setReply_bad(int reply_bad) {
		this.reply_bad = reply_bad;
	}
	public int getClaim_count() {
		return claim_count;
	}
	public void setClaim_count(int claim_count) {
		this.claim_count = claim_count;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
}
