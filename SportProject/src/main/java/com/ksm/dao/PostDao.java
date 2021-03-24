package com.ksm.dao;

import java.util.List;

import com.ksm.dto.Post;

public interface PostDao {
 List<Post> list (Post post) throws Exception;
}
