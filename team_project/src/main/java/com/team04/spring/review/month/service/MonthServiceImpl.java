package com.team04.spring.review.month.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.review.month.dao.MonthDao;
import com.team04.spring.review.month.dto.MonthDto;

@Service
public class MonthServiceImpl implements MonthService{
	//의존 객체 DI
	@Autowired
	private MonthDao monthDao;	
	
	
	//글 저장 (썸네일 이미지 같이 전달)
	@Override
	public void saveContent(MonthDto dto, HttpSession session) {
      String id=(String)session.getAttribute("id");
      dto.setWriter(id);
      monthDao.insert(dto);
		
	}
	//글 목록 (페이징처리)
	@Override
	public void getList(ModelAndView mView, HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=6;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//startRowNum 과 endRowNum  을 MonthDto 객체에 담고
		MonthDto dto=new MonthDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
      
		//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		List<MonthDto> list=null;
		//전체 row 의 갯수를 담을 지역변수를 미리 만든다.
		int totalRow=0;
		
		//카테고리
		String category=request.getParameter("category");
		if(category==null) {
			category="";
		}
		dto.setCategory(category);
		
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_writer")){//제목 +작성자 검색인 경우
				//검색 키워드를 MonthDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);	
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);			
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);	
				// 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
			}
		}
		//글목록 얻어오기
		list=monthDao.getlist(dto);
		//글의 갯수
		totalRow=monthDao.getCount(dto);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정. 
		}
		
		//view page 에서 필요한 내용을 ModelAndView 객체에 담아준다
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("condition", condition);
		mView.addObject("keyword", keyword);
		mView.addObject("encodedK", encodedK);
		mView.addObject("totalRow", totalRow);
		mView.addObject("category",category);
		
	}
	//디테일 페이지
	@Override
	public void getDetail(int num, ModelAndView mView) {
		MonthDto dto=monthDao.getData(num);
		mView.addObject("dto",dto);
		//조회수
		monthDao.addViewCount(num);
		
	}
	//글 업데이트
	@Override
	public void updateContent(MonthDto dto) {
		monthDao.update(dto);
		
	}
	//글 삭제
	@Override
	public void deleteContent(int num) {
		monthDao.delete(num);
		
	}
	//썸네일 이미지 저장
	@Override
	public String saveImage(MultipartFile image, HttpServletRequest request) {
		//원본 파일명
		String orgFileName=image.getOriginalFilename();
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload=new File(filePath);
		if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
			upload.mkdir(); //만들어 준다.
		}
		//저장할 파일 명을 구성한다.
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//업로드 경로를 리턴한다.
		return "/upload/"+saveFileName;
	}
		
}
