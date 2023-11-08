package org.Util;

public class Time {
   public static String getTime(String ampm, String hour, String minute) {
      if(ampm.equals("pm")) {
         hour = String.valueOf(Integer.parseInt(hour)+12);
      }
      
      String result = hour+":"+minute;
      return result;
   }
}