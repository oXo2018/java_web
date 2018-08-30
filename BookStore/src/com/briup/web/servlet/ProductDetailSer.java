package com.briup.web.servlet;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.bean.Product;
@WebServlet("/productDetail")
//热卖书点击后
public class ProductDetailSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid=request.getParameter("id");
		long id=Long.parseLong(pid);
		
		ServletContext sc=request.getServletContext();
		Set<Product> produts=
				(Set<Product>) sc.getAttribute("products");
		
		Product pro=null;
		for(Product p:produts){
			if(id==p.getId()){
				pro=p;
			}
		}
		request.setAttribute("product", pro);
		request.getRequestDispatcher("/viewBook.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
