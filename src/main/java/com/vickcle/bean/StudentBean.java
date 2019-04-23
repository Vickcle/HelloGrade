package com.vickcle.bean;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class StudentBean implements Serializable {
    private int student_id;

    @SerializedName("学号")
    private String student_code;
    @SerializedName("姓名")
    private String student_name;
    @SerializedName("密码")
    private String student_pwd;
    @SerializedName("学生号码")
    private String student_tel;
    @SerializedName("学生邮箱")
    private String student_email;
    @SerializedName("学生住址")
    private String student_address;
    @SerializedName("班级")
    private String class_name;

    public StudentBean() {

    }

    public StudentBean(int student_id, String student_code, String student_name, String student_pwd, String student_tel, String student_email, String student_address, String class_name) {
        this.student_id = student_id;
        this.student_code = student_code;
        this.student_name = student_name;
        this.student_pwd = student_pwd;
        this.student_tel = student_tel;
        this.student_email = student_email;
        this.student_address = student_address;
        this.class_name = class_name;
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

    public String getStudent_pwd() {
        return student_pwd;
    }

    public void setStudent_pwd(String student_pwd) {
        this.student_pwd = student_pwd;
    }

    public String getStudent_tel() {
        return student_tel;
    }

    public void setStudent_tel(String student_tel) {
        this.student_tel = student_tel;
    }

    public String getStudent_email() {
        return student_email;
    }

    public void setStudent_email(String student_email) {
        this.student_email = student_email;
    }

    public String getStudent_address() {
        return student_address;
    }

    public void setStudent_address(String student_address) {
        this.student_address = student_address;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    @Override
    public String toString() {
        return "StudentBean{" +
                "student_id=" + student_id +
                ", student_code='" + student_code + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_pwd='" + student_pwd + '\'' +
                ", student_tel='" + student_tel + '\'' +
                ", student_email='" + student_email + '\'' +
                ", student_address='" + student_address + '\'' +
                ", class_name='" + class_name + '\'' +
                '}';
    }
}
