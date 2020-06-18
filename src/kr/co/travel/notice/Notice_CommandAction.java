package kr.co.travel.notice;

public class Notice_CommandAction {
	private boolean isReDirect;
	private String where;
	
	public Notice_CommandAction() {
		// TODO Auto-generated constructor stub
	}

	public boolean isReDirect() {
		return isReDirect;
	}

	public void setReDirect(boolean isReDirect) {
		this.isReDirect = isReDirect;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public Notice_CommandAction(boolean isReDirect, String where) {
		super();
		this.isReDirect = isReDirect;
		this.where = where;
	}
	
	
}
