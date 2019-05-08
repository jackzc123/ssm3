package com.usoft.entity;

import java.util.Date;

public class Employee {
    private Integer id;

    private String lastName;

    private String email;

    private Integer age;

    private Integer sex;

    private Date birth;

    private Integer depId;

    private Department department;

    public Employee(Integer id, String lastName, String email, Integer age, Integer sex, Date birth, Integer depId, Department department) {
        this.id = id;
        this.lastName = lastName;
        this.email = email;
        this.age = age;
        this.sex = sex;
        this.birth = birth;
        this.depId = depId;
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                ", birth=" + birth +
                ", depId=" + depId +
                ", department=" + department +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee() {

    }
}