package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.vickcle.bean.StudentBean;
import com.vickcle.model.Class;
import com.vickcle.model.Student;
import com.vickcle.service.ClassService;
import com.vickcle.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.vickcle.util.DealRow.changeToStudent;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;
    @Autowired
    ClassService classService;
    //跳转界面
    @RequestMapping("/admin_query_student")
    public String toAdminQueryStudent(Model model , HttpServletResponse response){
        List<Student> list = studentService.findAllStudent();
        model.addAttribute("list",list);
        return "admin/admin_query_student";
    }
    @RequestMapping("/admin_add_student")
    public String toAdminStudentAdd(){
        return "admin/admin_add_student";
    }
    //实现插入操作
    @RequestMapping("/add_student_database")
    public String toAddStudentDB(Student student, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        student.setStudent_pwd(student.getStudent_code());
        student.setCreate_by(user_id);
        studentService.insertStudent(student);
        return "redirect:/admin_query_student";
    }
    //去到修改界面
    @RequestMapping("/admin_update_student")
    public String toAdminStudentUpdate(int student_id,Model model){
        Student student = studentService.findStudentById(student_id);
        model.addAttribute("student",student);
        return "admin/admin_update_student";
    }
    //完成修改操作
    @RequestMapping("/update_student_database")
    public String toUpdateStudentDB(Student student,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        student.setLast_update_by(user_id);
        studentService.updateStudentById(student);
        return "redirect:/admin_query_student";
    }
    //完成数据库删除操作
    @RequestMapping("/delete_student_database")
    public String toDeleteStudentDB(int student_id){
        studentService.deleteStudentById(student_id);
        return "redirect:/admin_query_student";
    }

    //转到excel导入界面
    @RequestMapping("/admin_import_student")
    public String toAdminImportStudent(){
        return "admin/admin_import_student";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_student_database")
    public String toImportStudentDB(@RequestParam("person") String person,HttpSession session){
        System.out.println(person);
        int user_id = (int)session.getAttribute("user_id");
        dealStudent(person,user_id);
        return "redirect:/admin_query_student";
    }

    //用于修改密码
    @RequestMapping("/student_update_password")
    public String toStudentUpdatePassword(Model model,HttpSession session){
        int student_id = (int)session.getAttribute("user_id");
        Student student = studentService.findStudentById(student_id);
        model.addAttribute("student",student);
        return "student/student_update_password";
    }

    @RequestMapping("/update_password_database")
    public String toUpdatePasswordDB(Student student, HttpSession session, @Param("new_password") String new_password){
        int user_id = (int)session.getAttribute("user_id");
        if ("".equals(new_password)){
            student.setLast_update_by(user_id);
            studentService.updateStudentById(student);
        }else{
            student.setStudent_pwd(new_password);
            student.setLast_update_by(user_id);
            studentService.updateStudentById(student);
        }
        return "redirect:/";
    }

    //修改个人信息
    @RequestMapping("/student_update_info")
    public String toStudentUpdateInfo(Model model,HttpSession session){
        int student_id = (int)session.getAttribute("user_id");
        Student student = studentService.findStudentById(student_id);
        model.addAttribute("student",student);
        return "student/student_update_info";
    }
    @RequestMapping("/update_info_database")
    public String toUpdateInfoDB(Student student,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        student.setLast_update_by(user_id);
        studentService.updateStudentById(student);
        return "redirect:/student_main";
    }
    @RequestMapping("/query_student_info")
    @ResponseBody
    public String queryStudentInfo(@Param("student_code")String student_code,@Param("student_name") String student_name){
        Map<String,List<Student>> msg = new HashMap<>();
        student_code = ("".equals(student_code))?"empty":student_code;
        student_name = ("".equals(student_name))?"empty":student_name;
        Student student = new Student(student_code,student_name);
        List<Student> list =  studentService.selectStudentInfo(student);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

    public  boolean dealStudent(String person,int user_id){
        byte[] utf8Bytes = new byte[20000];
        try {
            utf8Bytes = person.getBytes("UTF-8");
            String utf8Str = new String(utf8Bytes, "UTF-8");
            JSONArray jsonArray = JSONArray.parseArray(utf8Str);
            if(jsonArray.size()>=1){//大于等于1才是合法数据
                //这里不需要头部
                //设置初始密码为学号

                for(int i=0;i<jsonArray.size();i++){
                    JSONObject job = jsonArray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                    StudentBean rowStu = new Gson().fromJson(job.toJSONString(),StudentBean.class);
                    //寻找班级id，不存在则不插入
                    Class cclass = classService.findClassByName(rowStu.getClass_name());
                    if(cclass != null){
                        Student student = changeToStudent(rowStu,cclass.getClass_id());
                        student.setStudent_pwd("NCHU"+student.getStudent_code());
                        student.setCreate_by(user_id);
                        Student stu = studentService.findStudentByCode(student.getStudent_code());
                        if(stu == null){
                            studentService.insertStudent(student);
                        }
                        System.out.println("已经存在学生："+student.toString());
                    }else{
                        System.out.println("不存在的班级");
                    }
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return false;
    }

//    //用来处理数据
//    public  boolean dealStudent(String person){
//        byte[] utf8Bytes = new byte[20000];
//        try {
//            utf8Bytes = person.getBytes("UTF-8");
//            String utf8Str = new String(utf8Bytes, "UTF-8");
//            JSONArray jsonArray = JSONArray.parseArray(utf8Str);
//            if(jsonArray.size()>=1){//大于等于1才是合法数据
//                //这里不需要头部
//                //设置初始密码为学号
//
//                for(int i=0;i<jsonArray.size();i++){
//                    JSONObject job = jsonArray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
//                    StudentBean studentBean = new Gson().fromJson(job.toJSONString(),StudentBean.class);
//                    int class_id =  classService.findClassByName(studentBean.getClass_name()).getClass_id();
//                    Student student = changeToStudent(studentBean,class_id);
//                    student.setStudent_pwd("NCHU"+student.getStudent_code());
//                    //此处理论上要做处理，找到后就不插入
//                    studentService.insertStudent(student);
//                }
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        return true;
//    }
}
