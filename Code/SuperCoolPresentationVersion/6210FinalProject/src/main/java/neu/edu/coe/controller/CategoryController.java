package neu.edu.coe.controller;

import java.sql.SQLException;
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
import neu.edu.coe.dao.CategoryDaoImp;
import neu.edu.coe.model.Category;
import neu.edu.coe.service.CategoryService;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	ApplicationContext context = new ClassPathXmlApplicationContext("neu/edu/coe/beans/beans.xml");
	CategoryDaoImp categoryDaoImp = (CategoryDaoImp) context.getBean("CategoryDaoImp");
	
	@RequestMapping(value ="/showcategory", method = RequestMethod.GET)
	public String showCategory(Model model) {
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "category";
	}
	//jump to category adding page
	@RequestMapping(value="/categoryAdding", method = RequestMethod.GET)
	public String createCategory(){
		return "categoryadding";
	}
	//add new category
	@RequestMapping(value="/categorycreated", method = RequestMethod.POST)
	public String categorycreated(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException{
		String cname=request.getParameter("cname");
		Category newCategory = new Category(cname);
		categoryDaoImp.create(newCategory);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "category";
	}
	
	@RequestMapping(value="/{categoryId}/editing", method = RequestMethod.GET)
	public String updateCategory(@PathVariable int categoryId, Model model){
		Category category = categoryDaoImp.findCategoryById(categoryId);
		model.addAttribute("category", category);
		return "categoryediting";
	}
	
	@RequestMapping(value="/categoryupdated", method = RequestMethod.POST)
	public String categoryupdated(@Valid @ModelAttribute("category") Category category, HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException{
		System.out.println(category);
		categoryDaoImp.Update(category);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "category";
	}
	
	
	@RequestMapping(value="/{categoryId}/delete", method = RequestMethod.GET)
	public String categorydeleted(@PathVariable int categoryId, HttpServletRequest request, Model model){
		Category deleteCategory = categoryDaoImp.findCategoryById(categoryId);
		categoryDaoImp.delete(deleteCategory);
		List<Category> categories = categoryService.getCurrent();
		model.addAttribute("categories", categories);
		return "category";
	}
	
	
	public void getAllCategory(){
		List<Category> category = categoryDaoImp.getAll();
		for(Category category1: category)
			System.out.println(category1);
	}

	
}
