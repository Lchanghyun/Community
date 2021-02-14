package story.beans;

import java.sql.Date;

public class MemberDto {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nick;
	private String member_email;
	private String member_auth;
	private String member_level;
	private String member_phone;
	private String member_birth;
	private String member_gender;
	private Date member_join_date;
	private String agreement_use;
	private String agreement_privacy;
	
	public MemberDto() {
		super();
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(String member_auth) {
		this.member_auth = member_auth;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public Date getMember_join_date() {
		return member_join_date;
	}

	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}

	public String getAgreement_use() {
		return agreement_use;
	}

	public void setAgreement_use(String agreement_use) {
		this.agreement_use = agreement_use;
	}

	public String getAgreement_privacy() {
		return agreement_privacy;
	}

	public void setAgreement_privacy(String agreement_privacy) {
		this.agreement_privacy = agreement_privacy;
	}
	
	
	
}
