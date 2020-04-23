package mybatis;

import java.util.List;

import model.MemberDataBean;

public interface MybatisMemberDao {

	// �븘�씠�뵒 寃��깋
	public MemberDataBean selectById(String id) throws Exception;

	// �씠硫붿씪 寃��깋
	public MemberDataBean selectByEmail(String Email) throws Exception;

	
	// �쉶�썝 媛��엯
	public void insert(MemberDataBean member) throws Exception;

	// �젙蹂� �닔�젙
	public void update(MemberDataBean member) throws Exception;

	//�쉶�썝 �깉�눜
	public void delete(MemberDataBean member) throws Exception;
	
	//�쉶�썝 由ъ뒪�듃
	public List<MemberDataBean> memberList() throws Exception;
	// 이메일
	public List<MemberDataBean> selectEmail() throws Exception;
	//�븘�씠�뵒 以묐났 泥댄겕
	public String idCheck(String id) throws Exception ;
	
	public String find_id(String email) throws Exception;
	public String check_id(String id) throws Exception;
	
	public String check_email(String email) throws Exception;
	
	public String join_member(MemberDataBean member)throws Exception;

	public MemberDataBean allByIdAndEmail(MemberDataBean member);

}