package com.usoft.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.usoft.entity.Employee;
import com.usoft.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zc
 * @create 2019-05_07-20:28
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo getAllEmps(@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum, 5);
        List<Employee> list = employeeService.getAllEmps();
        PageInfo pageInfo = new PageInfo(list);
        System.out.println(pageInfo);
        return pageInfo;
    }
}
