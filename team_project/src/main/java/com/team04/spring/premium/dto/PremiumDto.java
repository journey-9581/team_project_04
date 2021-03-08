package com.team04.spring.premium.dto;

import org.springframework.web.multipart.MultipartFile;

public class PremiumDto {
	private int num;
	private String writer;
	private String title;
	private String imagePath;
	private String category;
	private String content;
	private int viewCount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private MultipartFile image;
	//디폴트 생성자
	public PremiumDto() {}
	public PremiumDto(int num, String writer, String title, String imagePath, String category, String content, int viewCount,
			String regdate, int startRowNum, int endRowNum, MultipartFile image) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.imagePath = imagePath;
		this.category = category;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.image = image;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
