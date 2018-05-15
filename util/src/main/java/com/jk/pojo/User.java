<<<<<<< Updated upstream
package com.jk.pojo;

public class User {

    private Integer uid;

    private String  user;

    private String  uname;

    private String  upass;

    private Integer flag ;

    private String createtime;

=======
/**
 * Copyright (C), 2018-2018,
 * FileName: User
 * Author:   温少
 * Date:     2018/5/14 14:41
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.pojo;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author 温少
 * @create 2018/5/14
 * @since 1.0.0
 */
public class User {

    private Integer uid;
    private Integer flag;
    private String  uname;
    private String upass;
    private String user;
    private String ceratetime;
>>>>>>> Stashed changes
    private String updatetime;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

<<<<<<< Updated upstream
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
=======
    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
>>>>>>> Stashed changes
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

<<<<<<< Updated upstream
    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
=======
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getCeratetime() {
        return ceratetime;
    }

    public void setCeratetime(String ceratetime) {
        this.ceratetime = ceratetime;
>>>>>>> Stashed changes
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
<<<<<<< Updated upstream
=======

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", flag=" + flag +
                ", uname='" + uname + '\'' +
                ", upass='" + upass + '\'' +
                ", user='" + user + '\'' +
                ", ceratetime='" + ceratetime + '\'' +
                ", updatetime='" + updatetime + '\'' +
                '}';
    }
>>>>>>> Stashed changes
}
