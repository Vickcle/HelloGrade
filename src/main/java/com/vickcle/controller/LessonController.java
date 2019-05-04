package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Lesson;
import com.vickcle.model.LessonObject;
import com.vickcle.service.ClassService;
import com.vickcle.service.LessonService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LessonController {

    @Autowired
    LessonService lessonService;
    @Autowired
    ClassService classService;
    //跳转界面
    @RequestMapping("/admin_query_lesson")
    public String toAdminQueryLesson(Model model , HttpServletResponse response){
        List<Lesson> list = lessonService.findAllLesson();
        model.addAttribute("list",list);
        return "admin/admin_query_lesson";
    }
    @RequestMapping("/admin_add_lesson")
    public String toAdminLessonAdd(){
        return "admin/admin_add_lesson";
    }
    //实现插入操作
    @RequestMapping("/add_lesson_database")
    public String toAddLessonDB(Lesson lesson, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        lesson.setCreate_by(user_id);
        lessonService.insertLesson(lesson);
        return "redirect:/admin_query_lesson";
    }
    //去到修改界面
    @RequestMapping("/admin_update_lesson")
    public String toAdminLessonUpdate(int lesson_id,Model model){
        Lesson lesson = lessonService.findLessonById(lesson_id);
        model.addAttribute("lesson",lesson);
        return "admin/admin_update_lesson";
    }
    //完成修改操作
    @RequestMapping("/update_lesson_database")
    public String toUpdateLessonDB(Lesson lesson,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        lesson.setLast_update_by(user_id);
        lessonService.updateLessonById(lesson);
        return "redirect:/admin_query_lesson";
    }
    //完成数据库删除操作
    @RequestMapping("/delete_lesson_database")
    public String toDeleteLessonDB(int lesson_id){
        lessonService.deleteLessonById(lesson_id);
        return "redirect:/admin_query_lesson";
    }

    //转到excel导入界面
    @RequestMapping("/admin_import_lesson")
    public String toAdminImportLesson(){
        return "admin/admin_import_lesson";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_lesson_database")
    public String toImportLessonDB(@RequestParam("person") String person,HttpSession session){
        System.out.println(person);
        int user_id = (int)session.getAttribute("user_id");
        dealLesson(person,user_id);
        return "redirect:/admin_query_lesson";
    }

    @RequestMapping("/teacher_get_lesson_info")
    @ResponseBody
    public String getTeacherLessonInfo(@Param("course_name")String course_name,@Param("course_code") String course_code){
        course_code = ("".equals(course_code))?"empty":course_code;
        course_name = ("".equals(course_name))?"empty":course_name;
        Map<String,List<LessonObject>> msg = new HashMap<>();
        LessonObject lessonObject = new LessonObject(course_code,course_name);
        List<LessonObject> list = lessonService.selectLessonInfo(lessonObject);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

    public  boolean dealLesson(String person,int user_id){
        byte[] utf8Bytes = new byte[20000];
        try {
//            utf8Bytes = person.getBytes("UTF-8");
//            String utf8Str = new String(utf8Bytes, "UTF-8");
//            JSONArray jsonArray = JSONArray.parseArray(utf8Str);
//            if(jsonArray.size()>=1){//大于等于1才是合法数据
//                //这里不需要头部
//                //设置初始密码为学号
//
//                for(int i=0;i<jsonArray.size();i++){
//                    JSONObject job = jsonArray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
//
//
//                }
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

//    //用来处理数据
//    public  boolean dealLesson(String person){
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
//                    LessonBean lessonBean = new Gson().fromJson(job.toJSONString(),LessonBean.class);
//                    int class_id =  classService.findClassByName(lessonBean.getClass_name()).getClass_id();
//                    Lesson lesson = changeToLesson(lessonBean,class_id);
//                    lesson.setLesson_pwd("NCHU"+lesson.getLesson_code());
//                    //此处理论上要做处理，找到后就不插入
//                    lessonService.insertLesson(lesson);
//                }
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        return true;
//    }
}
