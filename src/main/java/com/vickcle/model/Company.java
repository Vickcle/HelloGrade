package com.vickcle.model;

import java.sql.Date;

public class Company {
    private int company_id;
    private String company_code;
    private String company_name;
    private String company_type;
    private String company_address;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Company() {
    }

    public Company(String company_code, String company_name) {
        this.company_code = company_code;
        this.company_name = company_name;
    }

    public Company(String company_code, String company_name, String company_type) {
        this.company_code = company_code;
        this.company_name = company_name;
        this.company_type = company_type;
    }

    public Company(String company_code, String company_name, String company_type, String company_address) {
        this.company_code = company_code;
        this.company_name = company_name;
        this.company_type = company_type;
        this.company_address = company_address;
    }

    public Company(int company_id, String company_code, String company_name, String company_type, String company_address, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.company_id = company_id;
        this.company_code = company_code;
        this.company_name = company_name;
        this.company_type = company_type;
        this.company_address = company_address;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public String getCompany_code() {
        return company_code;
    }

    public void setCompany_code(String company_code) {
        this.company_code = company_code;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_type() {
        return company_type;
    }

    public void setCompany_type(String company_type) {
        this.company_type = company_type;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public Date getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(Date creation_date) {
        this.creation_date = creation_date;
    }

    public int getLast_update_by() {
        return last_update_by;
    }

    public void setLast_update_by(int last_update_by) {
        this.last_update_by = last_update_by;
    }

    public Date getLast_update_date() {
        return last_update_date;
    }

    public void setLast_update_date(Date last_update_date) {
        this.last_update_date = last_update_date;
    }

    @Override
    public String toString() {
        return "Company{" +
                "company_id=" + company_id +
                ", company_code='" + company_code + '\'' +
                ", company_name='" + company_name + '\'' +
                ", company_type='" + company_type + '\'' +
                ", company_address='" + company_address + '\'' +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
