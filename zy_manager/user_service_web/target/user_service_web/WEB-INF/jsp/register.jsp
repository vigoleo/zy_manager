<%--
  Created by sapling
  User: sapling
  Date: 2017-12-02
  Time: 14:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common.jsp"></jsp:include>
    <title>注册页面</title>
</head>
<body class="media_screen_1200">
<div id="body_wrap">
    <div class="login_wrap">
        <div class="logo_wrap">
            <div class="logo">
            </div>
        </div>
        <div class="content clearfix" style="background:url(../img/bg_login.png) no-repeat center center;">
            <div class="lg_banner">
                <a href="#" target="_blank" class="banner1"></a>
            </div>
            <div class="lg_left ui-option-main-box" id="lg_content">
                <div class="login_mod_tab">
                </div>
                <div id="signform" class="formbox">
                    <div class="lg_form">
                        <form method="post">
                            <!-- 注册 start -->
                            <div class="mod_box lo_mod_box">
                                <div class="mod_box lo_mod_box">
                                    <div class="login_mod_tab">
                                        <div class="fl mod">
                                            <a class="lo_mod tab_on" lo-mod="normal" href="javascript:;">注册</a>
                                        </div>
                                    </div>
                                    <div class="ui-sign-item ui-name-item lg_item lg_name">
                                        <input id="username" type="text" maxlength="32" class="ui-input pwd_text" name="username"
                                               placeholder="用户名">
                                    </div>
                                    <div class="ui-sign-item ui-sign-common-item lg_item lg_pass">
                                        <input id="password" type="password" maxlength="32" class="ui-input pwd_text" name="password"
                                               placeholder="密码">
                                    </div>
                                    <div class="ui-sign-item ui-name-item lg_item lg_name">
                                        <input id="phone" type="text" maxlength="32" class="ui-input pwd_text" name="phone"
                                               placeholder="手机">
                                    </div>
                                    <div class="ui-sign-item ui-name-item lg_item lg_name">
                                        <input id="email" type="text" maxlength="32" class="ui-input pwd_text" name="email"
                                               placeholder="邮箱">
                                    </div>
                                    <div>
                                        <span style="margin-left: 10%;"><input type="radio" name="roleId" value="1"/>我是买家</span>
                                        <span style="margin-left: 30%;"><input type="radio" name="roleId" value="2"/>我是卖家</span>
                                    </div>
                                    <div class="lg_login clearfix">
                                        <input id="toRegister" type="submit" value="注册" class="sub" onclick="return false">
                                    </div>
                                </div>
                                <!-- 注册 end -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="logo_wrap">
</div>
</body>
<
<script>
    $(function(){
        //当点击注册按钮时做数据校验
        $("#toRegister").click(function(){

            var username=$("#username").val()
            var password=$("#password").val()
            var phone=$("#phone").val()
            var email=$("#email").val()
            //判断用户名是否为空，如果不为空还要发ajax去数据库验证用户名是否重复
            if(username!=undefined && username.trim()!=''){
                $.ajax({
                    url:'${ctx}/user/check/'+username+"/"+1,
                    type:"post",
                    data:{},
                    dataType:"json",
                    async: false,
                    success:function(result){
                        if(result.status==200){
                            if(result.object==false){
                                alert("用户名不能重复")
                                return
                            }
                            //如果用户名不重复 判断密码是否为空
                            if(password==undefined  || password.trim()==''){
                                alert("密码不能为空")
                                return
                            }else{
                                var flag=false
                                //如果邮箱不为空 那么判断邮箱是否重复
                                if(phone!=undefined && phone.trim()!=''){
                                    $.ajax({
                                        url:'${ctx}/user/check/'+phone+"/"+2,
                                        type:"post",
                                        dataType:"json",
                                        async: false,
                                        success:function(result){
                                            if(result.status==400){
                                                alert(result.msg)
                                                return
                                            }else{
                                                if(result.object==false){
                                                    flag=true
                                                    alert("手机不能重复")
                                                    return
                                                }
                                            }
                                        },
                                        error:function(){
                                            alert("请求失败")
                                        }
                                    })
                                }
                                //如果邮箱不为空 那么判断邮箱是否重复
                                if(email!=undefined && email.trim()!=''){
                                    $.ajax({
                                        url:'${ctx}/user/check/'+email+"/"+3,
                                        type:"post",
                                        dataType:"json",
                                        async: false,
                                        success:function(result){
                                            if(result.status==400){
                                                alert(result.msg)
                                                return
                                            }else{
                                                if(result.object==false){
                                                    flag=true
                                                    alert("邮箱不能重复")
                                                    return
                                                }
                                            }
                                        },
                                        error:function(){
                                            alert("请求失败")
                                        }
                                    })
                                }
                                if(!flag){
                                    //判断是否选择我是买家，还是我是卖家
                                    var isChecked=$("input[name='roleId']:checked").size()==0
                                    if(isChecked){
                                        alert("^_^请先选择我是卖家或者我是卖家")
                                        return
                                    }else{
                                        //去注册
                                        var data={}
                                        data.userName=username
                                        data.password=password
                                        data.roleId= $("input[name='roleId']:checked").val()
                                        if(phone!=undefined && phone.trim()!=''){
                                            data.phone=phone
                                        }
                                        if(email!=undefined && email!=''){
                                            data.email=email
                                        };
                                        $.ajax({
                                            url:'${ctx}/user/register',
                                            type:"post",
                                            data:data,
                                            dataType:"json",
                                            async: false,
                                            success:function(result){
                                            if(result.status==400){
                                                alert(result.msg)
                                                return
                                            }else{
                                                if(result.status==200){
                                                   window.location.href="${ctx}/user/toLogin"
                                                }
                                            }
                                        },
                                        error:function(){
                                            alert("请求失败")
                                        }
                                    })
                                    }
                                }


                            }

                        }else if(result.status==400){
                            alert(result.msg)
                            return;
                        }
                    },
                    error:function(){
                        alert("请求失败----")
                    }
                })
            }else{
                alert("用户名不能为空")
            }


        })


    })


</script>
</html>