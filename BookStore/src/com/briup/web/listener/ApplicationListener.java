package com.briup.web.listener;

import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.briup.bean.Category;
import com.briup.bean.Product;
import com.briup.bean.Report;
import com.briup.common.exception.ProductException;
import com.briup.common.exception.ReportException;
import com.briup.service.ICategoryService;
import com.briup.service.IProductService;
import com.briup.service.IReportService;
import com.briup.service.impl.ICategoryServiceImpl;
import com.briup.service.impl.IProductServiceImpl;
import com.briup.service.impl.IReportServiceImpl;
/**
 *对application（ServletContext）对象监听 
 *application生命周期：始于tomcat终止与tomcat
 *
 */
@WebListener
public class ApplicationListener implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	//获取application(ServletContext)容器对象
    	ServletContext sc=arg0.getServletContext();
    	
    	ICategoryService service=new ICategoryServiceImpl();
    	List<Category> list=service.listCategory();
    	sc.setAttribute("cates", list);
    	
    	
    	//存储简报
    	IReportService service_r=new IReportServiceImpl();
    	try {
			List<Report> rp=service_r.listReport();
			
			Set<Report> set=new TreeSet<>(new Comparator<Report>() {
				@Override
				public int compare(Report o1, Report o2) {
					// TODO Auto-generated method stub
					return o2.getRank()-o1.getRank();
				}
			});
			for(Report r:rp){
				set.add(r);
			}
			sc.setAttribute("reports", set);
			
			
	//存储主页的推荐的3个商品
			IProductService proser=new IProductServiceImpl();
			Set<Product> pros=proser.listAllProduct();
			sc.setAttribute("products", pros);
		} catch (ReportException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProductException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
}






