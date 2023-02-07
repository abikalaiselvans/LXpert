package com.my.org.erp.examples;

import java.io.Serializable;

public class PersonDetails implements Serializable {

	private String name;
	private int age;
	private String sex;
	public PersonDetails(String name, int age, String sex) {
		this.name = name;
		this.age = age;
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}