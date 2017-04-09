package neu.edu.coe.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import neu.edu.coe.dao.ProductDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

@Controller
public class SearchController {

	static String searchKey = "";
	static String append = " AND pdesc like ";

	@Autowired
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	ProductDaoImp productDaoImp = (ProductDaoImp) context.getBean("ProductDaoImp");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	// @RequestMapping(value = "/search", method = RequestMethod.POST)
	// public ModelAndView searchFunction(HttpServletRequest request){
	// String button = request.getParameter("button");
	// System.out.println(button);
	// if ("Search".equals(button)) {
	// System.out.println("***** search Cntl");
	// searchKey = "";
	// String desc = request.getParameter("desc");
	// String temp = "'%" + desc + "%'";
	// searchKey += temp;
	// System.out.println(searchKey);
	// List<Product> plist = productDaoImp.findByDescription(temp);
	// return new ModelAndView("search","plist",plist);
	// }
	//
	// else{
	// System.out.println("***** searchagain Cntl");
	// String desc = request.getParameter("desc");
	// String temp = "'%" + desc + "%'";
	// searchKey = searchKey + append + temp;
	// System.out.println(searchKey);
	// List<Product> plist = productDaoImp.findByDescription(searchKey);
	// return new ModelAndView("search","plist",plist);
	//
	// }
	//
	// }

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Principal principal, HttpServletRequest request, Model model) {
		String button = request.getParameter("button");
		String key = request.getParameter("desc");
		List<Product> plist = productDaoImp.getProducts();
		if (button.equals("Search")) {
			if (searchKey == "") {
				searchKey = key;
			} else {
				searchKey = searchKey + append + "'%" + key + "%'";
			}
			plist = productDaoImp.findByDescription(searchKey);
		}else if(button.equals("ClearSearch")){
			searchKey = "";
		}	
		User currentUser = userDaoImp.findByUserName(principal.getName());
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("plist", plist);
		return "home";
	}

	// @RequestMapping(value = "searchagain.htm", method = RequestMethod.POST)
	// public ModelAndView Search(HttpServletRequest request){
	// System.out.println("***** searchagain Cntl");
	// String desc = request.getParameter("desc");
	// String temp = "'%" + desc + "%'";
	// searchKey = searchKey + append + temp;
	// System.out.println(searchKey);
	// List<Product> plist = productDaoImpl.findByDescription(searchKey);
	// return new ModelAndView("search","plist",plist);
	// }

}
