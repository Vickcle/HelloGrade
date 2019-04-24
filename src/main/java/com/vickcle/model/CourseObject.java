package com.vickcle.model;

public class CourseObject {
    private  String student_code;
    private String student_name;
    private double grade1;
    private double grade2;

    public CourseObject() {
    }

    public CourseObject(String student_code, String student_name, double grade1, double grade2) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.grade1 = grade1;
        this.grade2 = grade2;
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

    public double getGrade1() {
        return grade1;
    }

    public void setGrade1(double grade1) {
        this.grade1 = grade1;
    }

    public double getGrade2() {
        return grade2;
    }

    public void setGrade2(double grade2) {
        this.grade2 = grade2;
    }
}
