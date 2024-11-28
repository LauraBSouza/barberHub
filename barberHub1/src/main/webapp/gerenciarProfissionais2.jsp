<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ProfissionalDAO" %>
<%@ page import="model.Profissional" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Criando o DAO para buscar os profissionais
    ProfissionalDAO estabelecimentoDAO = new ProfissionalDAO();
    List<Profissional> profissionais = estabelecimentoDAO.findAll();
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Profissionais</title>
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- Barra de Navegação -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">BarberHub</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="homeBarbearia.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarAgendamentos.jsp">Agendamentos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarClientes.jsp">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarServicos.jsp">Serviços</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarProfissionais.jsp">Profissionais</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Conteúdo Principal -->
<div class="container my-5">
    <h2>Gerenciar Profissionais</h2>
    <a href="cadastroProfissional.jsp" class="btn btn-success mb-3">Adicionar Novo Profissional</a>

    <!-- Tabela de Profissionais -->
    <table id="profissional" class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Estabelecimento ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Serviço</th>
                <th scope="col">CEP</th>
                <th scope="col">Rua</th>
                <th scope="col">Número</th>
                <th scope="col">Complemento</th>
                <th scope="col">Bairro</th>
                <th scope="col">Cidade</th>
                <th scope="col">Estado</th>
                <th scope="col">Foto</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Exibindo os profissionais na tabela
                for (Profissional profissional : profissionais) {
            %>
                <tr>
                    <td><%= profissional.getProfissionalid() %></td>
                    <td><%= profissional.getEstabelecimentoid() %></td>
                    <td><%= profissional.getNome() %></td>
                    <td><%= profissional.getServico() %></td>
                    <td><%= profissional.getCep() %></td>
                    <td><%= profissional.getRua() %></td>
                    <td><%= profissional.getNumero() %></td>
                    <td><%= profissional.getComplemento() %></td>
                    <td><%= profissional.getBairro() %></td>
                    <td><%= profissional.getCidade() %></td>
                    <td><%= profissional.getEstado() %></td>
                    <td><%= profissional.getFoto() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm editRow" data-id="<%= profissional.getProfissionalid() %>">Editar</button>
                        <button class="btn btn-danger btn-sm deleteRow" data-id="<%= profissional.getProfissionalid() %>">Excluir</button>
                    </td>
                </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>

<!-- Modal de Edição -->
<div class="modal" id="editProfessionalModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Profissional</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="ProfissionalController?action=updateProfessional" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="editId" name="id">
                    <div class="form-group">
                        <label for="editName">Nome</label>
                        <input type="text" id="editName" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="editSpecialty">Especialidade</label>
                        <input type="text" id="editSpecialty" name="specialty" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Rodapé -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>© 2024 BarberHub - Todos os direitos reservados.</p>
</footer>


<script>
function openEditModal(professionalId) {
    // Requisição AJAX para obter os dados do profissional
    $.ajax({
        url: '/barberHub1/profissional',
        method: 'GET',
        data: { action: 'getProfessional', id: professionalId },
        success: function(data) {
            // Preenche os campos do modal com os dados retornados
            $('#editId').val(data.id);
            $('#editName').val(data.name);
            $('#editSpecialty').val(data.specialty);
            // Abre o modal
            $('#editProfessionalModal').modal('show');
        },
        error: function() {
            alert('Erro ao buscar os dados do profissional.');
        }
    });
}
</script>

</body>
</html>
