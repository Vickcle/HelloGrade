package com.vickcle.model;

public class ClassObject {
    private int class_id;
    private String class_name;
    private int major_id;
    private String major_code;
    private String major_name;
    private int academy_id;
    private String academy_name;
    private String academy_code;

    public ClassObject() {
    }

    public ClassObject(String class_name) {
        this.class_name = class_name;
    }

    public ClassObject(int class_id, String class_name, int major_id, String major_code, String major_name, int academy_id, String academy_name, String academy_code) {
        this.class_id = class_id;
        this.class_name = class_name;
        this.major_id = major_id;
        this.major_code = major_code;
        this.major_name = major_name;
        this.academy_id = academy_id;
        this.academy_name = academy_name;
        this.academy_code = academy_code;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public String getMajor_code() {
        return major_code;
    }

    public void setMajor_code(String major_code) {
        this.major_code = major_code;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }

    public int getAcademy_id() {
        return academy_id;
    }

    public void setAcademy_id(int academy_id) {
        this.academy_id = academy_id;
    }

    public String getAcademy_name() {
        return academy_name;
    }

    public void setAcademy_name(String academy_name) {
        this.academy_name = academy_name;
    }

    public String getAcademy_code() {
        return academy_code;
    }

    public void setAcademy_code(String academy_code) {
        this.academy_code = academy_code;
    }

    @Override
    public String toString() {
        return "ClassObject{" +
                "class_id=" + class_id +
                ", class_name='" + class_name + '\'' +
                ", major_id=" + major_id +
                ", major_code='" + major_code + '\'' +
                ", major_name='" + major_name + '\'' +
                ", academy_id=" + academy_id +
                ", academy_name='" + academy_name + '\'' +
                ", academy_code='" + academy_code + '\'' +
                '}';
    }
}
