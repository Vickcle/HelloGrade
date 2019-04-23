package com.vickcle.model;

import java.sql.Date;

public class Lesson {
    private int lesson_id;
    private int course_id;
    private int teacher_id;
    private String lesson_duration;
    private String lesson_address;
    private int create_by;
    private Date creation_date;
    private int last_update_by;
    private Date last_update_date;

    public Lesson() {
    }

    public Lesson(int course_id, int teacher_id, String lesson_duration, String lesson_address) {
        this.course_id = course_id;
        this.teacher_id = teacher_id;
        this.lesson_duration = lesson_duration;
        this.lesson_address = lesson_address;
    }

    public Lesson(int lesson_id, int course_id, int teacher_id, String lesson_duration, String lesson_address, int create_by, Date creation_date, int last_update_by, Date last_update_date) {
        this.lesson_id = lesson_id;
        this.course_id = course_id;
        this.teacher_id = teacher_id;
        this.lesson_duration = lesson_duration;
        this.lesson_address = lesson_address;
        this.create_by = create_by;
        this.creation_date = creation_date;
        this.last_update_by = last_update_by;
        this.last_update_date = last_update_date;
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

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
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
