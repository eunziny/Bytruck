package service;

import java.util.List;

import dao.BoardDAO;
import dao.BoardDAOOracle;
import vo.Board;

public class BoardService {
	private BoardDAO dao = new BoardDAOOracle();
	public void write(Board board) throws Exception{
		dao.insertboard(board);
	}
	
	public int findCount() throws Exception{
		return dao.selectCount();
	}
	
	/*public List<Board> findAll(int page) throws Exception{
		return dao.selectAll(page);
	}*/
	
	public Board findDetail(int boardNo, int btype) throws Exception {
		return dao.selectDetail(boardNo, btype);
	}
	
	public void addWrite(Board board) throws Exception{
		dao.insertboard(board);
	};
	
	public void Delete(int boardNum) throws Exception{
		dao.deleteBoard(boardNum);
	};
	
	public void modify(Board board) throws Exception{
		dao.updateboard(board);
	}
	
	public List<Board> findAll(int type) throws Exception {
		List<Board> list = dao.selectAll(type);
		if(list.size() ==0) {
			throw new Exception("등록된 글이 없습니다.");
		}
		return list;
	}
	
	//게시판 검색 - 제목(title)으로 검색
	public List<Board> findByTitle(String content, int type) throws Exception{
		List<Board> list = dao.selectByTitle(content, type);
		if(list.size() == 0) {
			throw new Exception("해당 글이 없습니다.");
		}
		return list;
	}
	
	//게시판 검색 - 내용(detail)으로 검색
	public List<Board> findByDetail(String content, int type) throws Exception{
		List<Board> list = dao.selectByDetail(content, type);
		if(list.size() == 0) {
			throw new Exception("해당 글이 없습니다.");
		}
		return list;
	}
}
