package com.jk.pojo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "mongo_log")
public class MongoLog {
    @Id
    private String _id;
    /*private Object returnvals;*/
    private String methodname;
    /*private String params;*/
    private String parameter;
    private String username;
    private String exceptionInfo;
    private String methodWhere;
    private Integer state;
    private String startTime;
    private String endTime;



    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getMethodname() {
        return methodname;
    }

    public void setMethodname(String methodname) {
        this.methodname = methodname;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getExceptionInfo() {
        return exceptionInfo;
    }

    public void setExceptionInfo(String exceptionInfo) {
        this.exceptionInfo = exceptionInfo;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getMethodWhere() {
        return methodWhere;
    }

    public void setMethodWhere(String methodWhere) {
        this.methodWhere = methodWhere;
    }


    @Override
    public String toString() {
        return "MongoLog{" +
                "_id='" + _id + '\'' +
                ", methodname='" + methodname + '\'' +
                ", parameter='" + parameter + '\'' +
                ", username='" + username + '\'' +
                ", exceptionInfo='" + exceptionInfo + '\'' +
                ", methodWhere='" + methodWhere + '\'' +
                ", state=" + state +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}
