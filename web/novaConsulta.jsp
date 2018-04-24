<%-- 
    Document   : novaConsulta
    Created on : 24/04/2018, 01:54:15
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Médico</title>
    </head>
    <body>
        <h1>Marcar Consulta</h1>
        
        <form action="/ProjetoMedico/novaConsulta" method="POST">
            <input type="hidden" value="${sessionScope.login.login}" name="cpfPaciente"/>
            <select id="medico" name="crmMedico">
                <option value="">Selecione um médico</option>
                <c:forEach items="${medicos}" var="medico">
                    <option value="${medico.crm}">${medico.nome}</option>
                </c:forEach>
            </select>
            <input type="date" name="dataConsulta" />
            <input type="submit" />
        </form>
        
    </body>
</html>