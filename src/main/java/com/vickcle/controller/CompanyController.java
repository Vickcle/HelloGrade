package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Company;
import com.vickcle.service.CompanyService;
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
public class CompanyController {

    @Autowired
    CompanyService companyService;

    @RequestMapping("/admin_add_company")
    public String toAdminAddCompany(){
        return "admin/admin_add_company";
    }

    @RequestMapping("/admin_query_company")
    public String toAdminQueryCompany(){
        return "admin/admin_query_company";
    }
    @RequestMapping("/add_company_database")
    public String toAddCompanyDB(Company company){
        companyService.insertCompany(company);
        return "redirect:/admin_query_company";
    }
    @RequestMapping("/update_company_database")
    public String toUpdateCompanyDB(Company company){
        companyService.updateCompanyById(company);
        return "redirect:/admin_query_company";
    }
    @RequestMapping("/delete_company_database")
    public String toDeleteCompanyDB(@Param("company_id") int company_id){
        companyService.deleteCompanyById(company_id);
        return "redirect:/admin_query_company";
    }
    @RequestMapping("/admin_update_company")
    public String toAdminUpdateCompany(Model model, @Param("company_id") int company_id){
        Company company = companyService.findCompanyById(company_id);
        if(company!=null){
            model.addAttribute("company",company);
        }
        return "admin/admin_update_company";
    }

    @RequestMapping("/admin_query_company_term")
    @ResponseBody
    public String toAdminQueryCompanyTerm(@Param("company_type") String company_type,@Param("company_name") String company_name){
        company_type = ("".equals(company_type))?"empty":company_type;
        company_name = ("".equals(company_name))?"empty":company_name;
        Company company = new Company(company_name,company_type);
        Map<String,List<Company>> map = new HashMap<>();
        List<Company> list = companyService.findAllCompany(company);
        map.put("data",list);
        return JSON.toJSONString(map);
    }
}
