package com.yyl.server;

import java.io.IOException;
import java.io.InputStream;

public class StreamToolKit {
    //inputStream对流里的数据进行处理
    public static String readLine(InputStream nis) throws IOException {
        StringBuffer sb = new StringBuffer();
        int a = 0, b = 0;
        while (b != -1 && !(a == '\r' && b == '\n')) {
            a = b;
            b = nis.read();
            sb.append((char) b);
        }
        if (sb.length() == 0) {
            return null;
        }
        return sb.toString();
    }
}
