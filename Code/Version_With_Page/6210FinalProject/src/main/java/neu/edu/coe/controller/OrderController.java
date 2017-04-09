package neu.edu.coe.controller;

import java.security.Principal;
import java.util.List;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.AddressDaoImp;
import neu.edu.coe.dao.CartDaoImp;
import neu.edu.coe.dao.OrderDaoImp;
import neu.edu.coe.dao.OrderItemDaoImp;
import neu.edu.coe.dao.ProductDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Address;
import neu.edu.coe.model.Order;
import neu.edu.coe.model.OrderItem;
import neu.edu.coe.model.User;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	OrderDaoImp orderDaoImp = (OrderDaoImp) context.getBean("OrderDaoImp");
	OrderItemDaoImp orderItemDaoImp = (OrderItemDaoImp) context.getBean("OrderItemDaoImp");
	ProductDaoImp productDaoImp = (ProductDaoImp) context.getBean("ProductDaoImp");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	AddressDaoImp addressDaoImp = (AddressDaoImp) context.getBean("AddressDaoImp");
	CartDaoImp cartDaoImp = (CartDaoImp) context.getBean("CartDaoImp");
	
	@RequestMapping(method = RequestMethod.GET)
	public String order(Principal principal, Model model) {
		Order order = new Order();
		User currentUser = userDaoImp.findByUserName(principal.getName());
		List<Order> orders = orderDaoImp.getOrdersByUid(currentUser.getUid());
		model.addAttribute("order", order);
		model.addAttribute("orders", orders);
		model.addAttribute("user", currentUser);
		return "orderList";
	}
	@RequestMapping(value="/{addressId}/create", method = RequestMethod.GET)
	public String createOrder(@PathVariable int addressId, Principal principal, Model model){
		Address address = addressDaoImp.findAddressById(addressId);
		User currentUser = userDaoImp.findByUserName(principal.getName());
		double total = cartDaoImp.sum(currentUser);
		Order order = new Order(address, currentUser,new java.sql.Date(new java.util.Date().getTime()), total);
		orderDaoImp.insert(order);
		cartDaoImp.checkOut(currentUser);
		List<Order> orders = orderDaoImp.getOrdersByUid(currentUser.getUid());
		model.addAttribute("orders", orders);
		return "orderList";
	}
	@RequestMapping(value="/{orderId}/viewItems", method = RequestMethod.GET)
	public String viewItems(@PathVariable int orderId, Model model){
		List<OrderItem> orderItems =  orderItemDaoImp.getOrderItemByOid(orderId);
		for(OrderItem oi: orderItems){
			System.out.println(oi);
		}
		model.addAttribute("orderItems", orderItems);
		return "orderItems";
	}
	
}
