package com.jk.pojo;

public class User_role {
	private Integer urid;
	private Integer uid;
	private Integer rid;
	public User_role() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User_role(Integer urid, Integer uid, Integer rid) {
		super();
		this.urid = urid;
		this.uid = uid;
		this.rid = rid;
	}
	public Integer getUrid() {
		return urid;
	}
	public void setUrid(Integer urid) {
		this.urid = urid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	@Override
	public String toString() {
		return "User_role [urid=" + urid + ", uid=" + uid + ", rid=" + rid + "]";
	}
	
}
