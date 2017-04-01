package neu.edu.coe.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import neu.edu.coe.dao.OrderDaoImp;
import neu.edu.coe.model.Order;

@Controller
public class OrderController {
	@Autowired
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	OrderDaoImp orderDaoImp = (OrderDaoImp) context.getBean("OrderDaoImp");

	@RequestMapping(value = "/createorder", method = RequestMethod.GET)
	public String newOrder(HttpServletRequest request) throws ClassNotFoundException, SQLException {
//		String ordertime = request.getParameter("ordertime");
		double total = Double.parseDouble(request.getAttribute("total").toString());
		Order newOrder = new Order(total);
		orderDaoImp.insert(newOrder);
		return "registered";
	}

}
