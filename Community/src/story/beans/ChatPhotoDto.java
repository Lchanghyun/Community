package story.beans;

public class ChatPhotoDto {
	private int chat_photo_no;
	private int msg_no;
	private int chat_no;
	private String upload_name;
	private String save_name;
	private long photo_size;
	public int getChat_photo_no() {
		return chat_photo_no;
	}
	public void setChat_photo_no(int chat_photo_no) {
		this.chat_photo_no = chat_photo_no;
	}
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getUpload_name() {
		return upload_name;
	}
	public void setUpload_name(String upload_name) {
		this.upload_name = upload_name;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public long getPhoto_size() {
		return photo_size;
	}
	public void setPhoto_size(long photo_size) {
		this.photo_size = photo_size;
	}
	
	
}
