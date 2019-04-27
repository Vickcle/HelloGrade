package com.vickcle.model;

import java.sql.Date;

public class Creer {
    private int creer_id;
    private String creer_type ;
    private int student_id;
    private int company_id ;
    private int create_by ;
    private Date creation_date ;
    private int last_update_by ;
    private Date last_update_date;

    public Creer() {
    }

    public Creer(String creer_type, int student_id, int company_id) {
        this.creer_type = creer_type;
        this.student_id = student_id;
        this.company_id = company_id;
    }

    public Creer(int creer_id, String creer_type, int student_id, int company_id, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.creer_id = creer_id;
        this.creer_type = creer_type;
        this.student_id = student_id;
        this.company_id = company_id;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
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

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
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
        return "Creer{" +
                "creer_id=" + creer_id +
                ", creer_type='" + creer_type + '\'' +
                ", student_id=" + student_id +
                ", company_id=" + company_id +
                ", create_by=" + create_by +
                ", creation_date=" + creation_date +
                ", last_update_by=" + last_update_by +
                ", last_update_date=" + last_update_date +
                '}';
    }
}
