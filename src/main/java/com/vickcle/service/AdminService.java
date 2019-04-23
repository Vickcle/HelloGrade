package com.vickcle.service;

import com.vickcle.model.Admin;
import java.util.List;

public interface AdminService {
    public List<Admin> findAll();
    public Admin findAdminByName(String admin_name);
}
