package dao;

import java.util.List;

import vo.Advertisement;

public interface AdvertiseDAO {
	public void insertAd(Advertisement ad) throws Exception;
	public List<Advertisement> selectAll() throws Exception;
	public List<Advertisement> selectAllAd() throws Exception;
	public Advertisement selectDetail(int no) throws Exception;
	
	//게시판 검색 - 제목으로
	public List<Advertisement> selectByTitle(String content) throws Exception;
			
	//게시판 검색 - 내용으로
	public List<Advertisement> selectByDetail(String content) throws Exception;
	
}
