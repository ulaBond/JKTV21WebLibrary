<%-- 
    Document   : createAuthor
    Created on : Jan 26, 2023, 2:11:53 PM
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Создание нового автора</title>
    </head>
    <body>
        <h1>Новый автор</h1>
        <form action="createAuthor" method="POST">
            Имя: <input type="text" name="firstname" value=""><br>
            Фамилия: <input type="text" name="lastname" value=""><br>
            <input type="submit" value="Добавить"><br>
        </form>
    </body>
</html>
