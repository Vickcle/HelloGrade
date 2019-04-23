package com.vickcle.model;

import java.util.Date;

public class Class {
    private int  class_id;
    private String class_name;
    private int major_id;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Class() {
    }

    public Class(int class_id, String class_name, int major_id, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.class_id = class_id;
        this.class_name = class_name;
        this.major_id = major_id;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
    }

    public Class(String class_name, int major_id) {
        this.class_name = class_name;
        this.major_id = major_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
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
        return "Class{" +
                "class_id=" + class_id +
                ", class_name='" + class_name + '\'' +
                ", major_id=" + major_id +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
