package com.vickcle.model;

public class Course {
    private int course_id;
    private String course_code;
    private String course_name;
    private String course_type;
    private String course_property;
    private String course_degree;
    private int course_time;
    private int before_id;
    private int academy_id;
    private int create_by;
    private String creation_date;
    private int last_update_by;
    private String last_update_date;

    public Course() {
    }

    public Course(String course_code, String course_name, String course_type, String course_property, String course_degree, int course_time) {
        this.course_code = course_code;
        this.course_name = course_name;
        this.course_type = course_type;
        this.course_property = course_property;
        this.course_degree = course_degree;
        this.course_time = course_time;
    }

    public int getCourse_time() {
        return course_time;
    }

    public void setCourse_time(int course_time) {
        this.course_time = course_time;
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

    public int getBefore_id() {
        return before_id;
    }

    public void setBefore_id(int before_id) {
        this.before_id = before_id;
    }

    public int getAcademy_id() {
        return academy_id;
    }

    public void setAcademy_id(int academy_id) {
        this.academy_id = academy_id;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public String getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(String creation_date) {
        this.creation_date = creation_date;
    }

    public int getLast_update_by() {
        return last_update_by;
    }

    public void setLast_update_by(int last_update_by) {
        this.last_update_by = last_update_by;
    }

    public String getLast_update_date() {
        return last_update_date;
    }

    public void setLast_update_date(String last_update_date) {
        this.last_update_date = last_update_date;
    }

    @Override
    public String toString() {
        return "Course{" +
                "course_id=" + course_id +
                ", course_code='" + course_code + '\'' +
                ", course_name='" + course_name + '\'' +
                ", course_type='" + course_type + '\'' +
                ", course_property='" + course_property + '\'' +
                ", course_degree='" + course_degree + '\'' +
                ", course_time=" + course_time +
                ", before_id=" + before_id +
                ", academy_id=" + academy_id +
                ", create_by=" + create_by +
                ", creation_date='" + creation_date + '\'' +
                ", last_update_by=" + last_update_by +
                ", last_update_date='" + last_update_date + '\'' +
                '}';
    }
}
