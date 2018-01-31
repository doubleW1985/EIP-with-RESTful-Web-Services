package model;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DBConn;
import dao.DBSql;
import dto.EIPBean;

public class EIPModel {
	
	//GET_4 Summary DBConn() and DBSql(), the Return ArrayList of Employee 
	public ArrayList<EIPBean> get_EmployeesM() {
		DBConn dbConn = new DBConn();
		Connection conn = dbConn.get_Conn();
		DBSql dbSql = new DBSql();
		ArrayList<EIPBean> EmpsM = dbSql.get_Employees(conn);
		return EmpsM;
	}

	//GET_4 Summary DBConn() and DBSql(), the Return ArrayList of Customer
	public ArrayList<EIPBean> get_CustomersM() {
		DBConn dbConn = new DBConn();
		Connection conn = dbConn.get_Conn();
		DBSql dbSql = new DBSql();
		ArrayList<EIPBean> CussM = dbSql.get_Customers(conn);
		return CussM;
	}
	
	//GET_4 Summary DBConn() and DBSql(), the Return ArrayList of Product
	public ArrayList<EIPBean> get_ProductsM() {
		DBConn dbConn = new DBConn();
		Connection conn = dbConn.get_Conn();
		DBSql dbSql = new DBSql();
		ArrayList<EIPBean> ProsM = dbSql.get_Products(conn);
		return ProsM;
	}	
	
}
