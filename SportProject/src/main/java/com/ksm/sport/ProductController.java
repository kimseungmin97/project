package com.ksm.sport;

import com.ksm.dto.Product;
import com.ksm.dto.Productreview;
import com.ksm.service.OrderService;
import com.ksm.service.ProductService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"/product"}, method = {RequestMethod.POST, RequestMethod.GET})
public class ProductController {
  @Inject
  ProductService service;
  
  @Inject
  OrderService orderservice;
  
  @RequestMapping(value = {"/Productinsertpage"}, method = {RequestMethod.POST})
  public String insertpage() throws Exception {
    return "AddProduct";
  }
  
  @RequestMapping(value = {"/productinsert"}, method = {RequestMethod.POST})
  public String insert(Product product) throws Exception {
    this.service.insert(product);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/productList"}, method = {RequestMethod.POST})
  public String productList(Model model, Product product) throws Exception {
    List<Product> list = null;
    list = this.service.list();
    model.addAttribute("productlist", list);
    return "ProductList";
  }
  
  @RequestMapping(value = {"/productDetail"}, method = {RequestMethod.POST})
  public String productDetail(Model model, Product product) throws Exception {
    Product detail = this.service.detail(product);
    List<Productreview> list = null;
    list = this.service.review(product.getQseq());
    model.addAttribute("product", detail);
    model.addAttribute("list", list);
    return "ProductDetail";
  }
  
  @RequestMapping(value = {"/searchList"}, method = {RequestMethod.POST})
  public String searchList(Product product, Model model) throws Exception {
    List<Product> list = null;
    list = this.service.searchList(product);
    model.addAttribute("productlist", list);
    model.addAttribute("product", product);
    return "ProductList";
  }
  
  @RequestMapping(value = {"/productreviewinsert"}, method = {RequestMethod.POST})
  public String productreviewpage(@RequestParam("qseq") int qseq, @RequestParam("oseq") int oseq, Model model) throws Exception {
    model.addAttribute("qseq", Integer.valueOf(qseq));
    model.addAttribute("oseq", Integer.valueOf(oseq));
    return "Productreview";
  }
  
  @RequestMapping(value = {"/reviewinsert"}, method = {RequestMethod.POST})
  public String reviewinsert(Productreview review, Model model, @RequestParam("oseq") int oseq) throws Exception {
    this.service.insertreview(review);
    this.orderservice.reviewupdate(oseq);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/reviewdelete"}, method = {RequestMethod.POST})
  public String reviewdelete(Productreview review, @RequestParam("seq") int seq) throws Exception {
    this.service.deletereview(seq);
    return "redirect:/";
  }
}