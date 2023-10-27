<%-- 
    Document   : listStaffAccount
    Created on : Oct 26, 2023, 1:58:14 AM
    Author     : Asus
--%>

<%@page import="model.Staff"%>
<%@page import="java.util.List"%>
<%@page import="dal.StoreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <% StoreDAO storeDAO = new StoreDAO();

            %>
            <h1>Staff list</h1>
          <a href="ListProductServlet">Back</a>
            <table>
                <tr>
                    <th>Staff ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Store Name</th>
                </tr>
                <c:forEach items="${listStaff}" var="staff">
                    <tr>
                        <td>${staff.getStaff_id()}</td>
                        <td>${staff.getUsername()}</td>
                        <td>***********</td>
                        <c:set var="store_id" value="${staff.getStore_id()}"></c:set>
                        <td><%= storeDAO.getStoreById((int) pageContext.getAttribute("store_id")).getStore_name()%></td>

                    </tr>
                </c:forEach>

            </table>
            <form id="myModal" class="modal" action="AddNewStaffAccount" method="get" >
                <div class="modal-content" id="modall" style="width:30%;">
                    <h2 id="header-modal">Add new staff account</h2>
                    <div  class="container-form">
                        <div id="employeeForm">
                            <div class="form-group">
                                <label for="username"><i class="fa-solid fa-drumstick-bite"></i></label>
                                <input type="text" id="username" name="username" placeholder="Username" required>
                                <span class="sp-thongbao" id="tbName"></span>
                            </div>

                            <div class="form-group">
                                <label for="password" ><i class="fa-solid fa-circle-info"></i></label>
                                <input type="password" id="password" name="password" placeholder="Password" required>
                                <span class="sp-thongbao" id="tbInfor"></span>
                            </div>

                            <div class="form-group">
                                <label for="store_id"><i class="fa-solid fa-image"></i></label>
                                <select name="store_id">
                                    <option value="0">Select store</option>
                                    <c:forEach var="store" items="${listStore}" >
                                        <option value="${store.getStore_id()}">${store.getStore_name()}</option>
                                    </c:forEach>
                                </select>
                                <span class="sp-thongbao" id="tbSalary"></span>
                            </div>
                        </div>
                    </div>
                    <div class="footer-modal">
                        <button type="submit" value="Submit!" name="submit" style="margin-left: 46.5%;" class="submit submit-form" id="them">Add new account</button>
                      
                    </div>
                </div>
            </form> 
            
           
        </body>
    </html>
