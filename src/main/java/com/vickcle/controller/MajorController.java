package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Major;
import com.vickcle.service.MajorService;
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
public class MajorController {

    @Autowired
    MajorService majorService;
    //跳转界面
    @RequestMapping("/admin_query_major")
    public String toAdminQueryMajor(){
        return "admin/admin_query_major";
    }
    //查询的数据获取操作：
    @RequestMapping("/admin_get_major_info")
    @ResponseBody
    public String toAdminGetMajorInfo(){
        Map<String,List<Major>> msg = new HashMap<>();
        List<Major> list = new ArrayList<>();
        list = majorService.findAllMajor();
        msg.put("data",list);
        return JSON.toJSONString(msg);
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

    //为其他表的添加添加元素
    @RequestMapping("/query_major_info")
    @ResponseBody
    public String toQueryMajorInfo(@Param("major_code")String major_code, @Param("major_name")String major_name){
        Map<String,List<Major>> msg = new HashMap<>();
        major_code = ("".equals(major_code))?"empty":major_code;
        major_name = ("".equals(major_name))?"empty":major_name;
        Major major = new Major(major_code,major_name);
        List<Major> list = new ArrayList<>();
        list = majorService.queryMajorInfoByTerms(major);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }
}
