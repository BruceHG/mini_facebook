package edu.unsw.minifacebook.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import edu.unsw.minifacebook.forms.UserForm;
import edu.unsw.minifacebook.service.UserService;

public class RegisterAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private UserForm userform;
	
	@Autowired
	private UserService userService;

	public UserForm getUserform() {
		return userform;
	}

	public void setUserform(UserForm userform) {
		this.userform = userform;
	}
	
	public String execute() {
		try {
			boolean result = userService.register(userform);
			if(result) {
				return SUCCESS;
			}else
				return ERROR;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	

}
