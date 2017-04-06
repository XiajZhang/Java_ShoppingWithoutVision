package neu.edu.coe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import neu.edu.coe.dao.CategoryDao;
import neu.edu.coe.model.Category;

@Repository
public class CategoryService {
	
	CategoryDao categoryDao;
	
	@Autowired
	public void setCategorydao(CategoryDao categoryDao){
		this.categoryDao = categoryDao;
	}
	public List<Category> getCurrent(){
		return categoryDao.getAll();
	}
	
	public void create(Category category){
		categoryDao.create(category);
	}
	
	public void Update(Category category){
		if(category.getCid() !=0){
			categoryDao.Update(category);
		}
		else{
			categoryDao.create(category);
		}
	}
	
	public void delete(Category category){
		categoryDao.delete(category);
	}

}
