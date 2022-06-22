package service;

import bean.Admin;
import bean.Reader;
import dao.AdminDao;
import dao.ReaderDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service    // 业务逻辑层当前类自动注入到spring容器中
public class LoginService {

    @Autowired
    private AdminDao adminDao;

    @Autowired
    private ReaderDao readerDao;

    // 管理员登录
    public boolean hasMatchAdmin(long admin_id, String password) {
        return adminDao.getMatchCount(admin_id, password) > 0;
    }

    // 管理员信息
    public Admin findAdmin(long admin_id) {
        return adminDao.findAdmin(admin_id);
    }

    // 读者登录
    public boolean hasMatchReader(long reader_id, String password) {
        return readerDao.getMatchCount(reader_id, password) > 0;
    }

    // 读者信息
    public Reader findReader(long reader_id) {
        return readerDao.findReader(reader_id);
    }

}