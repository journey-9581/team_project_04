package com.team04.spring.service.dto;

public class FQnADto {
	private int num;
	private String title;
	private String content;
	private String writerId;
	private String regDate;
	private int bbsType;
	private int ref;
	private int secrete;
	public int getNum() {
		return num;
	}
	
	public FQnADto(int num, String title, String content, String writerId, String regDate, int bbsType, int ref,
			int secrete) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.regDate = regDate;
		this.bbsType = bbsType;
		this.ref = ref;
		this.secrete = secrete;
	}

	public FQnADto() {
		// TODO Auto-generated constructor stub
	}

	public void setNum(int num) {
		this.num = num;
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
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getBbsType() {
		return bbsType;
	}
	public void setBbsType(int bbsType) {
		this.bbsType = bbsType;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getSecrete() {
		return secrete;
	}
	public void setSecrete(int secrete) {
		this.secrete = secrete;
	}
	
}