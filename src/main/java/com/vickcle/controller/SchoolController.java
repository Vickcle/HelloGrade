package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.School;
import com.vickcle.service.SchoolService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SchoolController {

    @Autowired
    SchoolService schoolService;
    //跳转界面
    @RequestMapping("/admin_query_school")
    public String toAdminQuerySchool(){
        return "admin/admin_query_school";
    }
    //获取数据
    @RequestMapping("/admin_get_shcool_info")
    @ResponseBody
    public String toAdminGetSchoolInfo(){
        Map<String, List<School>> msg = new HashMap<>();
        List<School> list = new ArrayList<>();
        list = schoolService.findAllSchool();
        msg.put("data",list);
        return JSON.toJSONString(msg);
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

    @RequestMapping("/query_school_info")
    @ResponseBody
    public String toQuerySchoolInfo(@Param("school_code")String school_code,@Param("school_name")String school_name){
        Map<String,List<School>> msg = new HashMap<>();
        school_code = ("".equals(school_code))?"empty":school_code;
        school_name = ("".equals(school_name))?"empty":school_name;
        School school = new School(school_code,school_name);
        List<School> list = new ArrayList<>();
        list = schoolService.querySchoolInfoByTerms(school);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

}
