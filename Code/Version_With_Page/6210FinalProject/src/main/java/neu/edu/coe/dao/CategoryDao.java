package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Category;

public interface CategoryDao {
	    public List<Category> getAll();
	
		public void create(Category category);
		
		public Category findCategoryByName(String cname);
		
//		public boolean Update(Category category);
		public void Update(Category category);
		
		public void delete(Category category);
		
		public Category findCategoryById(int cid);
		
//		public List<Category> findAll(Integer page)		
	}