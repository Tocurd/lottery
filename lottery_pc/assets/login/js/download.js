var Newbee = {}
$(function(){
            var winHeight = $(window).height();
                function is_weixin(){
                    var ua = navigator.userAgent.toLowerCase();
                    if (ua.match(/MicroMessenger/i) == "micromessenger"){
                           return true;
                        } else {
                              return false;
                        }
                    }
                var isWeixin = is_weixin();
                if(isWeixin){
                    $(".weixin-tip").css("height",winHeight);
                    $(".weixin-tip").show();
                }
        })
//windows客户端
Newbee.windows = {
    size:'23.8MB',
    updatetime:'2015-04-15',
    url:'http://www.newbee.net/download/nbclient-win.rar'
}
//mac客户端
Newbee.mac = {
    size:'32MB',
    updatetime:'2015-04-10',
    url:'http://www.newbee.net/download/nbclient-mac.dmg'
}
//iPhone 客户端
Newbee.iphone = {
    size:'6.6MB',
    updatetime:'2015-07-28',
    url: 'http://www.newbee.net/down_iosclient.shtml'
    //url:'http://www.pgyer.com/m9NM'
}
//Android 客户端
Newbee.android = {
    size:'2.0MB',
    updatetime:'2016-04-27',
    url:'http://www.newbee.net/download/com.newbee.apk'
}
//客服系统 客户端
Newbee.chart = {
    android_size:'3.6MB',
    android_url:'http://www.newbee.net/download/nbchar.apk',
    iphone_size:'7.4MB',
    iphone_url: 'http://www.newbee.net/down_iosservice.shtml'
}
