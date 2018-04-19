<%-- 
    Document   : index
    Created on : 12/04/2018, 10:23:45
    Author     : 619680
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>Home - ProjetoMedico</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
                    <h1>Bem vindo!</h1>
                    <ul>
                        <li><a href="/ProjetoMedico/login">Login</a></li>
                        <li><a href="/ProjetoMedico/listarMedicos">Lista de Médicos</a></li>
                    </ul>
                    <h2> Paciente </h2>
                    <ul>           
                        <li><a href="/ProjetoMedico/marcarConsulta">Marcar consulta</a></li>
                        <li><a href="/ProjetoMedico/listarConsulta">Listar minhas consultas</a></li>
                    </ul>

                    <h2> Médico </h2>
                    <ul>
                        <li><a href="/ProjetoMedico/listarConsulta">Listar minhas consultas</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
