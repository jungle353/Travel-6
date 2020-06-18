package kr.co.travel.notice;

import java.io.Serializable;

public class NoticeDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String writer;
	private String title;
	private String content;
	private String writeday;
	private int readcnt;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int num, String writer, String title, String content, String writeday, int readcnt) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + num;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeDTO other = (NoticeDTO) obj;
		if (num != other.num)
			return false;
		return true;
	}
	
}
