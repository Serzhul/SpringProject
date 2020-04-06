package mybatis;

import java.util.List;

import model.MemberDataBean;

public interface MybatisMemberDao {

	// 아이디 검색
	public MemberDataBean selectById(String id) throws Exception;

	// 이메일 검색
	public MemberDataBean selectByEmail(String Email) throws Exception;

	// 회원 가입
	public void insert(MemberDataBean member) throws Exception;

	// 정보 수정
	public void update(MemberDataBean member) throws Exception;

	//회원 탈퇴
	public void delete(MemberDataBean member) throws Exception;
	
	//회원 리스트
	public List<MemberDataBean> memberList() throws Exception;

	//아이디 중복 체크
	public int idCheck(String id) throws Exception ;
	
	public String find_id(String email) throws Exception;
	public String check_id(String id) throws Exception;
	
	public String check_email(String email) throws Exception;
	
	public String join_member(MemberDataBean member)throws Exception;

}