package com.vickcle.controller;

import com.vickcle.model.Major;
import com.vickcle.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MajorController {

    @Autowired
    MajorService majorService;
    //跳转界面
    @RequestMapping("/admin_query_major")
    public String toAdminQueryMajor(Model model , HttpServletResponse response){
        List<Major> list = majorService.findAllMajor();
        model.addAttribute("list",list);
        return "admin/admin_query_major";
    }
    @RequestMapping("/admin_add_major")
    public String toAdminMajorAdd(){
        return "admin/admin_add_major";
    }
    //实现插入操作
    @RequestMapping("/add_major_database")
    public String toAddMajorDB(Major major, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        major.setCreate_by(user_id);
        System.out.println(major.toString());
        majorService.insertMajor(major);
        return "redirect:/admin_query_major";
    }
    //去到修改界面
    @RequestMapping("/admin_update_major")
    public String toAdminMajorUpdate(int major_id,Model model){
        Major major = majorService.findMajorById(major_id);
        model.addAttribute("major",major);
        return "admin/admin_update_major";
    }
    //完成修改操作
    @RequestMapping("/update_major_database")
    public String toUpdateMajorDB(Major major,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        major.setLast_update_by(user_id);
        majorService.updateMajorById(major);
        return "redirect:/admin_query_major";
    }

    @RequestMapping("/delete_major_database")
    public String toDeleteMajorDB(int major_id){
        majorService.deleteMajorById(major_id);
        return "redirect:/admin_query_major";
    }
}
