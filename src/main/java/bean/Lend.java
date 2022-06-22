package bean;

import java.io.Serializable;
import java.util.Date;

//借还书
public class Lend implements Serializable {

    private long ser_num;       //序号
    private long book_id;       //书号
    private long reader_id;     //读者卡号
    private Date lend_date;     //借书时间
    private Date back_date;     //还书时间

    public long getSer_num() {
        return ser_num;
    }

    public void setSer_num(long ser_num) {
        this.ser_num = ser_num;
    }

    public long getBook_id() {
        return book_id;
    }

    public void setBook_id(long book_id) {
        this.book_id = book_id;
    }

    public long getReader_id() {
        return reader_id;
    }

    public void setReader_id(long reader_id) {
        this.reader_id = reader_id;
    }

    public Date getlend_date() {
        return lend_date;
    }

    public void setlend_date(Date lend_date) {
        this.lend_date = lend_date;
    }

    public Date getBack_date() {
        return back_date;
    }

    public void setBack_date(Date back_date) {
        this.back_date = back_date;
    }

}