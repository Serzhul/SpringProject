package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import mybatis.MainDao;


@Service
public class MainServiceImpl implements MainService {
	

	private MainDao mainDao;


	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	

	@Override
	public String getPw(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.getPw(paramMap);
	}

	@Override
	public int registProc(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.registProc(paramMap);
	}

	
	@Override
	public List customView(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.customView(paramMap);
	}


	@Override
	public List userInfo(String id) {
		// TODO Auto-generated method stub
		return mainDao.userInfo(id);
	}


	@Override
	public int changePw(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.changePw(paramMap);
	}


	@Override
	public int changeEmail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.changeEmail(paramMap);
	}


	@Override
	public int changePlug(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.changePlug(paramMap);
	}


	@Override
	public String idchk(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.idchk(paramMap);
	}


	@Override
	public List getPlugInfo(String id) {
		// TODO Auto-generated method stub
		return mainDao.getPlugInfo(id);
	}


	@Override
	public int registPlug(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.registPlug(paramMap);
	}
	@Override
	public void unregist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		mainDao.unregist(paramMap);
	}
	

	@Override
	public int addPlug(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.addPlug(paramMap);
	}


	@Override
	public int deletingPlug(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDao.deletingPlug(paramMap);
	}




	@Override
	public String getUserPwd(String id) {
		// TODO Auto-generated method stub
		return mainDao.getUserPwd(id);
	}




	@Override
	public Object deleteAll(Map<String, Object> paramMap) {
		return mainDao.deleteAll(paramMap);
		
	}




	

	
}
