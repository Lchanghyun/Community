package story.beans;

import java.util.Date;

public class Re_ReplyDto {
	private int re_reply_no;
	private int member_no;
	private int reply_no;
	private int board_no;
	private String re_reply_content;
	private int re_reply_good;
	private int re_reply_bad;
	private int claim_count;
	private Date re_reply_time;
	public Re_ReplyDto() {
		super();
	}
	public int getRe_reply_no() {
		return re_reply_no;
	}
	public void setRe_reply_no(int re_reply_no) {
		this.re_reply_no = re_reply_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
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
	public String getRe_reply_content() {
		return re_reply_content;
	}
	public void setRe_reply_content(String re_reply_content) {
		this.re_reply_content = re_reply_content;
	}
	public int getRe_reply_good() {
		return re_reply_good;
	}
	public void setRe_reply_good(int re_reply_good) {
		this.re_reply_good = re_reply_good;
	}
	public int getRe_reply_bad() {
		return re_reply_bad;
	}
	public void setRe_reply_bad(int re_reply_bad) {
		this.re_reply_bad = re_reply_bad;
	}
	public int getClaim_count() {
		return claim_count;
	}
	public void setClaim_count(int claim_count) {
		this.claim_count = claim_count;
	}
	public Date getRe_reply_time() {
		return re_reply_time;
	}
	public void setRe_reply_time(Date re_reply_time) {
		this.re_reply_time = re_reply_time;
	}
	
}
