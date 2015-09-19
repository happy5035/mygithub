package com.yuan.lee.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuan.lee.common.Page;
import com.yuan.lee.entity.Student;
import com.yuan.lee.entity.Test;
import com.yuan.lee.service.system.ClassService;
import com.yuan.lee.service.system.StudentService;
import com.yuan.lee.service.system.TestService;

@RequestMapping(value="/newtest")
@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(TestController.class);
	@Autowired
	StudentService studentservice;
	@Autowired
	ClassService classService;
	@Autowired
	TestService testService;
		@RequestMapping(value="/testtable",method=RequestMethod.GET)
		public  String table()
		{
			System.out.println("test------");
			return "system/test";
		}
		@RequestMapping(value="/mytest",method=RequestMethod.POST)
		public String myTest(@RequestParam("username") String username,
							@RequestParam("email") String email,
							@RequestParam("birthday") String birthday,
							@RequestParam("url") String url,
							@RequestParam("phone") String phone)
		{
			return "ok";
		}
		@ResponseBody
		@RequestMapping(value="/list")
		public Map<String, Object> list(Page page){
			try {
//				System.out.println("\n----------------"+page.getParams().get("name")+"------------\n");
				return studentservice.pagedByParams(page);
			} catch (Exception e) {
				logger.error(e.getMessage());
				return null;
			}
			
		}
		@ResponseBody
		@RequestMapping(value="/a",method=RequestMethod.GET)
		public String atest(Student student){
			student= studentservice.selectByPrimaryKey(4);
			return student.toString();
		}
		@ResponseBody
		@RequestMapping(value="/b",method=RequestMethod.GET)
		public String btest(Test test){
			test= testService.selectByPrimaryKey(1);
			return test.toString();
		}
		@RequestMapping(value="/info")
		public String info(){		
			return "/system/managerInfo";
		}
}
