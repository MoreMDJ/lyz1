<!DOCTYPE html>
<html lang="zh-CN" class="bgc-f3f4f6">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="">
        <meta name="copyright" content="" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>乐易装</title>
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_common.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_account_settings.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/date.css"/>
        <!-- js -->
        <script type="text/javascript" src="/client/js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="/client/js/date.js" ></script>
        <script type="text/javascript" src="/client/js/iscroll.js" ></script>
        <script type="text/javascript" src="/client/js/user_info.js"></script>
        <script type="text/javascript">
            $(function(){
                $('#beginTime').date();
                <#-- 创建一个全局变量用以存储被选择的性别option的id -->
                var selectElementId = $("#user_sex  option:selected").attr("id");
                $("#sex_hidden").val(selectElementId);
            });
        </script>
        <style type="text/css">
            input{
                -webit-appearance:none;
            }
        </style>
    </head>
    <body class="bgc-f3f4f6">
        <#-- 引入警告提示样式 -->
        <#include "/client/common_warn.ftl">
        <#-- 引入等待提示样式 -->
        <#include "/client/common_wait.ftl">
        <div id="datePlugin"></div>
        <!-- 头部 -->
        <header>
            <a class="back" href="/user"></a>
            <p>账号设置</p>
        </header>
        <!-- 头部 END -->
        
        <!-- 账号设置 -->
        <article class="account-settings">
            <!-- 头像 -->
            <section class="base-info">
                <div class="message">
                    <label>头像</label>
                    <div class="editable-info">
                        <a href="javascript:;" style="background:none">
                            <img width="60" height="60" class="head-pic" src="${user.headImageUri!''}" alt="头像">
                        </a>
                    </div>
                </div>
            </section>
            <!-- 姓名 -->
            <section class="common-info">
                <div class="messagebox">
                    <label>姓名</label>
                    <div class="editable-info no-icon-next">
                        <span>${user.realName!''}</span>
                    </div>
                </div>
            </section>
            <!-- 用户名（手机） -->
            <section class="common-info">
                <div class="messagebox">
                    <label>手机</label>
                    <div class="editable-info no-icon-next">
                        <span>${user.username!''}</span>
                    </div>
                </div>
            </section>
            <!-- 性别 -->
            <section class="common-info">
                <div class="messagebox">
                    <label>性别</label>
                    <div class="editable-info no-icon-next">
                        <a class="btn-select" id="btn_select">
                            <span id="sex_view" class="cur-select">${user.sex!'男'}</span>
                            <input type="hidden" id="sex_hidden">
                            <select id="user_sex" onchange="changeSex();">
                                <option id="sex0" value="男" <#if user.sex??&&user.sex=="男">selected="selected"</#if>>男</option>
                                <option id="sex1" value="女" <#if user.sex??&&user.sex=="女">selected="selected"</#if>>女</option>
                                <option id="sex2" value="保密" <#if user.sex??&&user.sex=="保密">selected="selected"</#if>>保密</option>
                            </select>
                        </a>
                    </div>
                </div>
            </section>
            <!-- 出生日期 -->
            <section class="common-info">
                <div class="messagebox">
                    <label>出生日期</label>
                    <div class="editable-info no-icon-next">
                        <input id="beginTime" class="select-date" <#if user.birthday??>value="${user.birthday?string("yyyy-MM-dd")}"</#if>>
                    </div>
                </div>
            </section>
            <!-- 收货地址 -->
            <section class="common-info jump-shipping-address">
                <div class="messagebox">
                    <label>收货地址</label>
                    <div class="editable-info no-icon-next">
                        <a class="jump" href="/user/address"></a>
                    </div>
                </div>
            </section>
            <!-- 门店归属 -->
            <section class="common-info">
                <div class="messagebox">
                    <label>门店归属</label>
                    <div class="editable-info no-icon-next">
                        <a class="jump c999" href="/user/diysite"></a>
                    </div>
                </div>
            </section>
            <!-- 账户安全 -->
            <section class="common-info">
                <div class="messagebox">
                    <label>修改密码</label>
                    <div class="editable-info no-icon-next">
                        <a class="jump" href="/user/edit/password"></a>
                    </div>
                </div>
            </section>
            <!-- 退出登陆 -->
            <a class="jump loginout" href="/login/out">退出登陆</a>
        </article>
        <!-- 账号设置 END -->
    </body>
</html>