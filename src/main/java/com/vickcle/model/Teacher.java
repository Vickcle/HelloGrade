package com.vickcle.model;

import java.sql.Date;

public class Teacher {
    private int teacher_id;
    private String teacher_code;
    private String teacher_name;
    private String teacher_pwd;
    private String teacher_tel;
    private String teacher_email;
    private String teacher_honor ;
    private int academy_id;
    private int create_by;
    private Date creation_date ;
    private int last_update_by;
    private Date last_update_date;

    public Teacher() {
    }

    public Teacher(String teacher_code, String teacher_name) {
        this.teacher_code = teacher_code;
        this.teacher_name = teacher_name;
    }

    public Teacher(String teacher_code, String teacher_name, String teacher_pwd, String teacher_tel, String teacher_email, String teacher_honor) {
        this.teacher_code = teacher_code;
        this.teacher_name = teacher_name;
        this.teacher_pwd = teacher_pwd;
        this.teacher_tel = teacher_tel;
        this.teacher_email = teacher_email;
        this.teacher_honor = teacher_honor;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_code() {
        return teacher_code;
    }

    public void setTeacher_code(String teacher_code) {
        this.teacher_code = teacher_code;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_pwd() {
        return teacher_pwd;
    }

    public void setTeacher_pwd(String teacher_pwd) {
        this.teacher_pwd = teacher_pwd;
    }

    public String getTeacher_tel() {
        return teacher_tel;
    }

    public void setTeacher_tel(String teacher_tel) {
        this.teacher_tel = teacher_tel;
    }

    public String getTeacher_email() {
        return teacher_email;
    }

    public void setTeacher_email(String teacher_email) {
        this.teacher_email = teacher_email;
    }

    public String getTeacher_honor() {
        return teacher_honor;
    }

    public void setTeacher_honor(String teacher_honor) {
        this.teacher_honor = teacher_honor;
    }

    public int getAcademy_id() {
        return academy_id;
    }

    public void setAcademy_id(int academy_id) {
        this.academy_id = academy_id;
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
}
