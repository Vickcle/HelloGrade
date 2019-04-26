package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.vickcle.bean.GradeBean;
import com.vickcle.bean.GradeHead;
import com.vickcle.model.*;
import com.vickcle.service.CourseService;
import com.vickcle.service.GradeService;
import com.vickcle.service.LessonService;
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
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.vickcle.util.FileUtil.changeListToTxt;
import static com.vickcle.util.StringUtils.getCutOutString;
import static com.vickcle.util.StringUtils.getSQLContact;
import static com.vickcle.util.WekaPredict.useWekaPredict;

@Controller
public class GradeController {

    @Autowired
    GradeService gradeService;
    @Autowired
    CourseService courseService;
    @Autowired
    LessonService lessonService;
    @Autowired
    StudentService studentService;
    //跳转界面
    @RequestMapping("/admin_query_grade")
    public String toAdminQueryGrade(Model model){
        List<GradeObject> list = gradeService.selectAllGradeInfo();
        int page_total = list.size()/10 + 1;
        if(list.size()>10){
            list = list.subList(0,10);
        }
        model.addAttribute("list",list);
        //传入总页数
        model.addAttribute("page_total",page_total);
        return "admin/admin_query_grade";
    }

    @RequestMapping("/admin_query_grade_pages")
    public String toAdminQueryGradePages(Model model,HttpSession session){
        int page_num = (int) session.getAttribute("page_num");
        int page_size = (int) session.getAttribute("page_size");
        List<GradeObject> list = gradeService.selectAllGradeInfo();
        int page_total = list.size()/10 + 1;
        if(list.size()>page_num*page_size){
            list = list.subList((page_num-1)*page_size,page_num*page_size);
        }else{
            list = list.subList((page_num-1)*page_size,list.size());
        }
        model.addAttribute("list",list);
        model.addAttribute("page_total",page_total);
        return "admin/admin_query_grade";
    }
    @RequestMapping("/admin_query_grade_term")
    @ResponseBody
    public String toAdminQueryGradeTerm(@Param("student_code") String student_code,@Param("student_name") String student_name,@Param("course_name") String course_name){
        Map<String,List<GradeObject>> msg = new HashMap<>();
        student_code = ("".equals(student_code))?"empty":student_code;
        student_name = ("".equals(student_name))?"empty":student_name;
        course_name = ("".equals(course_name))?"empty":course_name;
        GradeObject gradeObject = new GradeObject(student_code,student_name,course_name);
//        List<GradeObject> list = gradeService.selectAllGradeInfo();
        List<GradeObject> list = gradeService.selectGradeInfoByTerms(gradeObject);
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

    @RequestMapping("/teacher_query_grade")
    public String toTeacherQueryGrade(Model model , HttpServletResponse response){
        List<GradeObject> list = gradeService.selectAllGradeInfo();
        int page_total = list.size()/10 + 1;
        if(list.size()>10){
             list = list.subList(0,10);
        }
        //传入总页数
        model.addAttribute("list",list);
        model.addAttribute("page_total",page_total);
        return "teacher/teacher_query_grade";
    }
    //用于条件查询（实际条件查询和查总的可以放到一起）
    @RequestMapping("/teacher_query_grade_fields")
    public String toTeacherQueryGrade_Fields(){
        //传入总页数
        return "teacher/teacher_query_grade_fields";
    }

    @RequestMapping("/teacher_query_grade_term")
    @ResponseBody
    public String toTeacherQueryGradeTerm(HttpSession session,@Param("student_code") String student_code,@Param("student_name") String student_name,@Param("course_name") String course_name){
        Map<String,List<GradeObject>> msg = new HashMap<>();
        student_code = ("".equals(student_code))?"empty":student_code;
        student_name = ("".equals(student_name))?"empty":student_name;
        course_name = ("".equals(course_name))?"empty":course_name;
        GradeObject gradeObject = new GradeObject(student_code,student_name,course_name);
//        List<GradeObject> list = gradeService.selectAllGradeInfo();
        List<GradeObject> list = gradeService.selectGradeInfoByTerms(gradeObject);
        //当size>当前页*记录数时
        System.out.println(list.toString());
        msg.put("data",list);
        return JSON.toJSONString(msg);
    }

    @RequestMapping("/teacher_query_grade_paras")
    @ResponseBody
    public String toTeacherQueryGradeParas(HttpSession session, @Param("page_num") int page_num, @Param("page_size") int page_size){
        session.setAttribute("page_num",page_num);
        session.setAttribute("page_size",page_size);
        Map<String,String> msg = new HashMap<>();
        msg.put("state","1");
        return JSON.toJSONString(msg);
    }
    @RequestMapping("/teacher_query_grade_pages")
    public String toTeacherQueryGradePages(Model model,HttpSession session){
        int page_num = (int) session.getAttribute("page_num");
        int page_size = (int) session.getAttribute("page_size");
        List<GradeObject> list = gradeService.selectAllGradeInfo();
        int page_total = list.size()/10 + 1;
        if(list.size()>page_num*page_size){
            list = list.subList((page_num-1)*page_size,page_num*page_size);
        }else{
            list = list.subList((page_num-1)*page_size,list.size());
        }
        model.addAttribute("list",list);
        model.addAttribute("page_total",page_total);
        return "teacher/teacher_query_grade";
    }

    @RequestMapping("/admin_add_grade")
    public String toAdminGradeAdd(){
        return "admin/admin_add_grade";
    }
    //实现插入操作
    @RequestMapping("/add_grade_database")
    public String toAddGradeDB(Grade grade, HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        grade.setCreate_by(user_id);
        gradeService.insertGrade(grade);
        return "redirect:/admin_query_grade";
    }
    //去到修改界面
    @RequestMapping("/admin_update_grade")
    public String toAdminGradeUpdate(int grade_id,Model model){
        Grade grade = gradeService.findGradeById(grade_id);
        model.addAttribute("grade",grade);
        return "admin/admin_update_grade";
    }
    //完成修改操作
    @RequestMapping("/update_grade_database")
    public String toUpdateGradeDB(Grade grade,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        grade.setLast_update_by(user_id);
        gradeService.updateGradeById(grade);
        return "redirect:/admin_query_grade";
    }

    @RequestMapping("/student_query_grade_fields")
    public String toStudentQueryGradeField(){
        //传入总页数
        return "student/student_query_grade_fields";
    }

//    @RequestMapping("/student_query_grade_term")
//    @ResponseBody
//    public String toStudentQueryGradeTerm(@Param("teacher_name") String teacher_name,@Param("course_name") String course_name){
//        Map<String,List<GradeObject>> msg = new HashMap<>();
//        teacher_name = ("".equals(teacher_name))?"empty":teacher_name;
//        course_name = ("".equals(course_name))?"empty":course_name;
//        GradeObject gradeObject = new GradeObject(teacher_name,course_name);
//
////        List<GradeObject> list = gradeService.selectAllGradeInfo();
//        List<GradeObject> list = gradeService.selectGradeInfoByTerms(gradeObject);
//        msg.put("data",list);
//        return JSON.toJSONString(msg);
//    }

    //完成数据库删除操作
    @RequestMapping("/delete_grade_database")
    public String toDeleteGradeDB(int grade_id){
        gradeService.deleteGradeById(grade_id);
        return "redirect:/admin_query_grade";
    }

    //转到excel导入界面
    @RequestMapping("/admin_import_grade")
    public String toAdminImportGrade(){
        return "admin/admin_import_grade";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_grade_database")
    public String toImportGradeDB(@RequestParam("person") String person,HttpSession session){
        System.out.println(person);
        int user_id = (int)session.getAttribute("user_id");
        dealGrade(person,user_id);
        return "redirect:/admin_query_grade";
    }

    //学生导出成绩
    @RequestMapping("/student_export_grade")
    public String toStudentExportGrade(){
        return "student/student_export_grade";
    }

    //转到excel导入界面
    @RequestMapping("/teacher_import_grade")
    public String toTeacherImportGrade(){
        return "teacher/teacher_import_grade";
    }
    //完成excel数据导入操作
    @RequestMapping("/import_grade_databaseT")
    public String toImportGradeDBT(@RequestParam("person") String person,HttpSession session){
        int user_id = (int)session.getAttribute("user_id");
        dealGrade(person,user_id);
        return "redirect:/teacher_query_grade";
    }


    //获得成绩关联信息
    //这里要做什么，传入一门已经得到成绩的课程，去找他的后续课程，一旦找到，那么去找已经产生成绩的组训练模型，若无，则返回String无数据
    //若有，则返回预测的成绩数据
    @RequestMapping("/get_course_relation_info")
    @ResponseBody
    public String getCourseRelationInfo(@Param("grade_id") int grade_id){
        GradeObject gradeObject = gradeService.selectGradeInfoByGradeId(grade_id);
        if(gradeObject!=null){
            Course course1 = courseService.findCourseByName(gradeObject.getCourse_name());
            if (course1!=null){
                Course course2 = courseService.findCourseByBeforeId(course1.getCourse_id());
                if(course2!=null){
                    String sql = getSQLContact(course1.getCourse_name(),course2.getCourse_name());
                    System.out.println(sql);
                    List<CourseObject>  list = gradeService.dealWithSqlSentences(sql);
                    Map<String,String> map = new HashMap<>();
                    String str = "1";
                    try {
                        changeListToTxt(list);
                        str = useWekaPredict(gradeObject.getGrade_total()).get("predict");
                        map.put("course_name",course2.getCourse_name());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    map.put("data",str);
                    //将list转换为txt文件写入
                    return JSON.toJSONString(map);
                }
            }
        }
        Map<String,String> map = new HashMap<>();
        map.put("data","无后续课程");
        map.put("course_name","暂无后续课程");
        //将list转换为txt文件写入
        return JSON.toJSONString(map);
    }

    public  boolean dealGrade(String person,int user_id){
        byte[] utf8Bytes = new byte[20000];
        try {
            utf8Bytes = person.getBytes("UTF-8");
            String utf8Str = new String(utf8Bytes, "UTF-8");
            JSONArray jsonArray = JSONArray.parseArray(utf8Str);
            if(jsonArray.size()>=1){//大于等于1才是合法数据
                //这里不需要头部
                //设置初始密码为学号
                JSONObject rowClassTemp = jsonArray.getJSONObject(0);
                GradeHead rowClass = new Gson().fromJson(rowClassTemp.toJSONString(),GradeHead.class);
                //获得课程id
                //本身教师id已经得到
                //获得学期可唯一确定实际课程
                String course_code = getRowClassCode(rowClass);
                Course course = courseService.findCourseByCode(course_code);
                if (course==null){
                    return false;
                }
                //1.获得course_id
                //2.获得teacher_id
                //3.获得lesson_duration
                JSONObject rowLessonTemp = jsonArray.getJSONObject(1);
                GradeHead rowLesson = new Gson().fromJson(rowLessonTemp.toJSONString(),GradeHead.class);
                String lessonDuration = getRowLessonDuration(rowLesson);
                int course_id = course.getCourse_id();
                Lesson lesson = lessonService.findLessonInGrade(course_id,user_id,lessonDuration);
                JSONObject arr = jsonArray.getJSONObject(2);
                System.out.println(arr.toJSONString());
                for(int i=3;i<jsonArray.size();i++){
                    JSONObject job = jsonArray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                    //先转换为GradeBean
                    GradeBean gradeBean = new Gson().fromJson(job.toJSONString(),GradeBean.class);
                    System.out.println(gradeBean.toString());
                    if(gradeBean!=null){
                        if (!gradeBean.getStudent_codea().equals("")){
                            Grade gradea = new Grade();
                            //获取第一个对象的成绩，学号没有则忽略
                            Student student = studentService.findStudentByCode(gradeBean.getStudent_codea());
                            if(student!=null){
                                System.out.println(student.toString());
                                int student_id = student.getStudent_id();
                                String grade_testa = gradeBean.getGrade_testa();
                                grade_testa =  (grade_testa.equals(""))?"0":grade_testa;
                                String grade_usuala = gradeBean.getGrade_usuala();
                                grade_usuala =  (grade_usuala.equals(""))?"0":grade_usuala;
                                String grade_interima = gradeBean.getGrade_interima();
                                grade_interima =  (grade_interima.equals(""))?"0":grade_interima;
                                String grade_terminala = gradeBean.getGrade_terminala();
                                grade_terminala =  (grade_terminala.equals(""))?"0":grade_terminala;
                                String grade_totala = gradeBean.getGrade_totala();
                                grade_totala =  (grade_totala.equals(""))?"0":grade_totala;

                                gradea.setStudent_id(student_id);
                                gradea.setLesson_id(lesson.getLesson_id());
                                gradea.setGrade_test(Double.parseDouble(grade_testa));
                                gradea.setGrade_usual(Double.parseDouble(grade_usuala));
                                gradea.setGrade_interim(Double.parseDouble(grade_interima));
                                gradea.setGrade_terminal(Double.parseDouble(grade_terminala));
                                gradea.setGrade_total(Double.parseDouble(grade_totala));
                                gradeService.insertGrade(gradea);
                            }
                        }
                        if (!gradeBean.getStudent_codeb().equals("")){
                            Grade gradeb = new Grade();
                            Student student = studentService.findStudentByCode(gradeBean.getStudent_codeb());
                            if(student!=null){
                                System.out.println(student.toString());
                                int student_id = student.getStudent_id();
                                String grade_testb = gradeBean.getGrade_testb();
                                grade_testb =  (grade_testb.equals(""))?"0":grade_testb;
                                String grade_usualb = gradeBean.getGrade_usualb();
                                grade_usualb =  (grade_usualb.equals(""))?"0":grade_usualb;
                                String grade_interimb = gradeBean.getGrade_interimb();
                                grade_interimb =  (grade_interimb.equals(""))?"0":grade_interimb;
                                System.out.println(grade_interimb);
                                String grade_terminalb = gradeBean.getGrade_terminalb();
                                grade_terminalb =  (grade_terminalb.equals(""))?"0":grade_terminalb;
                                String grade_totalb = gradeBean.getGrade_totalb();
                                grade_totalb =  (grade_totalb.equals(""))?"0":grade_totalb;
                                gradeb.setStudent_id(student_id);
                                gradeb.setLesson_id(lesson.getLesson_id());
                                gradeb.setGrade_test(Double.parseDouble(grade_testb));
                                gradeb.setGrade_usual(Double.parseDouble(grade_usualb));
                                gradeb.setGrade_interim(Double.parseDouble(grade_interimb));
                                gradeb.setGrade_terminal(Double.parseDouble(grade_terminalb));
                                gradeb.setGrade_total(Double.parseDouble(grade_totalb));
                                gradeService.insertGrade(gradeb);
                            }
                        }
                    }

                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getRowClassCode(GradeHead rowClass){
        //获取头部的串
        String str = rowClass.getHead();
        //用空格取代
        String str2 = str.replace(" ","");
        //调用处理方法
        String str3 = getCutOutString(str2,"课程编码:","课程名称");
        return str3;
    }
    public String getRowLessonDuration(GradeHead rowLesson){
        //获取头部的串
        String str = rowLesson.getHead();
        //用空格取代
        String str2 = str.replace(" ","");
        //调用处理方法
        String str3 = getCutOutString(str2,"开课学期:","考核方式");
        return str3;
    }
}
