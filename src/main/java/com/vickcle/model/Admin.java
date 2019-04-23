package com.vickcle.model;


public class Admin {
    private int admin_id;
    private String admin_code;
    private String admin_name;
    private String admin_pwd;
    private String admin_tel;
    private String admin_email;

    public Admin() {
    }

    public Admin(int admin_id, String admin_code, String admin_name, String admin_pwd, String admin_tel, String admin_email) {
        this.admin_id = admin_id;
        this.admin_code = admin_code;
        this.admin_name = admin_name;
        this.admin_pwd = admin_pwd;
        this.admin_tel = admin_tel;
        this.admin_email = admin_email;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_code() {
        return admin_code;
    }

    public void setAdmin_code(String admin_code) {
        this.admin_code = admin_code;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_pwd() {
        return admin_pwd;
    }

    public void setAdmin_pwd(String admin_pwd) {
        this.admin_pwd = admin_pwd;
    }

    public String getAdmin_tel() {
        return admin_tel;
    }

    public void setAdmin_tel(String admin_tel) {
        this.admin_tel = admin_tel;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }
}
