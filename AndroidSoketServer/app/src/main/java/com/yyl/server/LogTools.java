package com.yyl.server;

import android.util.Log;

public class LogTools {
    public static String tag = "SimpleHttpServer";
    public static boolean isdebug=true;
    public  static void  Log(String string){
        if (isdebug){
            Log.d(tag,string);
        }
    }
}
