package com.vickcle.controller;

import com.vickcle.model.Class;
import com.vickcle.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClassController {

    @Autowired
    ClassService classService;
    //跳转界面
    @RequestMapping("/admin_query_class")
    public String toAdminQueryClass(Model model , HttpServletResponse response){
        List<Class> list = classService.findAllClass();
        model.addAttribute("list",list);
        return "admin/admin_query_class";
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
}
