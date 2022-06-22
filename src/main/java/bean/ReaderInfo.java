package bean;

import java.io.Serializable;

// 读者信息
public class ReaderInfo implements Serializable {

    private long reader_id;      // 读者ID
    private String name;         // 读者姓名
    private String sex;          // 性别
    private String company;      // 单位
    private String type;         // 类型
    private String level;        // 级别
    private int money;

    public long getReader_id() {
        return reader_id;
    }

    public void setReader_id(long reader_id) {
        this.reader_id = reader_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "ReaderInfo{" +
                "reader_id=" + reader_id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", company='" + company + '\'' +
                ", type='" + type + '\'' +
                ", level='" + level + '\'' +
                '}';
    }

}