package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.MemberDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisMemberDaoImpl implements MybatisMemberDao {
	private final String namespace = "mybatis.Member";

	@Autowired
	public AbstractRepository opendb;

	@Override
	public MemberDataBean selectById(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectById";
			return sqlSession.selectOne(statement, id);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public MemberDataBean selectByEmail(String Email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectByEmail";
			return sqlSession.selectOne(statement, Email);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void insert(MemberDataBean member) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insert";
			member.setAuth("normal");
			System.out.println(member.toString());
			sqlSession.insert(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void update(MemberDataBean member) {
		System.out.println(member.getNewPw());
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".update";
			sqlSession.update(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

/*	public void delete(MemberDataBean member) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".delete";
			sqlSession.delete(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}*/
	
	@Override
	public void delete(MemberDataBean vo) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".delete";
			sqlSession.delete(statement, vo);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<MemberDataBean> memberList() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".memberList";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int idCheck(String id) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".idCheck";
			System.out.println(id);
			return sqlSession.selectOne(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public String find_id(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".find_id";
			System.out.println(email);
			return sqlSession.selectOne(statement, email);
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public String check_id(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".check_id";
			System.out.println(id);
			return sqlSession.selectOne(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public String check_email(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".check_email";
			System.out.println(email);
			return sqlSession.selectOne(statement, email);
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public String join_member(MemberDataBean member) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".join_member";
			System.out.println(member);
			return sqlSession.selectOne(statement, member);
		} finally {
			sqlSession.close();
		}
	}


	
	/*public String findId(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".findId";
			System.out.println(email);
			return sqlSession.selectOne(statement, email);
		} finally {
			sqlSession.close();
		}
	}*/
	
	/*public String find_id(String email) throws Exception{
		return sqlSession.selectOne("member.find_id", email);
	}
	*/
/*	public List<MemberDataBean> findPw(MemberDataBean member) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println(member.getEmail());
			System.out.println(member.getId());
			String statement = namespace + ".findPw";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}*/
	
	/*public int findPw(String email, String id, int num) throws Exception {
	      String checkEmail = null;
	      String checkId = null;
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      
	      int x = -1;
	      try {
	    	  System.out.println(email);
	    	  System.out.println(id);
	    	  checkEmail = sqlSession.selectOne(namespace + ".getEmail", num);
	    	  checkId = sqlSession.selectOne(namespace + ".getId", num);
	         if (checkEmail.equals(email) && checkId.equals(email)) {
	            sqlSession.selectList(namespace + ".findPw", num);
	            x = 1;
	         } else {
	            x = 0;
	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         sqlSession.close();
	      }
	      return x;
	   }*/
}
