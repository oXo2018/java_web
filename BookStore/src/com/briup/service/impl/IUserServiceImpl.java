package com.briup.service.impl;

import com.briup.bean.User;
import com.briup.common.exception.UserException;
import com.briup.dao.IUserDao;
import com.briup.dao.impl.IUserDaoImpl;
import com.briup.service.IUserService;

public class IUserServiceImpl implements IUserService{
	private IUserDao dao=new IUserDaoImpl();
	@Override
	public void registerUser(User user) throws UserException {
		// TODO Auto-generated method stub
		dao.saveUser(user);
	}

	@Override
	public User loginUser(String name, String password) throws UserException {
		// TODO Auto-generated method stub
		User user=dao.findUserByName(name);
		if(user==null){
			throw new UserException("用户不存在");
		}else{
			if(password.equals(user.getPassword())){
				return user;
			}else{
				throw new UserException("密码错误");
			}
		}
	}

	@Override
	public User getUserByName(String name) throws UserException {
		// TODO Auto-generated method stub
		User user=dao.findUserByName(name);
		return user;
	}

	@Override
	public void updateUserInfo(User user) throws UserException {
		// TODO Auto-generated method stub
		dao.updateUser(user);
	}

}





