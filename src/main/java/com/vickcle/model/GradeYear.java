package com.vickcle.model;

public class GradeYear {
    private String student_code;
    private String student_name;
    private String class_name;
    private String school_year;
    private int lesson_num;
    private double grade_sum;

    public GradeYear() {
    }

    public GradeYear(String student_code, String student_name, String class_name, String school_year) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.class_name = class_name;
        this.school_year = school_year;
    }

    public GradeYear(String student_code, String student_name, String class_name, String school_year, int lesson_num, double grade_sum) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.class_name = class_name;
        this.school_year = school_year;
        this.lesson_num = lesson_num;
        this.grade_sum = grade_sum;
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

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getSchool_year() {
        return school_year;
    }

    public void setSchool_year(String school_year) {
        this.school_year = school_year;
    }

    public int getLesson_num() {
        return lesson_num;
    }

    public void setLesson_num(int lesson_num) {
        this.lesson_num = lesson_num;
    }

    public double getGrade_sum() {
        return grade_sum;
    }

    public void setGrade_sum(double grade_sum) {
        this.grade_sum = grade_sum;
    }
}
