package service;

import java.util.List;

import dao.FoodtruckDAO;
import dao.FoodtruckDAOOracle;
import vo.Foodtruck;
import vo.Foodtruck_Location;

public class FoodtruckService {
	private FoodtruckDAO dao = new FoodtruckDAOOracle();

	public void signup(Foodtruck ft) throws Exception {
		dao.insert(ft);
	}

	public void foodtruckwrite(Foodtruck_Location fc) throws Exception{
		dao.insertfoodtruck(fc);
	}

	public Foodtruck finduser(String id) throws Exception{
		Foodtruck ft = dao.selectById(id);
		if (ft != null) {//회원이 존재할 경우
			return ft;
		}
		return null;
	}

	public void update(Foodtruck ft) throws Exception{
		dao.update(ft);
	}
	
	public List<Foodtruck_Location> findByType(String type) throws Exception{
		List<Foodtruck_Location> list = dao.selectByType(type);
		if(list.size() == 0) {
			throw new Exception("아직 푸드트럭이 등록되지 않았습니다.");
		}
		return list;
	}
	
	public Foodtruck_Location findDetail(int fNum) throws Exception {
	      return dao.selectDetail(fNum);
	}

	public void foodtruckBoardUpdate(Foodtruck_Location fc) throws Exception {
		dao.foodtruckBoardUpdate(fc);
	}
	
	public List<Foodtruck_Location> findlocation(int fNum) throws Exception{
		return dao.selectlocation(fNum);
	}
}
