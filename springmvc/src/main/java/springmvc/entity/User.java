package springmvc.entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

public class User {
	@NotNull(message = "User name not null")
	@Size(min = 2, max = 20, message = "name out of range")
	private String name;
	
	@NotNull(message = "User age not null")
	@Range(min = 0, max = 150, message = "age out of range")
	private Integer age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "User [name=" + name + ", age=" + age + "]";
	}
	
}