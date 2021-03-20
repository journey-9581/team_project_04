package com.team04.spring.review.lantour.dto;

import org.springframework.web.multipart.MultipartFile;

public class LantourDto {
	private int num;
	private String writer;
	private String title;
	private String category;
	private String content;
	private String imagePath;
	private int viewCount;
	private String regdate;	
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전 글의 글 번호
	private int nextNum; //다음 글의 글 번호
	private MultipartFile image;
	//디폴트 생성자
	public LantourDto() {}
	public LantourDto(int num, String writer, String title, String category, String content, String imagePath,
			int viewCount, String regdate, int startRowNum, int endRowNum, int prevNum, int nextNum,
			MultipartFile image) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.category = category;
		this.content = content;
		this.imagePath = imagePath;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
