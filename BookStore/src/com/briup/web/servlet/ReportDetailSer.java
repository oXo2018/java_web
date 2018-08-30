package com.briup.web.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.bean.Report;
@WebServlet("/reportDetailSer")
//简报
public class ReportDetailSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		ServletContext sc=request.getServletContext();
		
		Set<Report> set=(Set<Report>) sc.getAttribute("reports");
		Report report=null;
		
		//将数字类型的字符串转化为long类型
		long idd=Long.parseLong(id);
		
		String date=null;
		
		for(Report s:set){
			if(s.getId()==idd){
				report=s;
				SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
				date=f.format(s.getPublish_date());
			}
		}
		
		request.setAttribute("date", date);
		request.setAttribute("report", report);
		request.getRequestDispatcher("/detail.jsp")
			.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
