package com.vickcle.controller;

import com.alibaba.fastjson.JSON;
import com.vickcle.model.Company;
import com.vickcle.model.Creer;
import com.vickcle.model.CreerObject;
import com.vickcle.model.GradeCreer;
import com.vickcle.service.CompanyService;
import com.vickcle.service.CreerService;
import com.vickcle.service.GradeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.vickcle.util.FileUtil.changeMapToTxt;
import static com.vickcle.util.WekaRecommend.recommendCreertoStudent;

@Controller
public class CreerController {
    @Autowired
    CreerService creerService;

    @Autowired
    GradeService gradeService;

    @Autowired
    CompanyService companyService;
    @RequestMapping("/admin_query_creer")
    public  String toAdminQueryCreer(){
        return "admin/admin_query_creer";
    }

    @RequestMapping("/admin_query_creer_item")
    @ResponseBody
    public  String toAdminQueryCreerItem(){
        Map<String,List<Creer>> map = new HashMap<>();
        List<Creer> list = creerService.findAllCreer();
        map.put("data",list);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/select_Creer_Info")
    @ResponseBody
    public  String selectCreerInfo(@Param("student_code")String student_code,@Param("student_name") String student_name,@Param("company_code")String company_code,@Param("company_name")String company_name){
        student_code = ("".equals(student_code))?"empty":student_code;
        student_name = ("".equals(student_name))?"empty":student_name;
        company_code = ("".equals(company_code))?"empty":company_code;
        company_name = ("".equals(company_name))?"empty":company_name;
        CreerObject creerObject = new CreerObject(student_code,student_name,company_code,company_name);
        Map<String,List<CreerObject>> map = new HashMap<>();
        List<CreerObject> list = creerService.selectCreerInfo(creerObject);
        map.put("data",list);
        return JSON.toJSONString(map);
//        try {
//            List<CreerObject> list = creerService.selectCreerInfo(creerObject);
//            map.put("data",list);
//            return JSON.toJSONString(map);
//        }catch (Exception e){
//            //map.put("data",null);
//            return JSON.toJSONString("error");
//        }
    }

    @RequestMapping("/admin_add_creer")
    public  String toAdmin_add_creer(){
        return "admin/admin_add_creer";
    }
    @RequestMapping("/add_creer_database")
    public String toAddCreerDB(@Param("creer_type" )String creer_type,@Param("student_id") String student_id,@Param("company_id") String company_id){
        creer_type = ("".equals(creer_type))?"empty":creer_type;
        student_id = ("".equals(student_id))?"0":student_id;
        company_id = ("".equals(company_id))?"0":company_id;
        int student = Integer.parseInt(student_id);
        int company = Integer.parseInt(company_id);
        Creer creer = new Creer(creer_type,student,company);
        try {
            creerService.insertCreer(creer);
            return "redirect:/admin_success_return";
        }catch (Exception e){
            creerService.insertCreer(creer);
            return "redirect:/admin_failed_return";
        }
    }
    @RequestMapping("/admin_update_creer")
    public String toAdminUpdateCreer(Model model, @Param("creer_id") int creer_id){
        CreerObject creerObject = creerService.selectCreerObjectById(creer_id);
        if(creerObject != null){
            model.addAttribute("creerObject",creerObject);
            return "admin/admin_update_creer";
        }
        return "admin/admin_update_creer";
    }

    @RequestMapping("/update_creer_database")
    public String updateCreerDB(CreerObject creerObject){
        if(creerObject!=null){
            Creer creer = new Creer(creerObject.getCreer_type(),creerObject.getStudent_id(),creerObject.getCompany_id());
            creer.setCreer_id(creerObject.getCreer_id());
            creerService.updateCreerById(creer);
        }
        return "redirect:/admin_query_creer";
    }

    @RequestMapping("/delete_creer_database")
    public String deleteCreerDB(@Param("creer_id") int creer_id){
        creerService.deleteCreerById(creer_id);
        return "redirect:/admin_query_creer";
    }

    @RequestMapping("/admin_success_return")
    @ResponseBody
    public String adminSuccessReturn(){
        Map<String,String> map = new HashMap<>();
        map.put("data","success");
        return JSON.toJSONString(map);
    }


    @RequestMapping("/admin_failed_return")
    @ResponseBody
    public String doFailedReturn(){
        Map<String,String> map = new HashMap<>();
        map.put("data","failed");
        return JSON.toJSONString(map);
    }

    //此处往下做就业推荐，具体思路如下
    //1.获得目前自己所学的全部课程的成绩信息
    //2.获得已经就业的对于你所学的学习成绩
    //3.对已经就业的进行聚类，
    //4.确定你所属于的类
    //5.遍历你所属的类中的测试数据，去取就业单位和就业单位权重
    //6.将上述结果中的前三显示出来
    @RequestMapping("/get_creer_recommend")
    @ResponseBody
    public String toGetCreerRecommend(HttpSession session){
        try {
            int student_id = (int) session.getAttribute("user_id");
            GradeCreer gradeCreer = new GradeCreer(student_id);
            List<GradeCreer> gradeList = new ArrayList<>();
            gradeList = gradeService.selectGradeForCreer(gradeCreer);
            //1.已经获得自己所学课程的全部信息
            if(!gradeList.isEmpty()){
            //2.去找已经就业的学生，并取得他们对于你所学的课程取得的成绩
                List<Creer> creerList = new ArrayList<>();
                creerList = creerService.findAllCreer();
                if (!creerList.isEmpty()){
                    //俩步：1.打开循环，是个二重循环，先后不重要，在循环开始前先用一种存储结构去存存储取得的信息。此处推荐使用map
                    Map<Integer,List<GradeCreer>> map = new HashMap<>();
                   for(Creer tmpCreer:creerList){
                       List<GradeCreer> list = new ArrayList<>();
                       for(GradeCreer tmpGrade:gradeList){
                           GradeCreer gradeCreer1 = new GradeCreer(tmpCreer.getStudent_id(),tmpGrade.getCourse_id());
                           List<GradeCreer> list1 = new ArrayList<>();
                           list1 = gradeService.selectGradeForCreer(gradeCreer1);
                           if (list1.size() == 1){
                               list.add(list1.get(0));
                           }else{
                               list.add(new GradeCreer());
                               System.out.println(tmpGrade.toString()+ "...................");
                           }
                       }
                       map.put(tmpCreer.getStudent_id(),list);
                   }
                   //此处先打印map
                   //单次验证这里是正确的，现在开始对其做处理
                   //循环结束后理论上能得到一个Map,对这个map进行读写文件的操作 gradeList.size();
                    changeMapToTxt(map,gradeList.size());
                    List<Integer> value = new ArrayList<>();
                    value = recommendCreertoStudent(gradeList,2);
                    //此处核验value是否为空，有些时候可以返回最多的几个就业，稍后会做一张表来实现
                    if(!value.isEmpty()){
                        //此处开始遍历value,并用另一个Map去计数，因为要去前几个就业推荐
                        Map<Integer,Integer> mapCreer = new HashMap<>();
                        for(int i = 0;i<value.size();i++){
                            Creer creer = creerList.get(value.get(i));
                            if(mapCreer.get(creer.getCompany_id())!=null){
                                mapCreer.put(creer.getCompany_id(), mapCreer.get(creer.getCompany_id()) + 1);
                            }else {
                                mapCreer.put(creer.getCompany_id(), 1);
                            }
                        }
                        //循环结束后应该得到就业数据了，先将数据输出:获取的基本正确，但可能有问题。这里我感觉是数据量的问题。
                        //按照道理，此处依然需要验证：
                        if(!mapCreer.isEmpty()) {
                            System.out.println(JSON.toJSONString(mapCreer));
                            //如上所示，此时已经获得到一些数据（公司的id，那么可以逐个取出了）
                            Map<String, List<Company>> companyMap = new HashMap<>();
                            List<Company> companyList = new ArrayList<>();
                            for (Map.Entry<Integer, Integer> entry : mapCreer.entrySet()) {
                                //System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
                                Company company = new Company();
                                company = companyService.findCompanyById(entry.getKey());
                                if(company!=null){
                                    companyList.add(company);
                                }
                            }
                            //这里还需要校验一次，但实际上为空值时在前台是不显示的。
                            companyMap.put("data",companyList);
                            return JSON.toJSONString(companyMap);
                        }else{
                            //这里发生错误的概率理论上比较小
                        }
                    }
                }else{
                    System.out.println("没有已经就业的人群，故无参照！");
                }
            }else{
                System.out.println("系统中没有您的成绩记录，故无法推荐就业");
            }
        }catch(Exception e){

        }
        return "";
    }
}
