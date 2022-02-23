package springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springmvc.entity.Employee;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@GetMapping("/")
	public String index(@ModelAttribute Employee employee) {
		return "employee/index";
	}
}
