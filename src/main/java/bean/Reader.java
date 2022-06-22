package bean;

import java.io.Serializable;

// 读者登录
public class Reader implements Serializable {

    private long reader_id;      // 读者ID
    private String password;     // 读者密码
    private String username;     // 读者用户名
    private int money;

    public long getReader_id() {
        return reader_id;
    }

    public void setReader_id(long reader_id) {
        this.reader_id = reader_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return username;
    }

    public void setName(String username) {
        this.username = username;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "reader_id=" + reader_id +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                '}';
    }

}