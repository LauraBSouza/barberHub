<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.EstabelecimentoDAO" %>
<%@ page import="model.Estabelecimento" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Servico" %>
<%
    // Obter o ID da barbearia passado como parâmetro
    String id = request.getParameter("id");
	EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
	Estabelecimento barbearia = estabelecimentoDAO.findById((Integer.parseInt(id)));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= barbearia.getNome() %> - Detalhes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2><%= barbearia.getNome() %></h2>
            <%-- <img src="<%= barbearia.getImagemUrl() != null ? barbearia.getImagemUrl() : "default_image.jpg" %>" class="img-fluid" alt="<%= barbearia.getNome() %>"> --%>
            <p><strong>Endereço:</strong> <%= barbearia.getRua() %></p>
            <p><strong>Telefone:</strong> <%= barbearia.getTelefone() %></p>
           <%--  <p><strong>Horário de Funcionamento:</strong> <%= barbearia.getHorarioFuncionamento() %></p>
            <p><strong>Descrição:</strong> <%= barbearia.getDescricao() %></p> --%>

            <h4>Serviços Disponíveis</h4>
            <%-- <ul>
                <% for (Servico servico : barbearia.getServicos()) { %>
                    <li><%= servico.getNome() %> - R$ <%= servico.getPreco() %> - <%= servico.getDuracaoMinutos() %> minutos</li>
                <% } %>
            </ul> --%>

            <!-- Botão para abrir o Modal de Edição -->
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">Editar Barbearia</button>
        </div>
    </div>
</div>

<!-- Modal de Edição -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar Barbearia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="editarBarbearia.jsp" method="post">
                    <input type="hidden" name="id" value="<%= barbearia.getEstabelecimentoid() %>">

                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="<%= barbearia.getNome() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="endereco" class="form-label">Endereço</label>
                        <input type="text" class="form-control" id="endereco" name="endereco" value="<%= barbearia.getRua() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="telefone" class="form-label">Telefone</label>
                        <input type="text" class="form-control" id="telefone" name="telefone" value="<%= barbearia.getTelefone() %>" required>
                    </div>

                   <%--  <div class="mb-3">
                        <label for="horario" class="form-label">Horário de Funcionamento</label>
                        <input type="text" class="form-control" id="horario" name="horario" value="<%= barbearia.getHorarioFuncionamento() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="descricao" class="form-label">Descrição</label>
                        <textarea class="form-control" id="descricao" name="descricao" required><%= barbearia.getDescricao() %></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="imagem" class="form-label">Imagem URL</label>
                        <input type="text" class="form-control" id="imagem" name="imagem" value="<%= barbearia.getImagemUrl() != null ? barbearia.getImagemUrl() : "" %>"> --%>
                    </div>

                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
