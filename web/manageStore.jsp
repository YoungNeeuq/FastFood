<%-- 
    Document   : manageStore
    Created on : Oct 26, 2023, 2:59:33 AM
    Author     : Asus
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="dal.OrderDAO"%>
<%@page import="dal.StoreDAO"%>
<%@page import="dal.CustomerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:nth-child(odd) {
                background-color: #ffffff;
            }
        </style>
    </head>
    <body>
        <%

            CustomerDAO customerDAO = new CustomerDAO();
        %>
        <%
            Cookie[] cookies = request.getCookies();
            int storeId = 0;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("store_id".equals(cookie.getName())) {
                        String storeIdValue = cookie.getValue();
                        storeId = Integer.parseInt(storeIdValue);

                    }
                }
            }
//            int store_id = (int) request.getAttribute("store_id");
            StoreDAO storeDAO = new StoreDAO();
            String store_name = storeDAO.getStoreById(storeId).getStore_name();
            OrderDAO orderDAO = new OrderDAO();
            int sum = orderDAO.sumOrderByStore(storeId);
            List<Order> listSucceedOrder = orderDAO.getOrderByStoreId(storeId);
            int numOfSucceedOrder = listSucceedOrder.size();
            LocalDate date = LocalDate.now();

        %>
        <h1><%= store_name%></h1>
        <h2>Total: <%= sum%></h2>
        <h2>Total succeed order: <%= numOfSucceedOrder%></h2>
        <form action="ShowConfirmOrder" method="get">
            <input type="hidden" name="store_id" value="<%= storeId%>"/>
            <button type="submit">Show confirm order</button>
        </form>
        <form action="ShowSucceedOrder" method="get">
            <input type="hidden" name="store_id" value="<%= storeId%>"/>
            <button type="submit">Show succeed order</button>
        </form>
        <form action="ShowCanceledOrder" method="get">
            <input type="hidden" name="store_id" value="<%= storeId%>"/>
            <button type="submit">Show canceled order</button>
        </form>
        <form action="ShowPaidOrder" method="get">
            <input type="hidden" name="store_id" value="<%= storeId%>"/>
            <button type="submit">Show paid order</button>
        </form>

        <form action="RevenueByStoreDMY" method="GET" >
            <input type="hidden" name="store_id" value="<%= storeId%>"/>
            <select name="select" class="form-select" aria-label="Default select example">
                <option value="1">Date</option>
                <option value="2">Month</option>
                <option value="3">Year</option>
            </select>
            <button  class="btn btn-info" type="submit">Xem</button>
        </form>
        <!--        <table>
                    <thead>
                        <tr>
                            <td>Customer</td>
                            <td>Order ID</td>
                            <td>Phone Number</td>
                            <td>Address</td>
                            <td>Date</td>
                            <td>Total</td>
                            <td>Order Status</td>
                            <td>Payment status</td>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="order" items="${listOrder}">
            <tr>
            <c:set var="customer_id" value="${order.getCustomer_id()}"></c:set>
            <td><%= customerDAO.getCustomer((int) pageContext.getAttribute("customer_id")).getUsername()%></td>

            <td>${order.getOrder_id()}</td>
            <td>${order.getCustomer_phone()}</td>
            <td>${order.getCustomer_address()}</td>
            <td>${order.getDate()}</td>
            <td>${order.getTotalmoney()}</td>
            <td>${order.getStatus()}</td>   
            <td>${order.getPaymentStatus()}</td>   

            <td>
                <form action="ViewDetailOrder" method="GET">
                    <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                    <button type="submit" name="viewButton" value="view" class="btn btn-success">Xem chi tiết</button>
                </form>

            </td>
            <td>
            <c:set var = "status" scope = "session" value = "${order.getStatus().trim()}"/>
            <c:if test="${status eq 'Preparing' }">

                <form action="ConfirmOrderServlet" method="GET">
                    <input type="hidden" name="store_id" value="<%= storeId%>"/>
                    <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                    <button type="submit" name="viewButton" value="2"  >
                        Deliver
                    </button>
                </form>
            </c:if>
            <c:if test="${status eq 'Delivering' }">

                <form action="ConfirmOrderServlet" method="GET">
                    <input type="hidden" name="store_id" value="<%= storeId%>"/>
                    <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                    <button type="submit" name="viewButton" value="3"  >
                        Confirm succeed
                    </button>
                </form>
            </c:if>
        </td>


    </tr>
        </c:forEach>

    </tbody>
</table>-->
    </body>
</html>
