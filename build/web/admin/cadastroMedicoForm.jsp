<%-- 
    Document   : cadastroMedicoForm
    Created on : 12/04/2018, 11:19:25
    Author     : 619680
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/ProjetoMedico/CadastrarMedico" method="post">
            Digite seus dados:<br/>
            Nome: <input name="nome" type="text" value="${sessionScope.novoMedico.nome}" /><br/>
            Especialidade: <input name="especialidade" type="text" value="${sessionScope.novoMedico.especialidade}" /><br/>
            CRM: <input name="crm" type="text" value="${sessionScope.novoMedico.crm}" /><br/>
            Senha: <input name="senha" type="text" value="${sessionScope.novoMedico.senha}" /><br/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
