package neu.edu.coe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import neu.edu.coe.dao.SearchDaoImpl;
import neu.edu.coe.model.Product;
import neu.edu.coe.service.UserService;

@Controller
public class SearchController {
	
	@Autowired
	UserService userService;
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	SearchDaoImpl searchDaoImpl = (SearchDaoImpl) context.getBean("SearchDaoImpl");
	
	@RequestMapping(value = "/search.htm", method = RequestMethod.POST)
	public ModelAndView LogedInPage(HttpServletRequest request){
		
		String desc = request.getParameter("description");
		List<Product> plist = searchDaoImpl.findByDescription(desc);
		return new ModelAndView("result","plist",plist);
	}

}
