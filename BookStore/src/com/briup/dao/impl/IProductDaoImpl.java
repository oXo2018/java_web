package com.briup.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.briup.bean.Category;
import com.briup.bean.CategoryDetail;
import com.briup.bean.Product;
import com.briup.dao.IProductDao;

public class IProductDaoImpl implements IProductDao{
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@192.168.43.216:1521:XE";
	private String username="estore";
	private String password="estore";
	@Override
	public List<Product> findAllProduct() {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> list=new ArrayList<>();
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			String sql="select s.id,s.name,s.price,s.publish,s.img,s.parameter,s.introduction,s.wraplist,s.hot,s.remain,s.sellnum,s.clickrate,s.publishdate,d.id,d.name,c.id,c.name  from s_product s,s_cate_detail d,s_cate c  where hot=2 and s.cate_detail_id=d.id and d.category_id=c.id";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				long id=rs.getLong(1);
				String name=rs.getString(2);
				double price=rs.getDouble(3);
				String publish=rs.getString(4);
				String img=rs.getString(5);
				String parameter=rs.getString(6);
				String introduction=rs.getString(7);
				String wrapist=rs.getString(8);
				int hot=rs.getInt(9);
				int remain=rs.getInt(10);
				int sellnum=rs.getInt(11);
				int clickrate=rs.getInt(12);
				Date date=rs.getDate(13);
				java.util.Date publishdate=new java.util.Date(date.getTime());
				long sid=rs.getLong(14);
				String sname=rs.getString(15);
				long mid=rs.getLong(16);
				String mname=rs.getString(17);
				Category cate=new Category();
				cate.setId(mid);
				cate.setName(mname);
				CategoryDetail cd=new CategoryDetail();
				cd.setId(sid);
				cd.setName(sname);
				cd.setCate(cate);
				Product pro=new Product();
				pro.setCate_detail(cd);
				pro.setClickrate(clickrate);
				pro.setHot(hot);
				pro.setId(id);
				pro.setImg(img);
				pro.setIntroduction(introduction);
				pro.setName(name);
				pro.setParameter(parameter);
				pro.setPrice(price);
				pro.setPublish(publish);
				pro.setPublishdate(publishdate);
				pro.setRemain(remain);
				pro.setSellnum(sellnum);
				pro.setWrapist(wrapist);
				list.add(pro);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
}




