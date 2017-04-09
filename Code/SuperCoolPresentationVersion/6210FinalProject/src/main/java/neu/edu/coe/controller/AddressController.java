package neu.edu.coe.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import neu.edu.coe.dao.AddressDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Address;
import neu.edu.coe.model.User;

@Controller
@RequestMapping(value = "/address")
public class AddressController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	AddressDaoImp addressDaoImp = (AddressDaoImp) context.getBean("AddressDaoImp");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	
	@RequestMapping(method = RequestMethod.GET)
	public String address(HttpServletRequest request, Principal principal, Model model) {
		Address address = new Address();
//		List<Address> addresslist = addressDaoImp.getAll();
		User currentUser = userDaoImp.findByUserName(principal.getName());
		List<Address> addresslist = addressDaoImp.findByUser(currentUser.getUid());
		model.addAttribute("addr", address);
		model.addAttribute("addresslist", addresslist);
		model.addAttribute("user", currentUser);
		return "addresses";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addAddress(Principal principal, Model model){
		Address address = new Address();
		User currentUser = userDaoImp.findByUserName(principal.getName());
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("address", address);
		return "address";
	}
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String addingAddress(@Valid @ModelAttribute("address") Address address, HttpServletRequest request,
			Principal principal, Model model) {
		User currentUser = userDaoImp.findByUserName(principal.getName());
		address.setUser(currentUser);
		System.out.println(address);
		addressDaoImp.create(address);
		List<Address> addresslist = addressDaoImp.findByUser(currentUser.getUid());
		model.addAttribute("addresslist", addresslist);
		return "checkOut";
	}
	
	//jump to editing page
	@RequestMapping(value = "/{addressId}/edit", method = RequestMethod.GET)
	public String update(@PathVariable int addressId, HttpServletRequest request, Model model) {
		Address address = addressDaoImp.findAddressById(addressId);
		model.addAttribute("address", address);
		return "editAddress";
	}
	//edit and submit
	@RequestMapping(value = "/updated", method = RequestMethod.POST)
	public String addressUpdated(@Valid @ModelAttribute("address") Address address, Principal principal, Model model) {
		System.out.println(address);
		addressDaoImp.Update(address);
		User currentUser = userDaoImp.findByUserName(principal.getName());
		List<Address> addresslist = addressDaoImp.findByUser(currentUser.getUid());
		model.addAttribute("addresslist", addresslist);
		return "checkOut";
	}
	
	@RequestMapping(value = "/{addressId}/delete", method = RequestMethod.GET)
	public String deleting(@PathVariable int addressId, HttpServletRequest request, Principal principal, Model model) {
		Address address = addressDaoImp.findAddressById(addressId);
		addressDaoImp.delete(address);
		User currentUser = userDaoImp.findByUserName(principal.getName());
		List<Address> addresslist = addressDaoImp.findByUser(currentUser.getUid());
		model.addAttribute("addresslist", addresslist);
		return "checkOut";
	}
	
	@RequestMapping(value = "/{uid}", method = RequestMethod.GET)
	public String fingByAddressId(@PathVariable int uid, Principal principal, Model model) {
		List<Address> addresslist = addressDaoImp.findByUser(uid);
		model.addAttribute("addresslist", addresslist);
		User currentUser = userDaoImp.findByUserName(principal.getName());
		model.addAttribute("currentUser", currentUser);
		return "addresses";
	}
	
}
