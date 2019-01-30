package org.srm.mdm.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.annotation.Configuration;

//监听ServletContext  创建   生命周期 开始于服务器启动  结束于 服务器关闭
@Configuration //服务器启动时就会加载
public class ObjListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context  = sce.getServletContext();
		context.setAttribute("path", context.getContextPath());
		System.out.println("服务器启动");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
