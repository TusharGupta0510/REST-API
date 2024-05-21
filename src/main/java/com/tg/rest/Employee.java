package com.tg.rest;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Employee {
	
	private String firstname;
	private String lastname;
	private String website;
	private int Id;
	private int points;
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	@Override
	public String toString() {
		return "Employee [firstname=" + firstname + ", lastname=" + lastname + ", website=" + website + ", Id=" + Id
				+ ", points=" + points + "]";
	}
	
}
