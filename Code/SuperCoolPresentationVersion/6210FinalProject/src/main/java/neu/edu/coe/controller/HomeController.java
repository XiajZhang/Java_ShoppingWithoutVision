package neu.edu.coe.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import neu.edu.coe.dao.ProductDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Page;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	ProductDaoImp productDaoImp = (ProductDaoImp) context.getBean("ProductDaoImp");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String userPage() {
		return "userPage";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpServletRequest request, Principal principal, Model model) {
		User currentUser = userDaoImp.findByUserName(principal.getName());
		if (currentUser == null) {
			User admin = new User();
			admin.setUsername(principal.getName());
			model.addAttribute("currentUser", admin);
			return "adminPage";
		}
		model.addAttribute("currentUser", currentUser);
		// List<Product> plist = productDaoImp.getProducts();
		// model.addAttribute("plist", plist);
		this.showProductsByPage(request, model);
		return "home";
	}

	@RequestMapping(value = "/home/**", method = RequestMethod.GET)
	public String homeMyProductPage(HttpServletRequest request, Principal principal, Model model) {
		User currentUser = userDaoImp.findByUserName(principal.getName());
		if (currentUser == null) {
			User admin = new User();
			admin.setUsername(principal.getName());
			model.addAttribute("currentUser", admin);
			return "adminPage";
		}
		model.addAttribute("currentUser", currentUser);
		// List<Product> plist = productDaoImp.getProducts();
		// model.addAttribute("plist", plist);
		this.showProductsByPage(request, model);
		return "home";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/signin")
	public String signInRedirect() {
		return "signin";
	}

	@RequestMapping(value = "loggedout")
	public String logOutRedirect() {
		return "home";
	}

	@RequestMapping(value = "/registering", method = RequestMethod.POST)
	public String register(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User newUser = new User(username, password);
		userDaoImp.insert(newUser);
		return "signin";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String getAllUser(Model model) {
		System.out.println("Here");
		List<User> users = userDaoImp.getUsers();
		model.addAttribute("users", users);
		for (User user : users) {
			System.out.println(user);
		}
		return "allUsers";
	}

	 public void showProductsByPage(HttpServletRequest request, Model model) {
	
	 String pageNow = request.getParameter("pageNow");
	
	 Page page = null;
	
	 List<Product> products = new ArrayList<Product>();
	
	 int totalCount = (int) productDaoImp.getProductsCount();
	
	 if (pageNow != null) {
	 page = new Page(totalCount, Integer.parseInt(pageNow));
	 products = this.productDaoImp.getProductsByPage(page.getStartPos(),
	 page.getPageSize());
	 } else {
	 page = new Page(totalCount, 1);
	 products = this.productDaoImp.getProductsByPage(page.getStartPos(),
	 page.getPageSize());
	 }
	
	 model.addAttribute("plist", products);
	 model.addAttribute("page", page);
	 }
//	public void showProductsByPage(HttpServletRequest request, Model model) {
//
//		String button = request.getParameter("button");
//
//		String key = request.getParameter("desc");
//
//		List<Product> plist = new ArrayList<Product>();
//
//		if (button != null && button.equals("Search")) {
//			if (searchKey == "") {
//				searchKey = "'%" + key + "%'";
//			} else {
//				searchKey = searchKey + append + "'%" + key + "%'";
//			}
//			// plist = productDaoImp.findByDescription(searchKey);
//		} else if (button != null && button.equals("ClearSearch")) {
//			searchKey = "";
//		}
//
//		String pageNow = request.getParameter("pageNow");
//
//		Page page = null;
//
//		int totalCount;
//
//		if (searchKey.equals("") || searchKey == null) {
//			totalCount = (int) productDaoImp.getProductsCount();
//		} else {
//			totalCount = (int) productDaoImp.getProductsCountByKey(searchKey);
//		}
//
//		if (pageNow != null) {
//			page = new Page(totalCount, Integer.parseInt(pageNow));
//			if (searchKey.equals("") || searchKey == null) {
//				plist = this.productDaoImp.getProductsByPage(page.getStartPos(), page.getPageSize());
//			} else {
//				plist = this.productDaoImp.getProductsByPageAndKey(key, page.getStartPos(), page.getPageSize());
//			}
//		} else {
//			page = new Page(totalCount, 1);
//			if (searchKey.equals("") || searchKey == null) {
//				plist = this.productDaoImp.getProductsByPage(page.getStartPos(), page.getPageSize());
//			} else {
//				plist = this.productDaoImp.getProductsByPageAndKey(key, page.getStartPos(), page.getPageSize());
//			}
//		}
//		model.addAttribute("plist", plist);
//		model.addAttribute("page", page);
//	}

}
