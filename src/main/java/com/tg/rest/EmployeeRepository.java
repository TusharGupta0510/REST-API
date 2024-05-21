package com.tg.rest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository {
	//List<Employee> employees;
	
	Connection con  = null;
	public EmployeeRepository() {
		
		//String url = "jdbc:mysql://localhost:3306/restdb";
		//String username = "root";
		//String password = "051002";
		  String dbName = System.getProperty("RDS_DB_NAME");
		  String userName = System.getProperty("RDS_USERNAME");
		  String password = System.getProperty("RDS_PASSWORD");
		  String hostname = System.getProperty("RDS_HOSTNAME");
		  String port = System.getProperty("RDS_PORT");
		  String jdbcUrl = "jdbc:mysql://" + hostname + ":" +
		    port + "/" + dbName + "?user=" + userName + "&password=" + password;
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded!");
			con = DriverManager.getConnection(jdbcUrl);	
			// Check if the employee table exists, if not, create it
            if (!doesEmployeeTableExist()) {
                createEmployeeTable();
            }
		}
		catch(Exception e){
			System.out.println(e);
		}
		
	}
	
	private boolean doesEmployeeTableExist() {
        try {
            DatabaseMetaData meta = con.getMetaData();
            ResultSet resultSet = meta.getTables(null, null, "employee", new String[]{"TABLE"});
            return resultSet.next();
        } catch (SQLException e) {
            System.out.println("Error checking if table exists: " + e.getMessage());
            return false;
        }
    }

    // Method to create the employee table if it doesn't exist
    private void createEmployeeTable() {
        String sql = "CREATE TABLE employee (" +
                "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY," +
                "firstname VARCHAR(255)," +
                "lastname VARCHAR(255)," +
                "points INT," +
                "website VARCHAR(255)" +
                ")";

        try {
            Statement statement = con.createStatement();
            statement.executeUpdate(sql);
            System.out.println("Employee table created successfully.");
        } catch (SQLException e) {
            System.out.println("Error creating employee table: " + e.getMessage());
        }
    }
	
	
	public List<Employee> getEmployees(){
		List<Employee> employees = new ArrayList<>();
		String sql = "select * from employee";
		try {
			Statement st = con.createStatement();	
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Employee e = new Employee();
				e.setId(rs.getInt(1));
				e.setFirstname(rs.getString(2));
				e.setLastname(rs.getString(3));
				e.setPoints(rs.getInt(4));
				e.setWebsite(rs.getString(5));
				
				employees.add(e);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		return employees;
	}
	
	public Employee getEmployee(int id) {
		
		String sql = "select * from employee where id = "+id;
		Employee e = new Employee();
		try {
			Statement st = con.createStatement();	
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {				
				e.setId(rs.getInt(1));
				e.setFirstname(rs.getString(2));
				e.setLastname(rs.getString(3));
				e.setPoints(rs.getInt(4));
				e.setWebsite(rs.getString(5));
				
			}
		}
		catch(Exception e1){
			System.out.println(e1);
		}
		return e;	
	}

	public void create(Employee e1) {
		String sql = "insert into employee values (?, ?, ?, ?, ?);";
		try {
			PreparedStatement st = con.prepareStatement(sql);	
			st.setInt(1, e1.getId());
			st.setString(2, e1.getFirstname());
			st.setString(3, e1.getLastname());
			st.setInt(4, e1.getPoints());
			st.setString(5, e1.getWebsite());
			st.executeUpdate();	
		}
		catch(Exception e){
			System.out.println(e);
		}
	}

	public void update(Employee e1) {
		// TODO Auto-generated method stub
		String sql = "update employee set firstname = ?, lastname = ?, points = ?, website = ? where id = ?;";
		try {
			PreparedStatement st = con.prepareStatement(sql);	
			st.setString(1, e1.getFirstname());
			st.setString(2, e1.getLastname());
			st.setInt(3, e1.getPoints());
			st.setString(4, e1.getWebsite());
			st.setInt(5, e1.getId());
			st.executeUpdate();	
		}
		catch(Exception e){
			System.out.println(e);
		}
		
	}
	
	public void delete(int id) {
		String sql = "delete from employee where id = ?";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			st.executeUpdate();
		}
		catch(Exception e1) {
			System.out.println(e1);
		}
	}
	
	
}


