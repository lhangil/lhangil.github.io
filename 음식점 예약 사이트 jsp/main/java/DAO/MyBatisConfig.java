package kr.ac.kopo.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConfig {
	
	public SqlSession session;
	
	
	
	public MyBatisConfig() {
		try {	
			String resource ="myBatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();
	      System.out.println(sqlSessionFactory);
		} catch (Exception e) {
	    	  e.printStackTrace();
	    	  
	      }
	}

  
public SqlSession getInstance() {
	return session;
}
}


