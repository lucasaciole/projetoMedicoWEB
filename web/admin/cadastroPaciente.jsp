<%-- 
    Document   : cadastroPaciente
    Created on : 12/04/2018, 11:15:43
    Author     : 619710
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de paciente</title>
        
    </head>
    <body>
        <h1>Novo paciente</h1>
        <hr>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
            <c:forEach items="${requestScope.mensagens}" var="mensagem">
                <li>${mensagem}</li>
            </c:forEach>
            </ul>
            <hr>
        </c:if>
        
        <form action="CadastrarPacienteServlet" method ="post">
            Digite os dados do paciente a ser cadastrado<br/>
            Nome:              <input name="nome"             type="text" value="${sessionScope.novoPaciente.nome}"/><br/>
            Senha:             <input name="senha"            type="text" value="${sessionScope.novoPaciente.senha}"/><br/>
            CPF:               <input name="cpf"              type="text" value="${sessionScope.novoPaciente.cpf}"/><br/>
            Telefone:          <input name="telefone"         type="text" value="${sessionScope.novoPaciente.telefone}"/><br/>
            Data de nascimento <input name="dataDeNascimento" type="text" value="${sessionScope.novoPaciente.dataDeNascimento}"/><br/>
            Gênero             <input name="sexo"             type="text" value="${sessionScope.novoPaciente.sexo}"/><br/>
            <input type="submit" value="Enviar"/>
    </body>
</html>