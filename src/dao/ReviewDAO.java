package dao;

import java.util.List;

import vo.Review;

public interface ReviewDAO {
	//여행후기 글쓰기
	public void insertreview(Review rv) throws Exception;
	
	//여행후기 리스트
	public List<Review> selectAll() throws Exception;
	
	//여행후기 디테일
	public Review selectDetail (int rnum) throws Exception;
	
	//게시판 검색 - 제목으로
	public List<Review> selectByTitle(String content) throws Exception;
			
	//게시판 검색 - 내용으로
	public List<Review> selectByDetail(String content) throws Exception;
	
	public List<Review> selectlocation(int fNum)throws Exception;

}
