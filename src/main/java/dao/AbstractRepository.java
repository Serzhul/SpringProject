package dao;

        import org.apache.ibatis.io.Resources;
        import org.apache.ibatis.session.SqlSessionFactory;
        import org.apache.ibatis.session.SqlSessionFactoryBuilder;

        import java.io.IOException;
        import java.io.InputStream;

public abstract class AbstractRepository {
    private SqlSessionFactory sqlSessionFactory;
    String resource = "dao/mybatis-Oracle.xml";//기본경로

    //xml로 sqlsessionFactory 만들기
    private void setSqlSessionFactory() {
        InputStream inputStream;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    protected SqlSessionFactory getSqlSessionFactory() {
        setSqlSessionFactory();
        return sqlSessionFactory;
    }

    //사용하려는 xml파일 지정
    public void setMybatisConfigFile(String filePath) {
        resource = filePath;
        System.out.println(filePath);
    }
}