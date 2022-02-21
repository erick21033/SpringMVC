package springmvc.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import springmvc.entity.User;
import springmvc.service.UserService;

/*
*API Spec 
* http://loc alhost:8080/springmvc/mvc/user/read
*http://localhost:8080/springmvc/mvc/user/add?name=Vic&age=10
*http://localhost:8080/springmvc/mvc/user/get/Vic
*http://localhost:8080/springmvc/mvc/user/update/Vic?age=20
*http://localhost:8080/springmvc/mvc/user/delete/Vic
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/input")
	public String input(Model model) {
		model.addAttribute("action","add");
		model.addAttribute("readonly","");
		return "user/user_form";
	}

	@RequestMapping("/add")
	public String add(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			return String.format("Add User Fail: %s", result);
		}
		userService.create(user);
		System.out.println("/add -> " + user);
		return "redirect:./read";
	}

	@RequestMapping("/read")
	public String read(Model model) {
		List<User> users = userService.read();
		System.out.println("/read ->" + users);
		// 將資料傳給 jsp 渲染
		model.addAttribute("users", users);
		return "user/user_list";
	}

	@RequestMapping("/get/{name}")
	public String get(@PathVariable("name") String name,Model model) {
		Optional<User> optUser = userService.getByname(name);
		System.out.println("/get -> "+name+" " +optUser.isPresent());
		if(optUser.isPresent()) {
		model.addAttribute("user",optUser.get());
		}
		model.addAttribute("action","update/"+name);
		model.addAttribute("readonly","readonly");
		return "user/user_form";
	}

	@RequestMapping("/update/{name}")
	public String update(@PathVariable("name") String name, @RequestParam("age") Integer newAge) {
		boolean isSuccess = userService.updateAgeByName(name, newAge);  
		System.out.println("/update -> "+name+"	"+newAge+"	"+isSuccess);
		return "redirect:../read";
	}

	@RequestMapping("/delete/{name}")
	public String dalete(@PathVariable("name") String name) {
		boolean isSuccess = userService.deleteByName(name);
		System.out.println("delete -> "+name);
		return "redirect:../read";
	}
}
