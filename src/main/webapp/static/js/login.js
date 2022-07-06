$(function(){
    //页面加载完毕
    //用户名获得焦点
    $("#username").focus(function () {
        $("#errorMsg").text("")
    })

    //密码获得焦点
    $("#password").focus(function () {
        $("#errorMsg").text("")
    })
});

/**
 * 管理员登录函数
 */
function login(){
    //获得用户名
    var userName = $("#username").val()

    //获得密码
    var password = $("#password").val()

    //判断用户名和密码
    if (userName.trim().length == 0 || password.trim().length == 0){
        //给出提示
        $("#errorMsg").text("用户名，密码不符合规范")
        return;
    }

    //发起请求
    var form = $("#login")

    //设置本地域
    localStorage.setItem("userName",$("#username").val())

    form.submit()
}