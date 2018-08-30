package com.briup.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//规定拦截资源的位置
//项目名字后面跟了user的所有资源都拦截
//拦截的资源全部交给doFilter去处理
@WebFilter("/user/*")
public class LoginFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		//判断用户有没有登陆，判断的依据session中是否有user
		//有放行，没有拦截
		HttpSession session=req.getSession();
		Object obj=session.getAttribute("user");
		if(obj==null){
			//没有登陆过
			req.setAttribute("msg", "亲！请先登陆");
			req.getRequestDispatcher("/login.jsp").forward(req, res);
		}else{
			//原来请求什么资源还是接着请求什么资源
			chain.doFilter(request, response);
		}
	}
	
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
