<%-- 
    Document   : createAuthor
    Created on : Jan 26, 2023, 2:11:53 PM
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h1>Новая книга</h1>
        <form action="createBook" method="POST">
            Название: <input type="text" name="title" value=""><br>
            Авторы: <select name="authors" multiple="true">
                <c:forEach var="author" items="${listAuthors}">
                    <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Добавить"><br>
        </form>
