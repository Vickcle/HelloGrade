package com.vickcle.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.vickcle.bean.CourseBean;
import com.vickcle.model.Course;
import com.vickcle.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

import static com.vickcle.util.DealRow.changeToCourse;

@Controller
public class CourseController {

    @Autowired
    CourseService courseService;
    //跳转界面
    @RequestMapping("/admin_query_course")
    public String toAdminQueryCourse(Model model , HttpServletResponse response){
        List<Course> list = courseService.findAllCourse();
        model.addAttribute("list",list);
        return "admin/admin_query_course";
    }
    @RequestMapping("/admin_add_course")
    public String toAdminCourseAdd(){
        return "admin/admin_add_course";
    }
    //实现插入操作
    @RequestMapping("/add_course_database")
    public String toAddCourseDB(Course course, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        course.setCreate_by(user_id);
        courseService.insertCourse(course);
        return "redirect:/admin_query_course";
    }
    //去到修改界面
    @RequestMapping("/admin_update_course")
    public String toAdminCourseUpdate(int course_id,Model model){
        Course course = courseService.findCourseById(course_id);
        model.addAttribute("course",course);
        return "admin/admin_update_course";
    }
    //完成修改操作
    @RequestMapping("/update_course_database")
    public String toUpdateCourseDB(Course course,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        course.setLast_update_by(user_id);
        courseService.updateCourseById(course);
        return "redirect:/admin_query_course";
    }
    //完成数据库删除操作
    @RequestMapping("/delete_course_database")
    public String toDeleteCourseDB(int course_id){
        courseService.deleteCourseById(course_id);
        return "redirect:/admin_query_course";
    }

    //转到excel导入界面
    @RequestMapping("/admin_import_course")
    public String toAdminImportCourse(){
        return "admin/admin_import_course";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_course_database")
    public String toImportCourseDB(@RequestParam("person") String person,HttpSession session){
        System.out.println(person);
        int user_id = (int)session.getAttribute("user_id");
        dealCourse(person,user_id);
        return "redirect:/admin_query_course";
    }

    public  boolean dealCourse(String person,int user_id){
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
                    CourseBean rowCourse = new Gson().fromJson(job.toJSONString(),CourseBean.class);
                    Course course = changeToCourse(rowCourse);
                    courseService.insertCourse(course);
                    //寻找班级id，不存在则不插入
//                    Class cclass = classService.findClassByName(rowStu.getClass_name());
//                    if(cclass != null){
//                        Course course = changeToCourse(rowStu,cclass.getClass_id());
//                        course.setCourse_pwd("NCHU"+course.getCourse_code());
//                        course.setCreate_by(user_id);
//                        Course stu = courseService.findCourseByCode(course.getCourse_code());
//                        if(stu == null){
//                            courseService.insertCourse(course);
//                        }
//                        System.out.println("已经存在学生："+course.toString());
//                    }else{
//                        System.out.println("不存在的班级");
//                    }
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return false;
    }
}
