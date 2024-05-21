package com.tg.rest;
import java.util.List;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;


@Path("employees")
public class EmployeeResource {
	EmployeeRepository repo = new EmployeeRepository();
	
	@GET
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public List<Employee> getEmployee(){
		System.out.println("getEmployees called...");
		return repo.getEmployees();				
	}
		
	@GET
	@Path("employee/{id}")
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public Employee getEmployee(@PathParam("id") int id) {
		return repo.getEmployee(id);
	}
			
	@POST
	@Path("employee")
	@Consumes({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	public Employee createEmployee(Employee e1) {
		System.out.println(e1);
		repo.create(e1);
		return e1;
	}
	
	@PUT
	@Path("edit")
	public Employee updateEmployee(Employee e1) {
		System.out.println(e1);
		if(repo.getEmployee(e1.getId())== null) {
			repo.create(e1);
		}
		else {
			repo.update(e1);
		}
		return e1;
	}
	
	@DELETE
	@Path("delete/{id}")
	public Employee killEmployee(@PathParam("id") int id) {
		Employee e = repo.getEmployee(id);
		if(e.getId()!=0) {
			repo.delete(id);
		}
		return e;
	}
	

}
