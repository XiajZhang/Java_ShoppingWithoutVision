package neu.edu.coe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import neu.edu.coe.dao.UserDaoImp;
import neu.edu.coe.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDaoImp userDaoImp;
	
	public void registryUser(User user){
		userDaoImp.insert(user);
	}

}
