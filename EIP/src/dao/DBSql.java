package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.EIPBean;

public class DBSql {
	
	//GET_3 Select Employee data from MySQL, then set to Bean ,add to ArrayList and Return
	public ArrayList<EIPBean> get_Employees(Connection conn) {
		ArrayList<EIPBean> Emps = new ArrayList<EIPBean>();
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from employees");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EIPBean eipBean = new EIPBean();
				eipBean.setEmployeeID(rs.getString("EmployeeID"));
				eipBean.setFirstName(rs.getString("FirstName"));
				eipBean.setExtension(rs.getString("Extension"));				
				Emps.add(eipBean);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Emps;
	}

	//GET_3 Select Customer data from MySQL, then set to Bean ,add to ArrayList and Return
	public ArrayList<EIPBean> get_Customers(Connection conn) {
		ArrayList<EIPBean> Cuss = new ArrayList<EIPBean>();
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from customers");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EIPBean eipBean = new EIPBean();
				eipBean.setCustomerID(rs.getString("CustomerID"));
				eipBean.setCompanyName(rs.getString("CompanyName"));
				eipBean.setPhone(rs.getString("Phone"));
				eipBean.setFax(rs.getString("Fax"));
				eipBean.setEmail(rs.getString("Email"));
				eipBean.setPaymentTerm(rs.getString("PaymentTerm"));
				eipBean.setAddress(rs.getString("Address"));
				eipBean.setCity(rs.getString("City"));
				eipBean.setRegion(rs.getString("Region"));
				eipBean.setPostalCode(rs.getString("PostalCode"));
				eipBean.setCountry(rs.getString("Country"));
				Cuss.add(eipBean);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Cuss;
	}
	
	//GET_3 Select Product data from MySQL, then set to Bean ,add to ArrayList and Return
	public ArrayList<EIPBean> get_Products(Connection conn) {
		ArrayList<EIPBean> Pros = new ArrayList<EIPBean>();
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from products");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EIPBean eipBean = new EIPBean();
				eipBean.setProductID(rs.getString("ProductID"));
				eipBean.setProductName(rs.getString("ProductName"));
				eipBean.setUnitPrice(rs.getString("UnitPrice"));
				eipBean.setQuantityPerUnit(rs.getString("QuantityPerUnit"));
				eipBean.setHomemade(rs.getString("Homemade"));
				Pros.add(eipBean);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Pros;
	}
	
}
