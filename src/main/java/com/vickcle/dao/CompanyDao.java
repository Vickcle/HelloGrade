package com.vickcle.dao;

import com.vickcle.model.Company;

import java.util.List;

public interface CompanyDao {
    public void insertCompany(Company company);
    public List<Company> findAllCompany(Company company);
    public Company findCompanyByName(String company_name);
    public Company findCompanyByCode(String company_code);
    public Company findCompanyById(int company_id);
    public void updateCompanyById(Company company);
    public void deleteCompanyById(int company_id);
}
