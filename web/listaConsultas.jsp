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
        <title>Lista de médicos</title>
    </head>
    <body>
        <a href="/ProjetoMedico">Início</a>
        <h1>Médicos</h1>
        <form action="/ProjetoMedico/ListarMedicosServlet">
            <label for="especialide">Especialidade:</label>
            <input id="especialidade" type="text" name="especialidade"></input>
            <input type="submit"></input>
        </form>
        <hr>
        <c:if test="${empty requestScope.consultas}">
            Não há médicos cadastrados!
        </c:if>
        <c:if test="${!empty requestScope.consultas}">
            <table>
                <tr>
                    <th class="esquerda">Nome</th>
                    <th>CRM</th>
                    <th>Especialidade</th>
                </tr>
                <c:forEach items="${requestScope.consultas}" var="consulta">
                    <tr>
                        <td class="esquerda">${consulta.cpfmPaciente}</td>
                        <td>${consulta.crmMedico}</td>
                        <td>${consulta.dataConsulta}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
