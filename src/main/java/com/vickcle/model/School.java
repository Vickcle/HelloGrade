package com.vickcle.model;

import java.util.Date;

public class School {
    private int school_id;
    private String school_code ;
    private String school_name;
    private String school_address;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public School() {
    }

    public School(int school_id, String school_code, String school_name, String school_address, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.school_id = school_id;
        this.school_code = school_code;
        this.school_name = school_name;
        this.school_address = school_address;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public School(String school_code, String school_name, String school_address) {
        this.school_code = school_code;
        this.school_name = school_name;
        this.school_address = school_address;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getSchool_code() {
        return school_code;
    }

    public void setSchool_code(String school_code) {
        this.school_code = school_code;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getSchool_address() {
        return school_address;
    }

    public void setSchool_address(String school_address) {
        this.school_address = school_address;
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
        return "School{" +
                "school_id=" + school_id +
                ", school_code='" + school_code + '\'' +
                ", school_name='" + school_name + '\'' +
                ", school_address='" + school_address + '\'' +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
