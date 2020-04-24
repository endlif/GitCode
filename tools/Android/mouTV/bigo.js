
Java.perform(function(){
    // var am = Java.use("com.loc.am");
    // am.z.overload('java.lang.String', 'java.util.Map', 'boolean').implementation = function(arg_0, arg_1, arg_2) {
    //     console.log("am->z (argType: java.lang.String): " + arg_0);
    //     console.log("am->z (argType: java.util.Map): " + arg_1);
    //     console.log("am->z (argType: boolean): " + arg_2);
    //     var retval = this.z(arg_0, arg_1, arg_2)
    //     console.log("am->z (retType: java.net.HttpURLConnection): " + retval)
    //     return retval;
    // }
    // am.z.overload('java.lang.String', 'java.util.Map', '[B').implementation = function(arg_0, arg_1, arg_2) {
    //     console.log("am->z (argType: java.lang.String): " + arg_0);
    //     console.log("am->z (argType: java.util.Map): " + arg_1);
    //     console.log("am->z (argType: [B): " + arg_2);
    //     var retval = this.z(arg_0, arg_1, arg_2)
    //     console.log("am->z (retType: com.loc.ap): " + retval)
    //     return retval;
    // }
    // hook log
    // var d = Java.use("com.yy.iheima.util.d");
    // d.x.overload('java.lang.String', 'java.lang.String').implementation = function(arg_0, arg_1) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("d->x (argType: java.lang.String): " + arg_0);
    //     console.log("d->x (argType: java.lang.String): " + arg_1);
    //     var retval = this.x(arg_0, arg_1)
    //     console.log("d->x (retType: int): " + retval)
    //     return retval;
    // }
    // d.z.overload('java.lang.String', 'java.lang.String').implementation = function(arg_0, arg_1) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("d->z (argType: java.lang.String): " + arg_0);
    //     console.log("d->z (argType: java.lang.String): " + arg_1);
    //     var retval = this.z(arg_0, arg_1)
    //     console.log("d->z (retType: int): " + retval)
    //     return retval;
    // }
    // d.w.overload('java.lang.String', 'java.lang.String').implementation = function(arg_0, arg_1) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("d->w (argType: java.lang.String): " + arg_0);
    //     console.log("d->w (argType: java.lang.String): " + arg_1);
    //     var retval = this.w(arg_0, arg_1)
    //     console.log("d->w (retType: int): " + retval)
    //     return retval;
    // }

    // var x_CreateUser = Java.use("sg.bigo.live.protocol.UserAndRoomInfo.x");
    // x_CreateUser.z.overload('int', 'java.util.Map').implementation = function(arg_0, arg_1) {
    //     // console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("x_CreateUser->z (argType: int): " + arg_0);
    //     console.log("x_CreateUser->z (argType: java.util.Map): " + arg_1);
    //     var retval = this.z(arg_0, arg_1)
    //     console.log("x_CreateUser->z (retType: sg.bigo.live.aidl.UserInfoStruct): " + retval)
    //     return retval;

    // }

    // var w_ProtoSourceHelpe = Java.use("sg.bigo.sdk.network.ipc.w");
    
    // w_ProtoSourceHelpe.z.overload('sg.bigo.svcapi.IProtocol', 'sg.bigo.svcapi.k', 'int', 'int', 'int', 'boolean').implementation = function(arg_0, arg_1, arg_2, arg_3, arg_4, arg_5) {
    //     console.log("w_ProtoSourceHelpe->z (argType: sg.bigo.svcapi.IProtocol): " + arg_0);
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("w_ProtoSourceHelpe->z (argType: sg.bigo.svcapi.k): " + arg_1);
    //     console.log("w_ProtoSourceHelpe->z (argType: int): " + arg_2);
    //     console.log("w_ProtoSourceHelpe->z (argType: int): " + arg_3);
    //     console.log("w_ProtoSourceHelpe->z (argType: int): " + arg_4);
    //     console.log("w_ProtoSourceHelpe->z (argType: boolean): " + arg_5);
    //     var retval = this.z(arg_0, arg_1, arg_2, arg_3, arg_4, arg_5)
    //     console.log("w_ProtoSourceHelpe->z (retType: boolean): " + retval)
    //     return retval;

    // }

    // var y_IPCClient = Java.use("sg.bigo.sdk.network.ipc.y");
    
    // y_IPCClient.z.overload('sg.bigo.sdk.network.ipc.bridge.entity.IPCRequestEntity', 'sg.bigo.svcapi.k').implementation = function(arg_0, arg_1) {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     console.log("y_IPCClient->z (argType: sg.bigo.sdk.network.ipc.bridge.entity.IPCRequestEntity): " + arg_0);
    //     console.log("y_IPCClient->z (argType: sg.bigo.svcapi.k): " + arg_1);
    //     var retval = this.z(arg_0, arg_1)
    //     console.log("y_IPCClient->z (retType: boolean): " + retval)
    //     return retval;

    // }
    // var PCS_GetKKUserInfo = Java.use("com.yy.sdk.protocol.videocommunity.PCS_GetKKUserInfo");
    // PCS_GetKKUserInfo.uri.overload().implementation = function() {
    //     console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
    //     var retval = this.uri()
    //     console.log("PCS_GetKKUserInfo->uri (retType: int): " + retval)
    //     return retval;

    // }
    var x = Java.use("com.yy.sdk.y.x");
    x.onLinkdConnStat.overload('int').implementation = function(arg_0) {
        console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
        console.log("x->onLinkdConnStat (argType: int): " + arg_0);
        this.onLinkdConnStat(arg_0);

    }
    var c = Java.use("com.yy.sdk.util.c");
    c.a.overload('java.lang.String').implementation = function(arg_0) {
        console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
        console.log("x->onLinkdConnStat (argType: int): " + arg_0);
        console.log("c->a (argType: java.lang.String): " + arg_0);
        var retval = this.a(arg_0)
        console.log("c->a (retType: org.json.JSONObject): " + retval)
        return retval;

    }
    var x_YYClient = Java.use("com.yy.sdk.y.x");
    x_YYClient.O.overload().implementation = function() {
        console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));
        this.O();

    }

    var v = Java.use("com.yy.sdk.config.v");
    v.p.overload().implementation = function() {
        var retval = this.p()
        console.log("v->p (retType: java.lang.String): " + retval)
        return retval;

    }

});
