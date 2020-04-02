package service;

import java.util.List;
import java.util.Map;

public interface MainDao  {
	
	
	
	public String getUserPwd(String id);
	
	public int registProc(Map<String, Object> paramMap);

	public List customView(Map<String, Object> paramMap);

	public List userInfo(String id);

	public int changePw(Map<String, Object> paramMap);

	public int changePlug(Map<String, Object> paramMap);

	public int changeEmail(Map<String, Object> paramMap);

	public String idchk(Map<String, Object> paramMap);

	public List getPlugInfo(String id);

	public int registPlug(Map<String, Object> paramMap);

	public int addPlug(Map<String, Object> paramMap);

	public int deletingPlug(Map<String, Object> paramMap);

	public String getPw(Map<String, Object> paramMap);

	public Object unregist(Map<String, Object> paramMap);

	public Object deleteAll(Map<String, Object> paramMap);
	
	
}
