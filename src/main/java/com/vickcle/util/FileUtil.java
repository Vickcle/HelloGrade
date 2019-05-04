package com.vickcle.util;

import com.vickcle.model.CourseObject;
import com.vickcle.model.GradeCreer;

import java.io.*;
import java.util.List;
import java.util.Map;

public class FileUtil {
    public static String changeListToTxt(List<CourseObject> list) throws IOException {
        File file = new File("D:\\out.txt");
        FileOutputStream fos = new FileOutputStream(file);
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
        bw.write("@relation 'test'");
        bw.newLine();
        bw.write("@attribute CUR numeric");
        bw.newLine();
        bw.write("@attribute PRE numeric");
        bw.newLine();
        bw.write("@data");
        bw.newLine();
        for (int i = 0; i < list.size(); i++) {
            bw.write(list.get(i).getGrade1()+","+list.get(i).getGrade2());
            bw.newLine();
        }
        bw.close();
        return "success";
    }

    public static String changeMapToTxt(Map<Integer,List<GradeCreer>> map,int num) throws IOException {
        File file = new File("D:\\Library\\weka\\creer.txt");
        FileOutputStream fos = new FileOutputStream(file);
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
        bw.write("@relation 'grade_creer'");
        bw.newLine();
        //此处不知参数个数，因此需要遍历第一遍,实际是，这边很难得到统一的值，策略只能是统一名称加下标
        if(!map.isEmpty()){
            for(int i = 0;i<num;i++){
                bw.write("@attribute value"+i+" numeric");
                bw.newLine();
            }
            bw.write("@data");
            bw.newLine();
            //开始写入数据
            for (Map.Entry<Integer, List<GradeCreer>> entry : map.entrySet()) {
                //System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
                //bw.write(entry.getKey()+" ");
                for(int i=0;i<entry.getValue().size();i++){
                    bw.write(entry.getValue().get(i).getGrade_total()+" ");
                }
                bw.newLine();
            }
        }else{
            System.out.println("map is empty!");
        }
        bw.close();
        return "success";
    }
}
