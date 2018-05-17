package com.jk.pojo;

public class Highchars {
	private String name;
	private Double y;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getY() {
		return y;
	}
	public void setY(Double y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "Highchars [name=" + name + ", y=" + y + "]";
	}
	
}
