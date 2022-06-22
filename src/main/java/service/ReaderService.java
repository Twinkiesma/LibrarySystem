package service;

import dao.ReaderDao;
import bean.ReaderInfo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ReaderService {

    @Autowired
    private ReaderDao readerDao;

    // 读者修改密码
    public boolean resetPassword(long reader_id, String newPassword) {
        return readerDao.resetPassword(reader_id, newPassword) > 0;
    }

    // 获取读者密码(读者修改密码)
    public String getReaderPassword(long reader_id) {
        return readerDao.getPassword(reader_id);
    }

    // 管理员添加读者登录信息
    public boolean addReader(ReaderInfo readerInfo, String password, int money) {
        return readerDao.addReader(readerInfo, password, money) > 0;
    }

    public boolean deleteReader(Long reader_id) {
        return readerDao.deleteReader(reader_id) > 0;
    }

}