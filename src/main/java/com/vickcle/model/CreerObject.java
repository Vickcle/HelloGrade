package com.vickcle.model;

public class CreerObject {
    private int creer_id;
    private String creer_type;
    private int student_id;
    private String  student_code;
    private String student_name;
    private int company_id;
    private String company_code;
    private String company_name;
    private String company_type;
    private String company_address;

    public CreerObject() {
    }


    public CreerObject(String student_code, String student_name, String company_code, String company_name) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.company_code = company_code;
        this.company_name = company_name;
    }

    public CreerObject(int creer_id, String creer_type, int student_id, String student_code, String student_name, int company_id, String company_code, String company_name, String company_type, String company_address) {
        this.creer_id = creer_id;
        this.creer_type = creer_type;
        this.student_id = student_id;
        this.student_code = student_code;
        this.student_name = student_name;
        this.company_id = company_id;
        this.company_code = company_code;
        this.company_name = company_name;
        this.company_type = company_type;
        this.company_address = company_address;
    }

    public int getCreer_id() {
        return creer_id;
    }

    public void setCreer_id(int creer_id) {
        this.creer_id = creer_id;
    }

    public String getCreer_type() {
        return creer_type;
    }

    public void setCreer_type(String creer_type) {
        this.creer_type = creer_type;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getStudent_code() {
        return student_code;
    }

    public void setStudent_code(String student_code) {
        this.student_code = student_code;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
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

    @Override
    public String toString() {
        return "CreerObject{" +
                "creer_id=" + creer_id +
                ", creer_type='" + creer_type + '\'' +
                ", student_id=" + student_id +
                ", student_code='" + student_code + '\'' +
                ", student_name='" + student_name + '\'' +
                ", company_id=" + company_id +
                ", company_code='" + company_code + '\'' +
                ", company_name='" + company_name + '\'' +
                ", company_type='" + company_type + '\'' +
                ", company_address='" + company_address + '\'' +
                '}';
    }
}
