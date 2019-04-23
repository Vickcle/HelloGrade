package com.vickcle.bean;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class GradeHead implements Serializable {
    @SerializedName("南昌航空大学课程成绩单")
    private String head;
    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public GradeHead() {
    }

    public GradeHead(String head) {
        this.head = head;
    }
}
