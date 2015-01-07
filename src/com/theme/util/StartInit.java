package com.theme.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.theme.imp.base.HibernateSessionFactory;

public class StartInit implements ServletContextListener {
	static final Logger logger = LoggerFactory.getLogger(StartInit.class);

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		logger.info("停止");
		HibernateSessionFactory.closeSession();

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		logger.info("初始化配置文件............");
		HibernateSessionFactory.getConfiguration();
		logger.info("服务启动");
	}

}
