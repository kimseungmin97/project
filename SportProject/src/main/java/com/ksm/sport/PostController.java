package com.ksm.sport;

import com.ksm.dto.Post;
import com.ksm.service.PostService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/post"}, method = {RequestMethod.POST, RequestMethod.GET})
public class PostController {
  @Inject
  PostService service;
  
  @RequestMapping({"/postsearchpage"})
  public String postsearchpage() throws Exception {
    return "postsearch";
  }
  
  @RequestMapping({"/postsearch"})
  public String postsearch(Post post, Model model) throws Exception {
    List<Post> searchlist = null;
    searchlist = this.service.list(post);
    model.addAttribute("postList", searchlist);
    return "postsearch";
  }
}
