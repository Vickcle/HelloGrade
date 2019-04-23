package com.vickcle.model;

import java.sql.Date;

public class Grade {
    private int grade_id;
    private int lesson_id;
    private int student_id;
    private double grade_test;
    private double grade_usual;
    private double grade_interim;
    private double grade_terminal;
    private double grade_total;
    private String grade_sign;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Grade() {
    }

    public Grade(double grade_test, double grade_usual, double grade_interim, double grade_terminal, double grade_total, String grade_sign) {
        this.grade_test = grade_test;
        this.grade_usual = grade_usual;
        this.grade_interim = grade_interim;
        this.grade_terminal = grade_terminal;
        this.grade_total = grade_total;
        this.grade_sign = grade_sign;
    }

    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public double getGrade_test() {
        return grade_test;
    }

    public void setGrade_test(double grade_test) {
        this.grade_test = grade_test;
    }

    public double getGrade_usual() {
        return grade_usual;
    }

    public void setGrade_usual(double grade_usual) {
        this.grade_usual = grade_usual;
    }

    public double getGrade_interim() {
        return grade_interim;
    }

    public void setGrade_interim(double grade_interim) {
        this.grade_interim = grade_interim;
    }

    public double getGrade_terminal() {
        return grade_terminal;
    }

    public void setGrade_terminal(double grade_terminal) {
        this.grade_terminal = grade_terminal;
    }

    public double getGrade_total() {
        return grade_total;
    }

    public void setGrade_total(double grade_total) {
        this.grade_total = grade_total;
    }

    public String getGrade_sign() {
        return grade_sign;
    }

    public void setGrade_sign(String grade_sign) {
        this.grade_sign = grade_sign;
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
