<%-- 
    Document   : listaMedicos
    Created on : 19/04/2018, 10:19:17
    Author     : 619710
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas Consultas</title>
    </head>
    <body>
        <a href="/ProjetoMedico">Início</a>
        <h1>Consultas</h1>
        <hr>
        <c:if test="${empty requestScope.consultas}">
            Não há consultas marcadas!
        </c:if>
        <c:if test="${!empty requestScope.consultas}">
            <table>
                <tr>
                    <th class="esquerda">CPF Paciente</th>
                    <th>CRM Medico</th>
                    <th>Data da Consulta</th>
                </tr>
                <c:forEach items="${requestScope.consultas}" var="consulta">
                    <tr>
                        <td class="esquerda">${consulta.cpfPaciente}</td>
                        <td>${consulta.crmMedico}</td>
                        <td>${consulta.dataConsulta}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
