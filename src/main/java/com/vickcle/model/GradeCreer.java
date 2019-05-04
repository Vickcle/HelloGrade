package com.vickcle.model;

public class GradeCreer {
    private int grade_id;
    private int student_id;
    private int course_id;
    private double grade_total;

    public GradeCreer() {
    }

    public GradeCreer(int grade_id, int student_id, int course_id, double grade_total) {
        this.grade_id = grade_id;
        this.student_id = student_id;
        this.course_id = course_id;
        this.grade_total = grade_total;
    }

    public GradeCreer(int student_id) {
        this.student_id = student_id;
    }

    public GradeCreer(int student_id, int course_id) {
        this.student_id = student_id;
        this.course_id = course_id;
    }

    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public double getGrade_total() {
        return grade_total;
    }

    public void setGrade_total(double grade_total) {
        this.grade_total = grade_total;
    }
}
