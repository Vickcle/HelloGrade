package com.vickcle.service;

import com.vickcle.dao.AdminDao;
import com.vickcle.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminDao admindao;
    @Override
    public List<Admin> findAll() {
        return admindao.findAll();
    }
    @Override
    public Admin findAdminByName(String admin_name){
        Admin admin = (Admin) admindao.findAdminByName(admin_name);
        return admin;
    }
}
