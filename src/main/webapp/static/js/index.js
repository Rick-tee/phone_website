$(function () {
    //等待页面加载完毕
    getKind()
})

/**
 * 获取业务种类ajax
 */
function getKind(){
    $.ajax({
        url:"font/getKind.do",
        async:false,
        type:"get",
        success:function (data) {
            for (let i = 0; i < data.length; i++) {
                $("#kind").append("<option value=\""+data[i]['bkid']+"\">"+data[i]['bkName']+"</option>")
            }
        },
        error:function () {
            window.history.back();location.reload();
        }
    })
}

/**
 * 获得业务各个具体名称
 * @param obj 对象
 */
function getBusiness(obj){
    //清空内容
    $("#business").empty()

    $.ajax({
        url:"font/getBusiness.do",
        type:"get",
        data:{
            BKId:$("#" + obj.id + " option:selected").val()
        },
        success:function (data) {
            introduction = data
            $("#business").append("<option value=\"0\">----请选择具体报名机构----</option>")
            for (let i = 0; i < data.length; i++) {
                $("#business").append("<option value=\""+data[i]['bid']+"\">"+data[i]['bName']+"</option>")
            }
        },
        error:function () {
            alert("发现未知错误！")
        }
    })
}

/**
 * 获得机构的介绍
 * @param obj 对象
 */
function getIntroduction(obj){
    for (let i = 0; i < introduction.length; i++) {
        if (introduction[i]['bid'] == $("#" + obj.id + " option:selected").val()){
            $("#introduction").val(introduction[i]['comment'])
        }
    }
}

function formInfoSubmit(){
    //业务类型
    var kind = $("#kind").val()

    //机构名代码
    var business = $("#business").val()

    //姓名
    var name = $("#name").val()

    //性别
    var sex = $("input:radio:checked").val()

    //获取联系电话
    var tel = $("#tel").val()

    //获取地址
    var add = $("#add").val()

    //手机号码判断
    if (!phoneExp(tel)){
        confirm("请填写正确格式的手机号码!")
        return;
    }

    //姓名判断
    if (!nameExp(name)){
        confirm("请输入中文姓名!")
        return;
    }

    //设置联系地址
    if ($("#add").val().trim().length == 0){
        confirm("请输入联系地址!")
        return;
    }

    //判断用户选择的业务名称
    if ($("#business").val() == 0){
        confirm("请先选择报名机构名称")
        return;
    }

    //表单提交
    //获得表单对象
    var form = $("#payment")

    //设置method
    form.attr("method","post")

    //发送信息
    form.submit()
}

/**
 * 手机号码规则判断
 * @param phone 传入的手机号码
 * @returns {boolean} 正确：true；错误：false
 */
function phoneExp(phone) {
    return /^1[345789]\d{9}$/.test(phone)
}

/**
 * 用户名正则判断
 * @param name 传入的姓名参数
 * @returns {boolean} 返回布尔类型 true：符合；false：不符合
 */
function nameExp(name){
    return /^[\u4E00-\u9FA5]{1,5}$/.test(name)
}