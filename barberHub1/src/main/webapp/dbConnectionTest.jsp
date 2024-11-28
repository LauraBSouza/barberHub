<%@ page import="database.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <h1>Teste de Conexão com o Banco de Dados</h1>
    <%
        // Crie uma instância de DBConnection
        DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();

        try {
            if (connection != null && !connection.isClosed()) {
                out.println("<p>Conexão com o banco de dados estabelecida com sucesso!</p>");
            } else {
                out.println("<p>Falha ao conectar com o banco de dados.</p>");
            }
        } catch (SQLException e) {
            out.println("<p>Erro ao verificar a conexão: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    %>
</body>
</html>