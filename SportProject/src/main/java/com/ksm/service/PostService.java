package com.ksm.service;

import java.util.List;

import com.ksm.dto.Post;

public interface PostService {
	 List<Post> list(Post post) throws Exception;
}
