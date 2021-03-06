<!-- js -->
<script type="text/javascript" src="/client/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="/client/js/touch-0.2.14.min.js"></script>
<#if all_selected??&&all_selected?size gt 0>
    <article class="my-selected">
        <!-- 已选列表 -->
        <#list all_selected as goods>
            <div class="selected-list" id="${goods.goodsId?c}">
                <div class="swipe"></div>
                <section class="sec1">
                    <div class="img">
                        <img src="${goods.goodsCoverImageUri!''}" alt="产品图片">
                    </div>
                    <div class="product-info">
                        <div class="descript">${goods.goodsTitle!''}</div>
                        <label>${goods.sku!''}</label>
                        <div class="choose-num">
                            <#if ("goods"+goods_index)?eval??>
                                <input type="hidden" id="goods${goods.goodsId?c}quantity" value="<#if ("goods"+goods_index)?eval??>${("goods"+goods_index)?eval?c}<#else>0</#if>">
                            </#if>
                            <!-- 数量选择 -->
                            <div class="numbers">
                                <a class="less" href="javascript:operate(0,0,${goods.goodsId?c});">-</a>
                                <input type="text" readonly="true" id="goods${goods.goodsId?c}" <#if ("goods"+goods_index)?eval??&&("goods"+goods_index)?eval lt goods.quantity>value="${("goods"+goods_index)?eval}"<#else>value="${goods.quantity!'0'}"</#if>>
                                <a class="add" href="javascript:operate(1,0,${goods.goodsId?c});">+</a>
                            </div>
                            <div class="price" id="goods${goods.goodsId?c}price">￥
                                <span>
                                    <#if goods.price??&&goods.quantity??>
                                        ${((goods.price)*(goods.quantity))?string("0.00")}
                                    </#if>
                                </span>
                            </div>
                        </div>
                    </div>
                </section>
                <a class="btn-backspace"></a>
            </div>
        </#list>
    </article>
</#if>
<div class="select-total-money">总额：<strong id="all_price">￥<#if totalPrice??>${totalPrice?string("0.00")}<#else>0.00</#if><strong></div>
<#-- 创建一个隐藏标签用于存储当前已选有多少商品（整合后） -->
<span id="select_num" style="display:none">${selected_number!'0'}</span>
<script type="text/javascript">
$(function touch(){
   
    <#-- 点击删除 -->
    $(".btn-backspace").click(function(){
        <#--$(this).parent(".selected-list").remove();-->
        var goodsId = $(this).parent(".selected-list").attr("id");
        <#-- 开启等待图标 -->
        wait();
        <#-- 发送异步请求 -->
        $.ajax({
            url:"/goods/delete/selected",
            type:"post",
            timeout:10000,
            data:{
                goodsId:goodsId
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                <#-- 关闭等待图标 -->
                close(1);
                warning("亲，您的网速不给力啊");
            },
            success:function(res){
                <#-- 关闭等待图标 -->
                close(100);
                if(0 == res.status){
                    $("#"+goodsId).remove();
                }else{
                    warning("操作失败");
                }
                $("#number").val(res.number);                
                $("#all_price").html("￥"+res.all_price);   
            }
        })
    });
});
</script>

<script type="text/javascript">
    $(function(){
        var $bEdit = $("header .btn-edit");
        var $move = $(".my-selected .selected-list .sec1");
        var $bSpace = $(".my-selected .selected-list .btn-backspace");
        var onOff = true;
        
        $bEdit.click(function(){
            if(onOff){
            	$("#info").html("完成");
                $move.addClass("selected");
                $bSpace.css("right","0px");       
            }else{
            	$("#info").html("编辑");
                $move.removeClass("selected");
                $bSpace.css("right","-80px");
            }
            onOff = !onOff;
      });
    });
</script>



