package com.vickcle.model;

public class GradeObject {
    private int grade_id;
    private String student_code;
    private String student_name;
    private String teacher_code;
    private String teacher_name;
    private String course_code;
    private String course_name;
    private String course_type;
    private String course_property;
    private double course_degree;
    private int course_time;
    private String lesson_duration;
    private double grade_test;
    private double grade_usual;
    private double grade_interim;
    private double grade_terminal;
    private double grade_total;
    private String grade_sign;

    public GradeObject() {
    }

    public GradeObject(int grade_id, String student_code, String student_name, String teacher_code, String teacher_name, String course_code, String course_name, String course_type, String course_property, double course_degree, int course_time, String lesson_duration, double grade_test, double grade_usual, double grade_interim, double grade_terminal, double grade_total, String grade_sign) {
        this.grade_id = grade_id;
        this.student_code = student_code;
        this.student_name = student_name;
        this.teacher_code = teacher_code;
        this.teacher_name = teacher_name;
        this.course_code = course_code;
        this.course_name = course_name;
        this.course_type = course_type;
        this.course_property = course_property;
        this.course_degree = course_degree;
        this.course_time = course_time;
        this.lesson_duration = lesson_duration;
        this.grade_test = grade_test;
        this.grade_usual = grade_usual;
        this.grade_interim = grade_interim;
        this.grade_terminal = grade_terminal;
        this.grade_total = grade_total;
        this.grade_sign = grade_sign;
    }

    public GradeObject(String student_code, String student_name, String course_name) {
        this.student_code = student_code;
        this.student_name = student_name;
        this.course_name = course_name;
    }

    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
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

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_type() {
        return course_type;
    }

    public void setCourse_type(String course_type) {
        this.course_type = course_type;
    }

    public String getCourse_property() {
        return course_property;
    }

    public void setCourse_property(String course_property) {
        this.course_property = course_property;
    }

    public double getCourse_degree() {
        return course_degree;
    }

    public void setCourse_degree(double course_degree) {
        this.course_degree = course_degree;
    }

    public int getCourse_time() {
        return course_time;
    }

    public void setCourse_time(int course_time) {
        this.course_time = course_time;
    }

    public String getLesson_duration() {
        return lesson_duration;
    }

    public void setLesson_duration(String lesson_duration) {
        this.lesson_duration = lesson_duration;
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

    @Override
    public String toString() {
        return "GradeObject{" +
                "grade_id=" + grade_id +
                ", student_code='" + student_code + '\'' +
                ", student_name='" + student_name + '\'' +
                ", teacher_code='" + teacher_code + '\'' +
                ", teacher_name='" + teacher_name + '\'' +
                ", course_code='" + course_code + '\'' +
                ", course_name='" + course_name + '\'' +
                ", course_type='" + course_type + '\'' +
                ", course_property='" + course_property + '\'' +
                ", course_degree=" + course_degree +
                ", course_time=" + course_time +
                ", lesson_duration='" + lesson_duration + '\'' +
                ", grade_test=" + grade_test +
                ", grade_usual=" + grade_usual +
                ", grade_interim=" + grade_interim +
                ", grade_terminal=" + grade_terminal +
                ", grade_total=" + grade_total +
                ", grade_sign='" + grade_sign + '\'' +
                '}';
    }
}
