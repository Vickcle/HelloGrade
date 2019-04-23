package com.vickcle.controller;

import com.vickcle.model.School;
import com.vickcle.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SchoolController {

    @Autowired
    SchoolService schoolService;
    //跳转界面
    @RequestMapping("/admin_query_school")
    public String toAdminQuerySchool(Model model , HttpServletResponse response){
        List<School> list = schoolService.findAllSchool();
//需要导入alibaba的fastjson包
//写不了复杂标题的excel...,在做分析操作时可以用
//        ExportExcel<School> ee= new ExportExcel<School>();
//        String[] headers = { "序号", "姓名", "性别", "年龄" };
//        String fileName = "用户信息表";
//        ee.exportExcel(headers,list,fileName,response);
//        for(School attribute : list) {
//            System.out.println(attribute);
//        }
        model.addAttribute("list",list);
        return "admin/admin_query_school";
    }
    @RequestMapping("/admin_add_school")
    public String toAdminSchoolAdd(){
        return "admin/admin_add_school";
    }
    //实现插入操作
    @RequestMapping("/add_school_database")
    public String toAddSchoolDB(School school, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        school.setCreate_by(user_id);
        System.out.println(school.toString());
        schoolService.insertSchool(school);
        return "redirect:/admin_query_school";
    }
    //去到修改界面
    @RequestMapping("/admin_update_school")
    public String toAdminSchoolUpdate(int school_id,Model model){
        School school = schoolService.findSchoolById(school_id);
        model.addAttribute("school",school);
        return "admin/admin_update_school";
    }
    //完成修改操作
    @RequestMapping("/update_school_database")
    public String toUpdateSchoolDB(School school,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        school.setLast_update_by(user_id);
        schoolService.updateSchoolById(school);
        return "redirect:/admin_query_school";
    }

    @RequestMapping("/delete_school_database")
    public String toDeleteSchoolDB(int school_id){
        schoolService.deleteSchoolById(school_id);
        return "redirect:/admin_query_school";
    }
}
