//frida -U -f com.cz.babySister  -l jifen.js --no-pause
Java.perform(function(){
var pay = Java.use("com.cz.babySister.alipay.q");
pay.b.implementation = function()
{    
 console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
 return "9000";
}
var service = Java.use("com.cz.babySister.service.NetService");
  service.a.overload("java.lang.String").implementation = function()
   {
    console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()))    ;
    return "network";
}

var userinfo = Java.use("com.cz.babySister.javabean.UserInfo");
userinfo.getJifen.implementation  = function(){   
    console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    return "100000";
}

});
