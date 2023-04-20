<%-- 
    Document   : listReaders
    Created on : 20.04.2023, 9:30:37
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <h1>Список читателей</h1>
        <ol>
            <c:forEach var="reader" items="${listReaders}">
                <li>
                    ${reader.firstname} ${reader.lastname}. Телефон: ${reader.phone}
                </li>
            </c:forEach>
        </ol>
