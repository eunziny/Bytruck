package dao;

import java.util.List;

import vo.Board;

public interface BoardDAO {
	public void insertboard(Board board) throws Exception;
	int selectCount() throws Exception;
	public Board selectDetail(int boardNo, int btype) throws Exception;
	public void deleteBoard(int boardNum) throws Exception;
	public void updateboard(Board board) throws Exception;
	public List<Board> selectAll(int type) throws Exception;
	public List<Board> selectByTitle(String content, int type) throws Exception;
	public List<Board> selectByDetail(String content, int type) throws Exception;
	
}
