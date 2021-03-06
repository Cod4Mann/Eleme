<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>卖家=订单详情</title>
<div id="orderDetail-div" style="margin: 25px">
    <div id="restaurant-div" style="cursor: pointer" onclick="location.href='${pageContext.request.contextPath}/restaurant.do?info=findById&id=${orderHistory.restaurant.restaurantNo }'">
        <img style="vertical-align:middle" src="${pageContext.request.contextPath}/images/restaurant/${orderHistory.restaurant.restaurantPortraitURL }">
        ${orderHistory.restaurant.restaurantName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br>订单号：${orderHistory.orderHistoryNo} &nbsp;&nbsp;&nbsp;商家电话：${orderHistory.restaurant.restaurantPhone}
    </div>
    <div id="foods-div">
        <table>
            <tr id="orederDeatilTableTitle">
                <td width="200">菜品</td>
                <td width="60" align="center">数量</td>
                <td width="80" align="center">小计(元)</td>
            </tr>
            <c:forEach items="${orderHistory.orderDetailList}" var="orderDetail" varStatus="status">
                <tr>
                    <td>${orderDetail.foods.foodsName}</td>
                    <td align="center">${orderDetail.foodsNum}</td>
                    <td align="center">${orderDetail.foods.foodsPrice * orderDetail.foodsNum}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3" align="right">
                    实际支付：<span style="color: red;font-size: 2em;">${orderHistory.price}</span>
                </td>
            </tr>
        </table>
    </div>
    <div id="orderInfo-div">
        <h3>配送信息</h3><hr>
        联系人：${orderHistory.address.name}<br>
        联系电话：${orderHistory.address.phoneNum}<br>
        收获地址：${orderHistory.address.comment}<br>
        备注：${orderHistory.comment}<br>
    </div>
</div>

