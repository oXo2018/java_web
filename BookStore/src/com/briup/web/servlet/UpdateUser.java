package com.briup.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.bean.User;
import com.briup.common.exception.UserException;
import com.briup.service.IUserService;
import com.briup.service.impl.IUserServiceImpl;
@WebServlet("/user/updateUserSer")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password=request.getParameter("password");
		String zip=request.getParameter("zip");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		
		user.setPassword(password);
		user.setZip(zip);
		user.setAddress(address);
		user.setPhone(phone);
		user.setEmail(email);
		
		//修改user对象之后，覆盖session中的user
		session.setAttribute("user", user);
		IUserService service=new IUserServiceImpl();
		try {
			service.updateUserInfo(user);
			request.setAttribute("msg", "用户修改成功");
			request.getRequestDispatcher("/indexSuccess.jsp")
				.forward(request, response);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
