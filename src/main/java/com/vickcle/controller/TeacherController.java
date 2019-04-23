package com.vickcle.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.vickcle.bean.TeacherBean;
import com.vickcle.model.Teacher;
import com.vickcle.service.ClassService;
import com.vickcle.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

import static com.vickcle.util.DealRow.changeToTeacher;

@Controller
public class TeacherController {

    @Autowired
    TeacherService teacherService;
    @Autowired
    ClassService classService;
    //跳转界面
    @RequestMapping("/admin_query_teacher")
    public String toAdminQueryTeacher(Model model , HttpServletResponse response){
        List<Teacher> list = teacherService.findAllTeacher();
        model.addAttribute("list",list);
        return "admin/admin_query_teacher";
    }
    @RequestMapping("/admin_add_teacher")
    public String toAdminTeacherAdd(){
        return "admin/admin_add_teacher";
    }
    //实现插入操作
    @RequestMapping("/add_teacher_database")
    public String toAddTeacherDB(Teacher teacher, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        teacher.setTeacher_pwd("NCHU"+teacher.getTeacher_code());
        teacher.setCreate_by(user_id);
        teacherService.insertTeacher(teacher);
        return "redirect:/admin_query_teacher";
    }
    //去到修改界面
    @RequestMapping("/admin_update_teacher")
    public String toAdminTeacherUpdate(int teacher_id,Model model){
        Teacher teacher = teacherService.findTeacherById(teacher_id);
        model.addAttribute("teacher",teacher);
        return "admin/admin_update_teacher";
    }
    //完成修改操作
    @RequestMapping("/update_teacher_database")
    public String toUpdateTeacherDB(Teacher teacher,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        teacher.setLast_update_by(user_id);
        teacherService.updateTeacherById(teacher);
        return "redirect:/admin_query_teacher";
    }
    //完成数据库删除操作
    @RequestMapping("/delete_teacher_database")
    public String toDeleteTeacherDB(int teacher_id){
        teacherService.deleteTeacherById(teacher_id);
        return "redirect:/admin_query_teacher";
    }

    //转到excel导入界面
    @RequestMapping("/admin_import_teacher")
    public String toAdminImportTeacher(){
        return "admin/admin_import_teacher";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_teacher_database")
    public String toImportTeacherDB(@RequestParam("person") String person,HttpSession session){
        System.out.println(person);
        int user_id = (int)session.getAttribute("user_id");
        dealTeacher(person,user_id);
        return "redirect:/admin_query_teacher";
    }

    //学生查询授课教师信息 --通过成绩转，已有视图可以完成这项工作
    @RequestMapping("/student_query_teacher_fields")
    public String toStudentQueryTeacherFields(){
        return "student/student_query_teacher_fields";
    }




    public  boolean dealTeacher(String person,int user_id){
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
                    TeacherBean row = new Gson().fromJson(job.toJSONString(),TeacherBean.class);
                    //寻找班级id，不存在则不插入
                    Teacher teacher = changeToTeacher(row);
                    teacher.setTeacher_pwd("NCHU"+teacher.getTeacher_code());
                    teacher.setCreate_by(user_id);
                    Teacher tea = teacherService.findTeacherByCode(teacher.getTeacher_code());
                    if(tea == null){
                        System.out.println("教师信息："+teacher.toString());
                        teacherService.insertTeacher(teacher);
                    }
                    System.out.println("已经存在教师："+teacher.toString());
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return false;
    }

}
