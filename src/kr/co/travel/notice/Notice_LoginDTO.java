package kr.co.travel.notice;

public class Notice_LoginDTO {

	private String id;
	private String pw;

	public Notice_LoginDTO() {
		// TODO Auto-generated constructor stub
	}

	public Notice_LoginDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

}
