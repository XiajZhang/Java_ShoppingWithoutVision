package neu.edu.coe.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.User;
import neu.edu.coe.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(){
		return "home";
	}
	@RequestMapping(value = "/register")
	public String register(){
		return "register";
	}
	@RequestMapping(value = "/registering", method = RequestMethod.POST)
	public String register(HttpServletRequest request) throws ClassNotFoundException, SQLException{
		
		ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
		UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User newUser = new User(username, password);
		userDaoImp.insert(newUser);
		return "registered";
	}
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String loggingIn(HttpServletRequest request) throws ClassNotFoundException, SQLException{
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","zxj19940612");
        String sql = "select * from user where username = ? and password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        boolean ok = rs.next();
        if(ok){
        	return "loggedIn";
        }
        else
        	return "wrong";
	}
}
