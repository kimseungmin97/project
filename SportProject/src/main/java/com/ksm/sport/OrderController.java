package com.ksm.sport;

import com.ksm.dto.Order;
import com.ksm.dto.Product;
import com.ksm.dto.User;
import com.ksm.service.OrderService;
import com.ksm.service.ProductService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/order"}, method = {RequestMethod.POST, RequestMethod.GET})
public class OrderController {
  @Inject
  OrderService service;
  
  @Inject
  ProductService productservice;
  
  @RequestMapping(value = {"orderpage"}, method = {RequestMethod.POST})
  public String orderpage(Model model, Product product, Order order) throws Exception {
    Product select = this.productservice.detail(product);
    model.addAttribute("product", select);
    return "Order";
  }
  
  @RequestMapping(value = {"order"}, method = {RequestMethod.POST})
  public String order(Order order) throws Exception {
    this.service.insertorder(order);
    this.productservice.subtraction(order);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"orderList"}, method = {RequestMethod.POST})
  public String orderlist(Model model, Order order, HttpServletRequest req) throws Exception {
    HttpSession session = req.getSession();
    User user = (User)session.getAttribute("user");
    List<Order> list = null;
    list = this.service.OrderList(user.getId());
    model.addAttribute("list", list);
    return "OrderList";
  }
  
  @RequestMapping(value = {"orderdelete"}, method = {RequestMethod.POST})
  public String orderdelete(Order order) throws Exception {
    this.service.deleteorder(order);
    this.productservice.addition(order);
    return "redirect:/order/orderList";
  }
  
  @RequestMapping(value = {"insertpricepage"}, method = {RequestMethod.POST})
  public String insertpricepage(Order order) throws Exception {
    return "InsertPrice";
  }
  
  @RequestMapping(value = {"OrderUpdateManager"}, method = {RequestMethod.POST})
  public String OrderUpdateManager(Order order) throws Exception {
    this.service.updateresult(order);
    return "redirect:/order/orderAllList";
  }
  
  @RequestMapping(value = {"orderupdate"}, method = {RequestMethod.POST})
  public String orderupdate(Order order) throws Exception {
    this.service.updateresult(order);
    return "redirect:/order/orderList";
  }
  
  @RequestMapping(value = {"/orderAllList"}, method = {RequestMethod.POST})
  public String orderAllList(Order order, Model model) throws Exception {
    List<Order> list = null;
    list = this.service.AllList();
    model.addAttribute("list", list);
    return "OrderAllList";
  }
}
