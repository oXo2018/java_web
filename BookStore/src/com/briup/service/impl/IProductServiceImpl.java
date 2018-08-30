package com.briup.service.impl;

import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.briup.bean.Product;
import com.briup.common.exception.ProductException;
import com.briup.dao.IProductDao;
import com.briup.dao.impl.IProductDaoImpl;
import com.briup.service.IProductService;

public class IProductServiceImpl implements IProductService{
	private IProductDao dao=new IProductDaoImpl();
	@Override
	public Set<Product> listAllProduct() throws ProductException {
		// TODO Auto-generated method stub
		List<Product> list=dao.findAllProduct();
		Set<Product> pros=new TreeSet<>(new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				// TODO Auto-generated method stub
				return (int) (o1.getId()-o2.getId());
			}
		});
		for(Product p:list){
			pros.add(p);
		}
		
		return pros;
	}

	@Override
	public List<Product> listHostProducet(long cate_detail_id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listHostProducetCate(long cate_id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listProductByCategoryId(long id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listProductByCategoryDetailId(long id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<String> listPublish() throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product getProductById(long id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCateInfoByProductId(long id) throws ProductException {
		// TODO Auto-generated method stub
		return null;
	}

}
