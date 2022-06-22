package service;

import bean.ReaderInfo;
import dao.ReaderInfoDao;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class ReaderInfoService {

    @Autowired
    private ReaderInfoDao readerInfoDao;

    // 根据id查看读者个人信息(读者查看个人信息)
    public ReaderInfo getReaderInfo(long reader_id) {
        return readerInfoDao.findReaderInfo(reader_id);
    }

    // 读者或管理员修改读者个人信息
    public boolean editReaderInfo(ReaderInfo readerInfo) {
        return readerInfoDao.editReaderInfo(readerInfo) > 0;
    }

    // 读者或管理员修改读者登录信息
    public boolean editReader(ReaderInfo readerInfo) {
        return readerInfoDao.editReader(readerInfo) > 0;
    }

    // 显示所有读者信息(管理员查看读者信息)
    public ArrayList<ReaderInfo> readerInfos() {
        return readerInfoDao.getAllReaderInfo();
    }

    // 管理员添加读者个人信息
    public long addReaderInfo(ReaderInfo readerInfo) {
        return readerInfoDao.addReaderInfo(readerInfo);
    }

    // 管理员删除读者个人信息
    public boolean deleteReaderInfo(long reader_id) {
        return readerInfoDao.deleteReaderInfo(reader_id) > 0;
    }

}