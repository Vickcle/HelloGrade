package com.vickcle.util;

public class StringUtils {
    public static String getCutOutString(String str, String start, String endwith) {
        String result = "";
        if (str.contains(start)) {
            String s1 = str.split(start)[1];
            if (endwith == null || "".equals(endwith)) {
                result = s1;
            } else {
                String s2[] = s1.split(endwith);
                if (s2 != null) {
                    result = s2[0];
                }
            }
        }
        return result;
    }

    //SQL语句拼接
    public static String getSQLContact(String course_name1,String course_name2){
        String str = "select " +
                "s.student_code student_code," +
                "s.student_name student_name," +
                "sum(case s.course_name when '" +course_name1+"' then s.grade_total end)  as grade1," +
                "sum(case s.course_name when '" +course_name2+"' then s.grade_total end)  as grade2 " +
                "from grade_info s " +
                "group by s.student_code;";
        return str;
    }
}
