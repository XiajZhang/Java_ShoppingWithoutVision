package neu.edu.coe.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import neu.edu.coe.dao.CommentDaoImp;
import neu.edu.coe.dao.ProductDaoImp;
import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.Category;
import neu.edu.coe.model.Comment;
import neu.edu.coe.model.Page;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;
import neu.edu.coe.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	private CategoryService categoryService;

	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	ProductDaoImp productDaoImp = (ProductDaoImp) context.getBean("ProductDaoImp");
	UserDaoImp userDaoImp = (UserDaoImp) context.getBean("UserDaoImp");
	CommentDaoImp commentDaoImp = (CommentDaoImp) context.getBean("CommentDaoImp");
	// @RequestMapping(value = "/product")
	// public String product() {
	// return "product";
	// }

	// show all the products
	@RequestMapping(method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {

		List<Product> plist = productDaoImp.getProducts();
		List<Category> categories = categoryService.getCurrent();
		List<Integer> quantity = productDaoImp.countByCategory();
		model.addAttribute("numbers", quantity);
		System.out.println(quantity);
		model.addAttribute("plist", plist);
		model.addAttribute("categories", categories);
		return "products";
	}

	// jump to add product page
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addProduct(Model model) {
		Product product = new Product();
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		model.addAttribute("product", product);
		return "addProduct";
	}

	// admin function: add product
	@RequestMapping(value = "/adding", method = RequestMethod.POST)
	public String addingProduct(@Valid @ModelAttribute("product") Product product, HttpServletRequest request,
			Model model) {
		System.out.println(product.getCategory().getCid());
		System.out.println(product);
		productDaoImp.insert(product);
		List<Product> plist = productDaoImp.getProducts();
		model.addAttribute("plist", plist);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "products";
	}

	// edit page and updated
	@RequestMapping(value = "/{productId}/edit", method = RequestMethod.GET)
	public String update(@PathVariable int productId, HttpServletRequest request, Model model) {
		System.out.println(productId);
		Product product = productDaoImp.findById(productId);
		// Integer pid = Integer.valueOf(request.getParameter("pid"));
		// String pname = request.getParameter("pname");
		// Double price = Double.valueOf(request.getParameter("price"));
		// String pdesc = request.getParameter("pdesc");
		// Integer is_hot = Integer.valueOf(request.getParameter("is_hot"));
		// Date pdate = Date.valueOf(request.getParameter("pdate"));
		// Product newProduct = new Product(pid, pname, price, pdesc,
		// is_hot,pdate);
		model.addAttribute("product", product);
		return "editProduct";
	}

	@RequestMapping(value = "/updated", method = RequestMethod.POST)
	public String productUpdated(@Valid @ModelAttribute("product") Product product, Model model) {
		System.out.println(product);
		productDaoImp.update(product);
		List<Product> plist = productDaoImp.getProducts();
		model.addAttribute("plist", plist);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "products";
	}

	// delete product
	@RequestMapping(value = "/{productId}/delete", method = RequestMethod.GET)
	public String deleting(@PathVariable int productId, HttpServletRequest request, Model model) {
		Product product = productDaoImp.findById(productId);
		productDaoImp.delete(product);
		List<Product> plist = productDaoImp.getProducts();
		model.addAttribute("plist", plist);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "products";
	}

	// find product by category ID
	@RequestMapping(value = "/{categoryId}", method = RequestMethod.GET)
	public String fingByCategoryId(@PathVariable int categoryId, Model model) {
		List<Product> plist = productDaoImp.findByCategory(categoryId);
		model.addAttribute("plist", plist);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "products";
	}

	// view Product
	@RequestMapping(value = "/{productId}/viewProduct", method = RequestMethod.GET)
	public String viewProduct(@PathVariable int productId, HttpServletRequest request, Model model) {
		System.out.println(productId);
		Product product = productDaoImp.findById(productId);
		model.addAttribute("product", product);
		List<Comment> commentlist = commentDaoImp.findByProduct(product);
		model.addAttribute("commentlist", commentlist);
		return "viewProduct";
	}

	// @RequestMapping(value = "/findByCid", method = RequestMethod.GET)
	// public ModelAndView findByCategoryCid(HttpServletRequest request) {
	// Integer cid = Integer.valueOf(request.getParameter("cid"));
	// List<Product> plist = productDaoImp.findByCategoryCid(cid);
	// return new ModelAndView("products", "plist", plist);
	// }
	//
	// @RequestMapping(value = "/findByCsid", method = RequestMethod.GET)
	// public ModelAndView findByCategorySecondCsid(HttpServletRequest request)
	// {
	// Integer csid = Integer.valueOf(request.getParameter("csid"));
	// List<Product> plist = productDaoImp.findByCategorySecondCsid(csid);
	// return new ModelAndView("products", "plist", plist);
	// }

	@RequestMapping(value = "showlist.htm", method = RequestMethod.GET)
	public ModelAndView LogedInPage(HttpServletRequest request) {

		List<Product> plist = productDaoImp.getProducts();
		return new ModelAndView("products", "plist", plist);
	}

	// for comments
	@RequestMapping(value = "/{productId}/addComment", method = RequestMethod.POST)
	public String addComment(@PathVariable int productId, HttpServletRequest request, Model model) {
		Comment comment = new Comment();
		// List <Product> products= productDaoImp.getProducts();
		Product products = productDaoImp.findById(productId);
		model.addAttribute("product", products);
		model.addAttribute("comment", comment);
		return "addComment";
	}

	@RequestMapping(value = "/{productId}/commentadded", method = RequestMethod.POST)
	public String commentsadded(@PathVariable int productId, Principal principal, HttpServletRequest request,
			Model model) {
		Product product = productDaoImp.findById(productId);
		User user = userDaoImp.findByUserName(principal.getName());
		Comment comment = new Comment(user, product, Integer.parseInt(request.getParameter("pLevel")),
				Integer.parseInt(request.getParameter("sLevel")));
		commentDaoImp.insert(comment);
		List<Comment> commentlist = commentDaoImp.findByProduct(product);
		model.addAttribute("commentlist", commentlist);
		model.addAttribute("product", product);
		return "viewProduct";
	}

}
