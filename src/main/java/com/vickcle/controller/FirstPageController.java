package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Admin;
import com.vickcle.model.Student;
import com.vickcle.model.Teacher;
import com.vickcle.service.AdminService;
import com.vickcle.service.StudentService;
import com.vickcle.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class FirstPageController {
    @Autowired
    AdminService adminservice;
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;

    //默认去到首页
    @RequestMapping("/")
    public String toFirstPage(){
        return "login_page";
    }
    //登录的逻辑处理
    @RequestMapping("/login")
    @ResponseBody
    public String toLoginPage(@RequestParam("name") String name, @RequestParam("password") String password, @RequestParam("usertype") int usertype, HttpSession session){
        session.setAttribute("name",name);
        session.setAttribute("password",password);
        Map<String,String> msg = new HashMap<>();
        if (usertype == 1){
            Admin admin  = adminservice.findAdminByName(name);
            if(admin!=null){
                int admin_id = admin.getAdmin_id();
                session.setAttribute("user_id",admin_id);
                session.setAttribute("user_name",admin.getAdmin_name());
                msg.put("state", "1");
                return JSON.toJSONString(msg);
            }
        }else if (usertype == 2){
            Teacher teacher  = teacherService.findTeacherByCode(name);
            if(teacher!=null){
                int teacher_id  = teacher.getTeacher_id();
                session.setAttribute("user_id",teacher_id);
                session.setAttribute("user_name",teacher.getTeacher_name());
                msg.put("state", "2");
                return JSON.toJSONString(msg);
            }
        }else if(usertype == 3){
            Student student  = studentService.findStudentByCode(name);
            if(student!=null){
                int student_id  = student.getStudent_id();
                session.setAttribute("user_id",student_id);
                session.setAttribute("user_name",student.getStudent_name());
                msg.put("state", "3");
                return JSON.toJSONString(msg);
            }
        }
        msg.put("state", "0");
        return JSON.toJSONString(msg);
    }
    @RequestMapping("/admin_main")
    public String toAdminPage(){
        return "admin/admin_main";
    }
    @RequestMapping("/teacher_main")
    public String toTeacherPage(){
        return "teacher/teacher_main";
    }
    @RequestMapping("/student_main")
    public String toStudentPage(){
        return "student/student_main";
    }
    @RequestMapping("/index")
    public String testRedirect(){
        return "index";
    }
}
