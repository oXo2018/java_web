package com.briup.dao;
import java.util.List;
import java.util.Set;

import com.briup.bean.Product;


public interface IProductDao {
	//查询主页的产品
	public	List<Product> findAllProduct();
}