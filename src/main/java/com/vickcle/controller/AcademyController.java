package com.vickcle.controller;

import com.vickcle.model.Academy;
import com.vickcle.service.AcademyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AcademyController {

    @Autowired
    AcademyService academyService;
    //跳转界面
    @RequestMapping("/admin_query_academy")
    public String toAdminQueryAcademy(Model model , HttpServletResponse response){
        List<Academy> list = academyService.findAllAcademy();
        model.addAttribute("list",list);
        return "admin/admin_query_academy";
    }
    @RequestMapping("/admin_add_academy")
    public String toAdminAcademyAdd(){
        return "admin/admin_add_academy";
    }
    //实现插入操作
    @RequestMapping("/add_academy_database")
    public String toAddAcademyDB(Academy academy, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        academy.setCreate_by(user_id);
        System.out.println(academy.toString());
        academyService.insertAcademy(academy);
        return "redirect:/admin_query_academy";
    }
    //去到修改界面
    @RequestMapping("/admin_update_academy")
    public String toAdminAcademyUpdate(int academy_id,Model model){
        Academy academy = academyService.findAcademyById(academy_id);
        model.addAttribute("academy",academy);
        return "admin/admin_update_academy";
    }
    //完成修改操作
    @RequestMapping("/update_academy_database")
    public String toUpdateAcademyDB(Academy academy,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        academy.setLast_update_by(user_id);
        academyService.updateAcademyById(academy);
        return "redirect:/admin_query_academy";
    }

    @RequestMapping("/delete_academy_database")
    public String toDeleteAcademyDB(int academy_id){
        academyService.deleteAcademyById(academy_id);
        return "redirect:/admin_query_academy";
    }
}
