package com.briup.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.briup.bean.Report;
import com.briup.dao.IReportDao;

public class IReportDaoImpl implements IReportDao{
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@192.168.43.216:1521:XE";
	private String username="estore";
	private String password="estore";
	@Override
	public List<Report> listAllReport() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Report> list=new ArrayList<>();
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			String sql="select  id,name,rank,publish_date,department,publish_writer,content from s_report";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				long id=rs.getLong(1);
				String name=rs.getString(2);
				int rank=rs.getInt(3);
				Date date=rs.getDate(4);
				java.util.Date publish_date=
						new java.util.Date(date.getTime());
				String department=rs.getString(5);
				String publish_writer=rs.getString(6);
				String content=rs.getString(7);
				Report r=new Report();
				r.setContent(content);
				r.setDepartment(department);
				r.setId(id);
				r.setName(name);
				r.setPublish_date(publish_date);
				r.setPublish_writer(publish_writer);
				r.setRank(rank);
				list.add(r);
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





