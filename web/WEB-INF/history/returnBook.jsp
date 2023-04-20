<%-- 
    Document   : returnBook
    Created on : 20.04.2023, 9:16:35
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h1>Выберите возвращаемую книгу:</h1>
        <ol>
            <c:forEach var="history" items="${listTakedBooks}">
                <li>
                    <a href="returnBook?historyId=${history.id}">
                        ${history.book.title}<br>
                        Авторы книги:<br>
                        <c:forEach var="author" items="${history.book.authors}">
                            ${author.firstname} ${author.lastname}
                        </c:forEach>
                    </a>
                </li>
            </c:forEach>
        </ol>

