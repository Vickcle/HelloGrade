package com.vickcle.bean;

import com.google.gson.annotations.SerializedName;

public class GradeBean {

    @SerializedName("南昌航空大学课程成绩单")
    private String student_codea;
    @SerializedName("__EMPTY")
    private String student_namea;
    @SerializedName("__EMPTY_1")
    private String grade_testa;
    @SerializedName("__EMPTY_2")
    private String grade_usuala;
    @SerializedName("__EMPTY_3")
    private String grade_interima;
    @SerializedName("__EMPTY_4")
    private String grade_terminala;
    @SerializedName("__EMPTY_5")
    private String grade_totala;
    @SerializedName("__EMPTY_6")
    private String grade_signa;
    @SerializedName("__EMPTY_7")
    private String student_codeb;
    @SerializedName("__EMPTY_8")
    private String student_nameb;
    @SerializedName("__EMPTY_9")
    private String grade_testb;
    @SerializedName("__EMPTY_10")
    private String grade_usualb;
    @SerializedName("__EMPTY_11")
    private String grade_interimb;
    @SerializedName("__EMPTY_12")
    private String grade_terminalb;
    @SerializedName("__EMPTY_13")
    private String grade_totalb;
    @SerializedName("__EMPTY_14")
    private String grade_signb;
    public GradeBean() {
    }

    public GradeBean(String student_codea, String student_namea, String grade_testa, String grade_usuala, String grade_interima, String grade_terminala, String grade_totala, String grade_signa, String student_nameb, String student_codeb, String grade_testb, String grade_usualb, String grade_interimb, String grade_terminalb, String grade_totalb, String grade_signb) {
        this.student_codea = student_codea;
        this.student_namea = student_namea;
        this.grade_testa = grade_testa;
        this.grade_usuala = grade_usuala;
        this.grade_interima = grade_interima;
        this.grade_terminala = grade_terminala;
        this.grade_totala = grade_totala;
        this.grade_signa = grade_signa;
        this.student_nameb = student_nameb;
        this.student_codeb = student_codeb;
        this.grade_testb = grade_testb;
        this.grade_usualb = grade_usualb;
        this.grade_interimb = grade_interimb;
        this.grade_terminalb = grade_terminalb;
        this.grade_totalb = grade_totalb;
        this.grade_signb = grade_signb;
    }

    public String getStudent_codea() {
        return student_codea;
    }

    public void setStudent_codea(String student_codea) {
        this.student_codea = student_codea;
    }

    public String getStudent_namea() {
        return student_namea;
    }

    public void setStudent_namea(String student_namea) {
        this.student_namea = student_namea;
    }

    public String getGrade_testa() {
        return grade_testa;
    }

    public void setGrade_testa(String grade_testa) {
        this.grade_testa = grade_testa;
    }

    public String getGrade_usuala() {
        return grade_usuala;
    }

    public void setGrade_usuala(String grade_usuala) {
        this.grade_usuala = grade_usuala;
    }

    public String getGrade_interima() {
        return grade_interima;
    }

    public void setGrade_interima(String grade_interima) {
        this.grade_interima = grade_interima;
    }

    public String getGrade_terminala() {
        return grade_terminala;
    }

    public void setGrade_terminala(String grade_terminala) {
        this.grade_terminala = grade_terminala;
    }

    public String getGrade_totala() {
        return grade_totala;
    }

    public void setGrade_totala(String grade_totala) {
        this.grade_totala = grade_totala;
    }

    public String getGrade_signa() {
        return grade_signa;
    }

    public void setGrade_signa(String grade_signa) {
        this.grade_signa = grade_signa;
    }

    public String getStudent_nameb() {
        return student_nameb;
    }

    public void setStudent_nameb(String student_nameb) {
        this.student_nameb = student_nameb;
    }

    public String getStudent_codeb() {
        return student_codeb;
    }

    public void setStudent_codeb(String student_codeb) {
        this.student_codeb = student_codeb;
    }

    public String getGrade_testb() {
        return grade_testb;
    }

    public void setGrade_testb(String grade_testb) {
        this.grade_testb = grade_testb;
    }

    public String getGrade_usualb() {
        return grade_usualb;
    }

    public void setGrade_usualb(String grade_usualb) {
        this.grade_usualb = grade_usualb;
    }

    public String getGrade_interimb() {
        return grade_interimb;
    }

    public void setGrade_interimb(String grade_interimb) {
        this.grade_interimb = grade_interimb;
    }

    public String getGrade_terminalb() {
        return grade_terminalb;
    }

    public void setGrade_terminalb(String grade_terminalb) {
        this.grade_terminalb = grade_terminalb;
    }

    public String getGrade_totalb() {
        return grade_totalb;
    }

    public void setGrade_totalb(String grade_totalb) {
        this.grade_totalb = grade_totalb;
    }

    public String getGrade_signb() {
        return grade_signb;
    }

    public void setGrade_signb(String grade_signb) {
        this.grade_signb = grade_signb;
    }

    @Override
    public String toString() {
        return "GradeBean{" +
                "student_codea='" + student_codea + '\'' +
                ", student_namea='" + student_namea + '\'' +
                ", grade_testa=" + grade_testa +
                ", grade_usuala=" + grade_usuala +
                ", grade_interima=" + grade_interima +
                ", grade_terminala=" + grade_terminala +
                ", grade_totala=" + grade_totala +
                ", grade_signa='" + grade_signa + '\'' +
                ", student_nameb='" + student_nameb + '\'' +
                ", student_codeb='" + student_codeb + '\'' +
                ", grade_testb=" + grade_testb +
                ", grade_usualb=" + grade_usualb +
                ", grade_interimb=" + grade_interimb +
                ", grade_terminalb=" + grade_terminalb +
                ", grade_totalb=" + grade_totalb +
                ", grade_signb=" + grade_signb +
                '}';
    }
}
