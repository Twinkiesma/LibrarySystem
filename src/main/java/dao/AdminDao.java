package dao;

import bean.Admin;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository    // 扫描持久层接口创建实现类并交给spring管理
public class AdminDao {

    private final static String NAMESPACE = "dao.AdminDao.";

    @Resource      // 从环境中获取注入到代码的成员属性中
    private SqlSessionTemplate sqlSessionTemplate;                                 // 使用此对象操作数据库

    // 验证是否管理员(管理员登录)
    public int getMatchCount(final long admin_id, final String password) {
        Map<String, Object> paramMap = new HashMap<>();                            // 将获取的值储存在一个map集合中
        paramMap.put("admin_id", admin_id);
        paramMap.put("password", password);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount", paramMap);
    }

    // 通过id获取管理员信息(登录)
    public Admin findAdmin(final long admin_id){
        return sqlSessionTemplate.selectOne(NAMESPACE + "findAdmin", admin_id);
        //selectOne接收一条结果集，selectList接收多条结果集
    }

}