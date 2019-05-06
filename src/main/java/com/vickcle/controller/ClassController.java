package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Class;
import com.vickcle.model.ClassObject;
import com.vickcle.service.ClassService;
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
public class ClassController {

    @Autowired
    ClassService classService;
    //跳转界面
    @RequestMapping("/admin_query_class")
    public String toAdminQueryClass(){
        return "admin/admin_query_class";
    }
    //用于查询班级相关：
    @RequestMapping("admin_get_classObject_info")
    @ResponseBody
    public String toAdminGetClassObjectInfo(){
        Map<String, List<ClassObject>> msg = new HashMap<>();
        List<ClassObject> list = new ArrayList<>();
        list = classService.findAllClassObject();
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

    @RequestMapping("/admin_add_class")
    public String toAdminClassAdd(){
        return "admin/admin_add_class";
    }
    //实现插入操作
    @RequestMapping("/add_class_database")
    public String toAddClassDB(Class cclass, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        cclass.setCreate_by(user_id);
        System.out.println(cclass.toString());
        classService.insertClass(cclass);
        return "redirect:/admin_query_class";
    }
    //去到修改界面
    @RequestMapping("/admin_update_class")
    public String toAdminClassUpdate(int class_id,Model model){
        Class cclass = classService.findClassById(class_id);
        model.addAttribute("cclass",cclass);
        return "admin/admin_update_class";
    }
    //完成修改操作
    @RequestMapping("/update_class_database")
    public String toUpdateClassDB(Class cclass,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        cclass.setLast_update_by(user_id);
        classService.updateClassById(cclass);
        return "redirect:/admin_query_class";
    }

    @RequestMapping("/delete_class_database")
    public String toDeleteClassDB(int class_id){
        classService.deleteClassById(class_id);
        return "redirect:/admin_query_class";
    }

    @RequestMapping("/query_class_info")
    @ResponseBody
    public String toQueryMajorInfo(@Param("class_name")String class_name){
        Map<String,List<ClassObject>> msg = new HashMap<>();
        class_name = ("".equals(class_name))?"empty":class_name;
        ClassObject classObject = new ClassObject(class_name);
        List<ClassObject> list = new ArrayList<>();
        list = classService.queryMajorInfoByTerms(classObject);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }
}
