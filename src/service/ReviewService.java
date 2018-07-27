package service;

import java.util.List;

import dao.ReviewDAO;
import dao.ReviewDAOOracle;
import vo.Review;

public class ReviewService {
	private ReviewDAO dao = new ReviewDAOOracle();
	
	//여행후기 글쓰기 등록
	public void reviewwrite(Review rv) throws Exception {
		dao.insertreview(rv);
	}
	
	//여행후기 리스트
	public List<Review> findAll() throws Exception {
		List<Review> list = dao.selectAll();
		if(list.size() ==0) {
			throw new Exception("등록된 여행후기가 없습니다.");
		}
		return list;
	}
	
	//여행후기 디테일
	public Review findDetail(int bnum) throws Exception {
	      return dao.selectDetail(bnum);
	}
	
	//게시판 검색 - 제목(title)으로 검색
	public List<Review> findByTitle(String content) throws Exception{
		List<Review> list = dao.selectByTitle(content);
		if(list.size() == 0) {
			throw new Exception("해당 글이 없습니다.");
		}
		return list;
	}
	
	//게시판 검색 - 내용(detail)으로 검색
	public List<Review> findByDetail(String content) throws Exception{
		List<Review> list = dao.selectByDetail(content);
		if(list.size() == 0) {
			throw new Exception("해당 글이 없습니다.");
		}
		return list;
	}
	
	public List<Review> findlocation(int fNum) throws Exception{
		return dao.selectlocation(fNum);
	}

}
