package dao;

import java.util.List;

import vo.Profit;

public interface ProfitDAO {
	public List<Profit> selectProfit() throws Exception;
}