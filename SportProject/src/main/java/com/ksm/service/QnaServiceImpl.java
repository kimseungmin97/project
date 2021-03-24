package com.ksm.service;

import com.ksm.dao.QnaDao;
import com.ksm.dto.QnA;
import com.ksm.service.QnaService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
  @Inject
  private QnaDao dao;
  
  public int insert(QnA qna) throws Exception {
    return dao.insert(qna);
  }
  
  public QnA detail(QnA qna) throws Exception {
    return dao.detail(qna);
  }
  
  public List<QnA> list(String id) throws Exception {
    return dao.list(id);
  }
  
  public List<QnA> allList() throws Exception {
    return dao.allList();
  }
  
  public int qnareply(QnA qna) throws Exception {
    return dao.qnareply(qna);
  }
}
