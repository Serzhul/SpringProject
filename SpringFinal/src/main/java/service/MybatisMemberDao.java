package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.MemberDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisMemberDao {
	private final String namespace = "mybatis.Member";

	@Autowired
	public AbstractRepository opendb;

	public MemberDataBean selectById(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectById";
			return sqlSession.selectOne(statement, id);
		} finally {
			sqlSession.close();
		}
	}

	public MemberDataBean selectByEmail(String Email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectByEmail";
			return sqlSession.selectOne(statement, Email);
		} finally {
			sqlSession.close();
		}
	}

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

	public void update(MemberDataBean member) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".update";
			sqlSession.update(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public void delete(MemberDataBean member) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".delete";
			sqlSession.delete(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public List<MemberDataBean> memberList() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".memberList";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

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
	
	public MemberDataBean findId(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".findId";
			System.out.println(email);
			return sqlSession.selectOne(statement, email);
		} finally {
			sqlSession.close();
		}
	}
}
