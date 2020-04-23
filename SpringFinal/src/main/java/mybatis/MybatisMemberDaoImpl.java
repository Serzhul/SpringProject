package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.MemberDataBean;


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
		System.out.println("�쐞"+member.toString());
		try {
			String statement = namespace + ".insert";
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
	public String idCheck(String id) throws Exception {
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
	
	@Override
	public MemberDataBean allByIdAndEmail(MemberDataBean member) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".allByIdAndEmail";
			return sqlSession.selectOne(statement, member);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<MemberDataBean> selectEmail() throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectEmail";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

}
