package com.vickcle.model;

public class LessonObject {
    private int lesson_id;
    private int course_id;
    private String course_code;
    private String course_name;
    private String course_type;
    private String course_property;
    private String course_degree;
    private int course_time;
    private int teacher_id;
    private String teacher_code;
    private String teacher_name;
    private String teacher_tel;
    private String teacher_honor ;
    private String lesson_duration;
    private String lesson_address;

    public LessonObject() {
    }

    public LessonObject(String course_code, String course_name) {
        this.course_code = course_code;
        this.course_name = course_name;
    }

    public LessonObject(int lesson_id, int course_id, String course_code, String course_name, String course_type, String course_property, String course_degree, int course_time, int teacher_id, String teacher_code, String teacher_name, String teacher_tel, String teacher_honor, String lesson_duration, String lesson_address) {
        this.lesson_id = lesson_id;
        this.course_id = course_id;
        this.course_code = course_code;
        this.course_name = course_name;
        this.course_type = course_type;
        this.course_property = course_property;
        this.course_degree = course_degree;
        this.course_time = course_time;
        this.teacher_id = teacher_id;
        this.teacher_code = teacher_code;
        this.teacher_name = teacher_name;
        this.teacher_tel = teacher_tel;
        this.teacher_honor = teacher_honor;
        this.lesson_duration = lesson_duration;
        this.lesson_address = lesson_address;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
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

    public String getCourse_degree() {
        return course_degree;
    }

    public void setCourse_degree(String course_degree) {
        this.course_degree = course_degree;
    }

    public int getCourse_time() {
        return course_time;
    }

    public void setCourse_time(int course_time) {
        this.course_time = course_time;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
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

    public String getTeacher_tel() {
        return teacher_tel;
    }

    public void setTeacher_tel(String teacher_tel) {
        this.teacher_tel = teacher_tel;
    }

    public String getTeacher_honor() {
        return teacher_honor;
    }

    public void setTeacher_honor(String teacher_honor) {
        this.teacher_honor = teacher_honor;
    }

    public String getLesson_duration() {
        return lesson_duration;
    }

    public void setLesson_duration(String lesson_duration) {
        this.lesson_duration = lesson_duration;
    }

    public String getLesson_address() {
        return lesson_address;
    }

    public void setLesson_address(String lesson_address) {
        this.lesson_address = lesson_address;
    }

    @Override
    public String toString() {
        return "LessonObject{" +
                "lesson_id=" + lesson_id +
                ", course_id=" + course_id +
                ", course_code='" + course_code + '\'' +
                ", course_name='" + course_name + '\'' +
                ", course_type='" + course_type + '\'' +
                ", course_property='" + course_property + '\'' +
                ", course_degree='" + course_degree + '\'' +
                ", course_time=" + course_time +
                ", teacher_id=" + teacher_id +
                ", teacher_code='" + teacher_code + '\'' +
                ", teacher_name='" + teacher_name + '\'' +
                ", teacher_tel='" + teacher_tel + '\'' +
                ", teacher_honor='" + teacher_honor + '\'' +
                ", lesson_duration='" + lesson_duration + '\'' +
                ", lesson_address='" + lesson_address + '\'' +
                '}';
    }
}
