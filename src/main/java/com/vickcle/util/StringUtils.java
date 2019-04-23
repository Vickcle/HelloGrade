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
}
