package com.jk.pojo;

public class Role_power {
	private Integer rpid;
	private Integer rid;
	private Integer pid;
	private String createtime;
	private String updatetime;

	public Integer getRpid() {
		return rpid;
	}

	public void setRpid(Integer rpid) {
		this.rpid = rpid;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	@Override
	public String toString() {
		return "Role_power{" +
				"rpid=" + rpid +
				", rid=" + rid +
				", pid=" + pid +
				", createtime='" + createtime + '\'' +
				", updatetime='" + updatetime + '\'' +
				'}';
	}
}
