package bean;

import java.io.Serializable;

// 管理员登录
public class Admin implements Serializable{

    private long admin_id;      // 管理员ID
    private String password;    // 管理员密码
    private String username;    // 管理员用户名

    public long getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(long admin_id) {
        this.admin_id = admin_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id=" + admin_id +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                '}';
    }

}