package com.vickcle.service;

import com.vickcle.dao.CompanyDao;
import com.vickcle.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService{
    @Autowired
    CompanyDao companyDao;
    @Override
    public void insertCompany(Company company) {
        companyDao.insertCompany(company);
    }

    @Override
    public List<Company> findAllCompany(Company company) {
        return companyDao.findAllCompany(company);
    }

    @Override
    public Company findCompanyByName(String company_name) {
        return companyDao.findCompanyByName(company_name);
    }

    @Override
    public Company findCompanyByCode(String company_code) {
        return companyDao.findCompanyByCode(company_code);
    }

    @Override
    public Company findCompanyById(int company_id) {
        return companyDao.findCompanyById(company_id);
    }

    @Override
    public void updateCompanyById(Company company) {
        companyDao.updateCompanyById(company);
    }

    @Override
    public void deleteCompanyById(int company_id) {
        companyDao.deleteCompanyById(company_id);
    }
}
