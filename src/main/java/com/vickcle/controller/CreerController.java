package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Creer;
import com.vickcle.model.CreerObject;
import com.vickcle.service.CreerService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CreerController {
    @Autowired
    CreerService creerService;
    @RequestMapping("/admin_query_creer")
    public  String toAdminQueryCreer(){
        return "admin/admin_query_creer";
    }

    @RequestMapping("/admin_query_creer_item")
    @ResponseBody
    public  String toAdminQueryCreerItem(){
        Map<String,List<Creer>> map = new HashMap<>();
        List<Creer> list = creerService.findAllCreer();
        map.put("data",list);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/select_Creer_Info")
    @ResponseBody
    public  String selectCreerInfo(@Param("student_code")String student_code,@Param("student_name") String student_name,@Param("company_code")String company_code,@Param("company_name")String company_name){
        student_code = ("".equals(student_code))?"empty":student_code;
        student_name = ("".equals(student_name))?"empty":student_name;
        company_code = ("".equals(company_code))?"empty":company_code;
        company_name = ("".equals(company_name))?"empty":company_name;
        CreerObject creerObject = new CreerObject(student_code,student_name,company_code,company_name);
        Map<String,List<CreerObject>> map = new HashMap<>();
        List<CreerObject> list = creerService.selectCreerInfo(creerObject);
        map.put("data",list);
        return JSON.toJSONString(map);
//        try {
//            List<CreerObject> list = creerService.selectCreerInfo(creerObject);
//            map.put("data",list);
//            return JSON.toJSONString(map);
//        }catch (Exception e){
//            //map.put("data",null);
//            return JSON.toJSONString("error");
//        }
    }

    @RequestMapping("/admin_add_creer")
    public  String toAdmin_add_creer(){
        return "admin/admin_add_creer";
    }
    @RequestMapping("/add_creer_database")
    public String toAddCreerDB(@Param("creer_type" )String creer_type,@Param("student_id") String student_id,@Param("company_id") String company_id){
        creer_type = ("".equals(creer_type))?"empty":creer_type;
        student_id = ("".equals(student_id))?"0":student_id;
        company_id = ("".equals(creer_type))?"0":company_id;
        int student = Integer.parseInt(student_id);
        int company = Integer.parseInt(company_id);
        Creer creer = new Creer(creer_type,student,company);
        try {
            creerService.insertCreer(creer);
            return "redirect:/admin_success_return";
        }catch (Exception e){
            creerService.insertCreer(creer);
            return "redirect:/admin_failed_return";
        }
    }
    @RequestMapping("/admin_update_creer")
    public String toAdminUpdateCreer(Model model, @Param("creer_id") int creer_id){
        CreerObject creerObject = creerService.selectCreerObjectById(creer_id);
        if(creerObject != null){
            model.addAttribute("creerObject",creerObject);
            return "admin/admin_update_creer";
        }
        return "admin/admin_update_creer";
    }

    @RequestMapping("/update_creer_database")
    public String updateCreerDB(CreerObject creerObject){
        if(creerObject!=null){
            Creer creer = new Creer(creerObject.getCreer_type(),creerObject.getStudent_id(),creerObject.getCompany_id());
            creer.setCreer_id(creerObject.getCreer_id());
            creerService.updateCreerById(creer);
        }
        return "redirect:/admin_query_creer";
    }

    @RequestMapping("/delete_creer_database")
    public String deleteCreerDB(@Param("creer_id") int creer_id){
        creerService.deleteCreerById(creer_id);
        return "redirect:/admin_query_creer";
    }

    @RequestMapping("/admin_success_return")
    @ResponseBody
    public String adminSuccessReturn(){
        Map<String,String> map = new HashMap<>();
        map.put("data","success");
        return JSON.toJSONString(map);
    }
    @ResponseBody
    @RequestMapping("/admin_failed_return")
    public String doFailedReturn(){
        Map<String,String> map = new HashMap<>();
        map.put("data","failed");
        return JSON.toJSONString(map);
    }
}
