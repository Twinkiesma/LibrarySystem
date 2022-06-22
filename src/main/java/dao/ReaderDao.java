package dao;

import bean.Reader;
import bean.ReaderInfo;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReaderDao {

    private final static String NAMESPACE = "dao.ReaderDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    // 验证是否读者(读者登录)
    public int getMatchCount(final long reader_id, final String password) {
        Map<String, Object> map = new HashMap<>();
        map.put("reader_id", reader_id);
        map.put("password", password);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount", map);
    }

    // 通过id获取读者信息(登录)
    public Reader findReader(final long reader_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findReader", reader_id);
    }

    // 读者通过id修改密码
    public int resetPassword(final long reader_id, final String newPassword) {
        Map<String, Object> map = new HashMap<>();
        map.put("reader_id", reader_id);
        map.put("password", newPassword);
        return sqlSessionTemplate.update(NAMESPACE + "resetPassword", map);
    }

    // 通过id获取读者密码(读者修改密码)
    public String getPassword(final long reader_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getPassword", reader_id);
    }

    // 管理员添加读者登录信息
    public int addReader(final ReaderInfo readerInfo, final String password, final int money) {
        String username = readerInfo.getName();
        long reader_id = readerInfo.getReader_id();
        Map<String, Object> map = new HashMap<>();
        map.put("reader_id", reader_id);
        map.put("username", username);
        map.put("password", password);
        map.put("money", money);
        return sqlSessionTemplate.update(NAMESPACE + "addReader", map);
    }

    // 管理员通过id删除读者
    public int deleteReader(final long reader_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteReader", reader_id);
    }

}