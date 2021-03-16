package com.sysnik.selenium;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;

import com.sysnik.selenium.fw.testBase.TestBase;



@Configuration
@EnableJpaRepositories(basePackages = {"com.sysnik.selenium"})
public class AppConfig extends TestBase{
	@Bean
	public EntityManagerFactory entityManagerFactory() {
		/*
		 * LocalEntityManagerFactoryBean factoryBean = new
		 * LocalEntityManagerFactoryBean();
		 * factoryBean.setPersistenceUnitName("TestDB");
		 */
		Properties pro=new Properties();
		try {
			pro.load(new FileInputStream(relativePath()+"\\src\\main\\resources\\persistense.properties"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EntityManagerFactory factoryBean =Persistence.createEntityManagerFactory("TestDB",pro);
		
		return factoryBean;
	}
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		
		return transactionManager;
	}	
}
