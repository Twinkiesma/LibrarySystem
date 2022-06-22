package dao;

import bean.ReaderInfo;
import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReaderInfoDao {

    private final static String NAMESPACE = "dao.ReaderInfoDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    // 读者查看个人信息
    public ReaderInfo findReaderInfo(final long reader_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findReaderInfo", reader_id);
    }

    // 读者修改个人信息
    public int editReaderInfo(final ReaderInfo readerInfo) {
        return sqlSessionTemplate.update(NAMESPACE + "editReaderInfo", readerInfo);
    }

    // 读者修改登录信息
    public int editReader(final ReaderInfo readerInfo) {
        return sqlSessionTemplate.update(NAMESPACE + "editReader", readerInfo);
    }

    // 管理员查看所有读者信息
    public ArrayList<ReaderInfo> getAllReaderInfo() {
        List<ReaderInfo> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllReaderInfo");
        return (ArrayList<ReaderInfo>) result;
    }

    // 管理员添加读者个人信息
    public long addReaderInfo(final ReaderInfo readerInfo) {
        if (sqlSessionTemplate.insert(NAMESPACE + "addReaderInfo", readerInfo) > 0) {       // 判断是否插入数据
            return sqlSessionTemplate.selectOne(NAMESPACE + "getReaderId", readerInfo);     // 有则接收
        } else {
            return -1;
        }
    }

    // 管理员通过读者id删除读者个人信息
    public int deleteReaderInfo(final long reader_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteReaderInfo", reader_id);
    }

}