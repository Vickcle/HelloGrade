package com.vickcle.model;

import java.util.Date;

public class Academy {
    private int academy_id;
    private String academy_code;
    private String academy_name;
    private String academy_address;
    private String school_id;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Academy() {
    }

    public Academy(int academy_id, String academy_code, String academy_name, String academy_address, String school_id, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.academy_id = academy_id;
        this.academy_code = academy_code;
        this.academy_name = academy_name;
        this.academy_address = academy_address;
        this.school_id = school_id;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public Academy(String academy_code, String academy_name) {
        this.academy_code = academy_code;
        this.academy_name = academy_name;
    }

    public Academy(String academy_code, String academy_name, String academy_address, String school_id) {
        this.academy_code = academy_code;
        this.academy_name = academy_name;
        this.academy_address = academy_address;
        this.school_id = school_id;
    }

    public int getAcademy_id() {
        return academy_id;
    }

    public void setAcademy_id(int academy_id) {
        this.academy_id = academy_id;
    }

    public String getAcademy_code() {
        return academy_code;
    }

    public void setAcademy_code(String academy_code) {
        this.academy_code = academy_code;
    }

    public String getAcademy_name() {
        return academy_name;
    }

    public void setAcademy_name(String academy_name) {
        this.academy_name = academy_name;
    }

    public String getAcademy_address() {
        return academy_address;
    }

    public void setAcademy_address(String academy_address) {
        this.academy_address = academy_address;
    }

    public String getSchool_id() {
        return school_id;
    }

    public void setSchool_id(String school_id) {
        this.school_id = school_id;
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
        return "Academy{" +
                "academy_id=" + academy_id +
                ", academy_code='" + academy_code + '\'' +
                ", academy_name='" + academy_name + '\'' +
                ", academy_address='" + academy_address + '\'' +
                ", school_id='" + school_id + '\'' +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
