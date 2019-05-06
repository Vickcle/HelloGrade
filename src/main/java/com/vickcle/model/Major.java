package com.vickcle.model;

import java.util.Date;

public class Major {
    private int major_id;
    private String major_code;
    private String major_name;
    private String major_type;
    private int academy_id;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Major() {
    }

    public Major(int major_id, String major_code, String major_name, String major_type, int academy_id, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.major_id = major_id;
        this.major_code = major_code;
        this.major_name = major_name;
        this.major_type = major_type;
        this.academy_id = academy_id;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public Major(String major_code, String major_name, String major_type, int academy_id) {
        this.major_code = major_code;
        this.major_name = major_name;
        this.major_type = major_type;
        this.academy_id = academy_id;
    }

    public Major(String major_code, String major_name) {
        this.major_code = major_code;
        this.major_name = major_name;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public String getMajor_code() {
        return major_code;
    }

    public void setMajor_code(String major_code) {
        this.major_code = major_code;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }

    public String getMajor_type() {
        return major_type;
    }

    public void setMajor_type(String major_type) {
        this.major_type = major_type;
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

    @Override
    public String toString() {
        return "Major{" +
                "major_id=" + major_id +
                ", major_code='" + major_code + '\'' +
                ", major_name='" + major_name + '\'' +
                ", major_type='" + major_type + '\'' +
                ", academy_id=" + academy_id +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
