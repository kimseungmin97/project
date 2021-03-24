package com.ksm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ksm.dao.PostDao;
import com.ksm.dto.Post;

@Service
public class PostServiceImpl implements PostService {
  @Inject
  private PostDao dao;
  
  public List<Post> list(Post post) throws Exception {
    return dao.list(post);
  }
}
