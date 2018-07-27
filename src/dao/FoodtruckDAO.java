package dao;

import java.util.List;

import vo.Foodtruck;
import vo.Foodtruck_Location;

public interface FoodtruckDAO {
	public void insertfoodtruck(Foodtruck_Location fc) throws Exception;
	void insert(Foodtruck ft) throws Exception;
	public Foodtruck selectById(String id) throws Exception;
	public void update(Foodtruck ft) throws Exception;
	public List<Foodtruck_Location> selectAll() throws Exception;
	public List<Foodtruck_Location> selectByType(String type) throws Exception;
	public Foodtruck_Location selectDetail(int fNum) throws Exception;
	public void foodtruckBoardUpdate(Foodtruck_Location fc) throws Exception;
	public List<Foodtruck_Location> selectlocation(int fNum) throws Exception;
}
