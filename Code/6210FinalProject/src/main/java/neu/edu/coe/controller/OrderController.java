package neu.edu.coe.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.OrderDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Order;
import neu.edu.coe.model.User;

@Controller
public class OrderController {
	@Autowired
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	OrderDaoImp orderDaoImp = (OrderDaoImp) context.getBean("OrderDaoImp");

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String newOrder(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		int oid = (Integer) request.getAttribute("oid");
//		String ordertime = request.getParameter("ordertime");
		double total = (Double) request.getAttribute("total");
		Order newOrder = new Order();
		orderDaoImp.insert(newOrder);
		return "registered";
	}

}