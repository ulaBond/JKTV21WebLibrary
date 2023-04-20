<%-- 
    Document   : createReader
    Created on : 20.04.2023, 9:30:18
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <h1>Новый читатель</h1>
    <form action="createReader" method="POST">
        Имя: <input type="text" name="firstname" value=""><br>
        Фамилия: <input type="text" name="lastname" value=""><br>
        Телефон: <input type="text" name="phone" value=""><br>
        <br>
        <input type="submit" value="Добавить">
    </form>
