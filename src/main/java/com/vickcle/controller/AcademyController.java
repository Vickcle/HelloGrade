package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Academy;
import com.vickcle.service.AcademyService;
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
public class AcademyController {

    @Autowired
    AcademyService academyService;
    //跳转界面
    @RequestMapping("/admin_query_academy")
    public String toAdminQueryAcademy(){
        return "admin/admin_query_academy";
    }

    //界面上请求取值
    @RequestMapping("admin_get_academy_info")
    @ResponseBody
    public String toAdminGetAcademyInfo(){
        Map<String, List<Academy>> msg = new HashMap<>();
        List<Academy> list = new ArrayList<>();
        list = academyService.findAllAcademy();
        msg.put("data",list);
        return JSON.toJSONString(msg);
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

    //为专业添加时取得Academy的数据：

    @RequestMapping("/query_academy_info")
    @ResponseBody
    public String toQueryAcademyInfo(@Param("academy_code")String academy_code, @Param("academy_name")String academy_name){
        Map<String,List<Academy>> msg = new HashMap<>();
        academy_code = ("".equals(academy_code))?"empty":academy_code;
        academy_name = ("".equals(academy_name))?"empty":academy_name;
        Academy academy = new Academy(academy_code,academy_name);
        List<Academy> list = new ArrayList<>();
        list = academyService.queryAcademyInfoByTerms(academy);
        msg.put("data",list);
        return JSON.toJSONString(msg);
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
