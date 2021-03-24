package com.ksm.sport;

import com.ksm.dto.SportProduct;
import com.ksm.service.SportProductService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"/sportproduct"}, method = {RequestMethod.POST, RequestMethod.GET})
public class SportProductController {
	
  @Inject
  SportProductService service;
  
  @RequestMapping(value = {"/sportproductinsertpage"}, method = {RequestMethod.POST})
  public String sportproductinsertpage() throws Exception {
    return "Sprotproductinsert";
  }
  
  @RequestMapping(value = {"/sportproductinsert"}, method = {RequestMethod.POST})
  public String sportproductinsert(SportProduct sportproduct) throws Exception {
    this.service.insert(sportproduct);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/SearchSP"}, method = {RequestMethod.POST})
  public String SearchSPpage(SportProduct sportproduct) throws Exception {
    this.service.insert(sportproduct);
    return "SearchSP";
  }
  
  @RequestMapping(value = {"/search"}, method = {RequestMethod.POST})
  public String search(SportProduct sportproduct, Model model, @RequestParam("selectbox") String selectbox, @RequestParam("searchtext") String searchtext) throws Exception {
    List<SportProduct> list = null;
    list = this.service.searchList(selectbox, searchtext);
    model.addAttribute("searchlist", list);
    return "SearchSP";
  }
  
  @RequestMapping(value = {"/select"}, method = {RequestMethod.POST})
  public String select(SportProduct sportproduct, Model model) throws Exception {
    SportProduct select = this.service.select(sportproduct);
    model.addAttribute("list", select);
    return "AddProduct";
  }
}
