package com.briup.service.impl;

import java.util.List;

import com.briup.bean.Report;
import com.briup.common.exception.ReportException;
import com.briup.dao.IReportDao;
import com.briup.dao.impl.IReportDaoImpl;
import com.briup.service.IReportService;

public class IReportServiceImpl implements IReportService{
	private IReportDao dao=new IReportDaoImpl();
	@Override
	public void saveReport(Report report) throws ReportException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReport(Report report) throws ReportException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delReport(Long reportId) throws ReportException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Report> listReport() throws ReportException {
		// TODO Auto-generated method stub
		return dao.listAllReport();
	}

}
