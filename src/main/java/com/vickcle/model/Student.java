package com.vickcle.model;

import java.sql.Date;

public class Student {
    private int student_id;
    private String student_code;
    private String student_name;
    private String student_pwd;
    private String student_tel;
    private String student_email;
    private String student_address;
    private int class_id;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Student() {
    }

    public Student(String student_code, String student_name) {
        this.student_code = student_code;
        this.student_name = student_name;
    }

    public Student(int student_id, String student_code, String student_name, String student_pwd, String student_tel, String student_email, String student_address, int class_id, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.student_id = student_id;
        this.student_code = student_code;
        this.student_name = student_name;
        this.student_pwd = student_pwd;
        this.student_tel = student_tel;
        this.student_email = student_email;
        this.student_address = student_address;
        this.class_id = class_id;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public Student(String student_code, String student_name, String student_pwd, String student_tel, String student_email, String student_address) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.student_pwd = student_pwd;
        this.student_tel = student_tel;
        this.student_email = student_email;
        this.student_address = student_address;
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

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
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
        return "Student{" +
                "student_id=" + student_id +
                ", student_code='" + student_code + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_pwd='" + student_pwd + '\'' +
                ", student_tel='" + student_tel + '\'' +
                ", student_email='" + student_email + '\'' +
                ", student_address='" + student_address + '\'' +
                ", class_id=" + class_id +
                ", create_by=" + create_by +
                ", creation_date='" + creation_date + '\'' +
                ", last_update_by=" + last_update_by +
                ", last_update_date='" + last_update_date + '\'' +
                '}';
    }
}
