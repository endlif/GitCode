package com.yyl.server;

import android.content.Context;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

public class MpageHandler implements IResourceUriHandler {
    private String acceptPrefix="/music";
    private Context context;
    public MpageHandler(Context context) {
        this.context = context;
    }
    @Override
    public boolean accept(String uri) {
        return uri.startsWith(acceptPrefix);
    }

    //输出想要看到的内容
    @Override
    public void postHandle(String uri, HttpContext httpContext) throws IOException {
        OutputStream OutputStream=httpContext.getUnderlySocket().getOutputStream();
        PrintWriter writer =new PrintWriter(OutputStream);
        writer.println("HTTP/1.1 200 OK");
        writer.println();
        writer.println("from resource in assets handler");
        writer.flush();
//        OutputStream.write("ok the music go".getBytes());

    }
}
