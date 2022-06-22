package service;

import bean.Lend;
import dao.LendDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    @Autowired
    private LendDao lendDao;

    public boolean returnBook(long book_id, long reader_id){
        return lendDao.returnBookOne(book_id, reader_id)>0 && lendDao.returnBookTwo(book_id)>0;
    }

    public boolean lendBook(long book_id,long reader_id){
        return lendDao.lendBookOne(book_id,reader_id)>0 && lendDao.lendBookTwo(book_id)>0;
    }

    public ArrayList<Lend> lendList(){
        return lendDao.lendList();
    }

    public ArrayList<Lend> myLendList(long reader_id){
        return lendDao.myLendList(reader_id);
    }

    public int deleteLend(long serNum) {
        return lendDao.deleteLend(serNum);
    }

}


