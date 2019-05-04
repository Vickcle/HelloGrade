package com.vickcle.model;

public class ClassGrade {
    private int lesson_id;
    private String class_name;
    private int sum_num;
    private double max_grade;
    private double min_grade;
    private double avg_grade;
    private int nine_num;
    private  int eight_num;
    private int seven_num;
    private int six_num;
    private int failed_num;
    private int absence_num;
    private String course_code;
    private String course_name;

    public ClassGrade() {
    }

    public ClassGrade(int lesson_id, String class_name, int sum_num, double max_grade, double min_grade, double avg_grade, int nine_num, int eight_num, int seven_num, int six_num, int failed_num, int absence_num, String course_code, String course_name) {
        this.lesson_id = lesson_id;
        this.class_name = class_name;
        this.sum_num = sum_num;
        this.max_grade = max_grade;
        this.min_grade = min_grade;
        this.avg_grade = avg_grade;
        this.nine_num = nine_num;
        this.eight_num = eight_num;
        this.seven_num = seven_num;
        this.six_num = six_num;
        this.failed_num = failed_num;
        this.absence_num = absence_num;
        this.course_code = course_code;
        this.course_name = course_name;
    }

    public ClassGrade(String class_name, String course_name) {
        this.class_name = class_name;
        this.course_name = course_name;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getSum_num() {
        return sum_num;
    }

    public void setSum_num(int sum_num) {
        this.sum_num = sum_num;
    }

    public double getMax_grade() {
        return max_grade;
    }

    public void setMax_grade(double max_grade) {
        this.max_grade = max_grade;
    }

    public double getMin_grade() {
        return min_grade;
    }

    public void setMin_grade(double min_grade) {
        this.min_grade = min_grade;
    }

    public double getAvg_grade() {
        return avg_grade;
    }

    public void setAvg_grade(double avg_grade) {
        this.avg_grade = avg_grade;
    }

    public int getNine_num() {
        return nine_num;
    }

    public void setNine_num(int nine_num) {
        this.nine_num = nine_num;
    }

    public int getEight_num() {
        return eight_num;
    }

    public void setEight_num(int eight_num) {
        this.eight_num = eight_num;
    }

    public int getSeven_num() {
        return seven_num;
    }

    public void setSeven_num(int seven_num) {
        this.seven_num = seven_num;
    }

    public int getSix_num() {
        return six_num;
    }

    public void setSix_num(int six_num) {
        this.six_num = six_num;
    }

    public int getFailed_num() {
        return failed_num;
    }

    public void setFailed_num(int failed_num) {
        this.failed_num = failed_num;
    }

    public int getAbsence_num() {
        return absence_num;
    }

    public void setAbsence_num(int absence_num) {
        this.absence_num = absence_num;
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
}
