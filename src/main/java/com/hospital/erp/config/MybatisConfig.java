package com.hospital.erp.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class MybatisConfig {

	/*
	 * @Bean SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws
	 * Exception { SqlSessionFactoryBean sqlSessionFactoryBean = new
	 * SqlSessionFactoryBean(); sqlSessionFactoryBean.setDataSource(dataSource);
	 * sqlSessionFactoryBean.setConfigLocation(new
	 * ClassPathResource("mybatis/mybatis-config.xml"));
	 * 
	 * return sqlSessionFactoryBean.getObject(); }
	 * 
	 * @Bean SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory
	 * sqlSessionFactory) { return new SqlSessionTemplate(sqlSessionFactory); }
	 */
    
}
