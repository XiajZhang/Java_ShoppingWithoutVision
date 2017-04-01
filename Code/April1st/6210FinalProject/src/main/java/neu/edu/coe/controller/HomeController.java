package neu.edu.coe.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.User;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage() {
		return "home";
	}
	
	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String homePage2() {
		return "adminhome";
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String getAllUser(Model model){
		List<User> users = userDaoImp.getUsers();
		model.addAttribute("users", users);
		return "allUsers";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/registering", method = RequestMethod.POST)
	public String register(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User newUser = new User(username, password);
		userDaoImp.insert(newUser);
		return "registered";
	}

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String loggingIn(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userDaoImp.findByUserName(username);
		if (user.getPassword().equals(password))
			return "loggedIn";
		else
			return "wrong";
	}

	public void getAllUser() {
		List<User> users = userDaoImp.getUsers();
		for (User user : users) {
			System.out.println(user);
		}
	}
}