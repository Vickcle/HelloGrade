package com.vickcle.util;

import com.vickcle.model.CourseObject;

import java.io.*;
import java.util.List;

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
}
