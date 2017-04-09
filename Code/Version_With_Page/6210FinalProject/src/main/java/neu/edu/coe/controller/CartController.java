package neu.edu.coe.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.AddressDaoImp;
import neu.edu.coe.dao.CartDaoImp;
import neu.edu.coe.dao.ProductDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Address;
import neu.edu.coe.model.Cart;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;


@Controller
@RequestMapping(value = "/cart")
public class CartController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	ProductDaoImp productDaoImp = (ProductDaoImp) context.getBean("ProductDaoImp");
	AddressDaoImp addressDaoImp = (AddressDaoImp) context.getBean("AddressDaoImp");
	CartDaoImp cartDaoImp = (CartDaoImp) context.getBean("CartDaoImp");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	
	@RequestMapping(method = RequestMethod.GET)
	public String myCart(Principal principal, Model model){
		User user = userDaoImp.findByUserName(principal.getName());
		List<Cart> cartItems = cartDaoImp.findByUser(user);
		model.addAttribute("cartItems", cartItems);
		return "myCart";	
	}
	
	@RequestMapping(value="/{productId}/addCart", method = RequestMethod.POST)
	public String addToCart(@PathVariable int productId, Principal principal, HttpServletRequest request, Model model){
		Product product = productDaoImp.findById(productId);
		User user = userDaoImp.findByUserName(principal.getName());
		Cart cart = new Cart(user, Integer.parseInt(request.getParameter("quantity")),product);
		cartDaoImp.createCart(cart);
		List<Cart> cartItems = cartDaoImp.findByUser(user);
		model.addAttribute("cartItems", cartItems);
		return "myCart";	
	}
	@RequestMapping(value="/{productId}/delete", method = RequestMethod.GET)
	public String deleteCartItem(@PathVariable int productId, Principal principal, Model model){
		Product product = productDaoImp.findById(productId);
		Cart cart = new Cart();
		cart.setProduct(product);
		cartDaoImp.deleteCart(cart);
		User user = userDaoImp.findByUserName(principal.getName());
		List<Cart> cartItems = cartDaoImp.findByUser(user);
		model.addAttribute("cartItems", cartItems);	
		return "myCart";
	}
	@RequestMapping(value="/checkout", method = RequestMethod.GET)
	public String checkOut(Principal principal, Model model){
		List<Address> addresslist = addressDaoImp.getAll();
		model.addAttribute("addresslist", addresslist);
		return "checkOut";	
	}
}
