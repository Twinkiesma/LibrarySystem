package dao;

import bean.Book;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookDao {
    private final static String NAMESPACE = "dao.BookDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int matchBook( final String searchWord){
        String search = "%" + searchWord + "%";
        return sqlSessionTemplate.selectOne(NAMESPACE + "matchBook", search);
    }   //通过查找关键词来寻找书籍

    public ArrayList<Book> queryBook(final String searchWord){
        String search = "%" + searchWord + "%";
        List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "queryBook", search);
        return (ArrayList<Book>) result;
    }    //查询图书

    public ArrayList<Book> getAllBooks(){
        List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllBooks");
        return (ArrayList<Book>) result;
    }

    public int addBook( final Book book){
        return sqlSessionTemplate.insert(NAMESPACE + "addBook", book);
    }   //增加图书

    public Book getBook(final long book_id){
        return sqlSessionTemplate.selectOne(NAMESPACE + "getBook", book_id);
    }   //通过id得到图书

    public int editBook( final Book book){
        return sqlSessionTemplate.update(NAMESPACE + "editBook", book);
    }    //编辑书籍

    public int deleteBook(final long book_id){
        return sqlSessionTemplate.delete(NAMESPACE + "deleteBook", book_id);
    }  //删除图书
}

