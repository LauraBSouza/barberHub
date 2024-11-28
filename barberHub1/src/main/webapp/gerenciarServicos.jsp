<%@ page import="java.util.List" %>
<%@ page import="model.Estabelecimento" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Serviços - BarberHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- CSS do DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
</head>
<body>

<!-- Barra de Navegação -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Barbearia Marketplace</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="homeBarbearia.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="gerenciarAgendamentos.jsp">Agendamentos</a></li>
            <li class="nav-item"><a class="nav-link" href="gerenciarClientes.jsp">Clientes</a></li>
            <li class="nav-item"><a class="nav-link" href="gerenciarServicos.jsp">Serviços</a></li>
            <li class="nav-item"><a class="nav-link" href="gerenciarProfissionais.jsp">Profissionais</a></li>
            <li class="nav-item"><a class="nav-link" href="gerenciarPromocoes.jsp">Promoções</a></li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

<!-- Título e Botão de Adicionar Serviço -->
<div class="container my-5">
    <h2>Gerenciamento de Serviços</h2>
    <a href="cadastrarServico.jsp" class="btn btn-primary mb-3">Adicionar Novo Serviço</a>

    <!-- Tabela de Serviços -->
    <table id="tabelaServicos" class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome do Serviço</th>
                <th>Descrição</th>
                <th>Tipo de Serviço</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <!-- Os dados serão carregados via AJAX -->
        </tbody>
    </table>
</div>


<!-- Modal de Edição de Serviço -->
<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="formModalLabel">Editar Serviço</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editarServicoForm">
                    <div class="mb-3">
                        <label for="nomeServico" class="form-label">Nome do Serviço</label>
                        <input type="text" class="form-control" id="nomeServico" required>
                    </div>
                    <div class="mb-3">
                        <label for="descricaoServico" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="descricaoServico" required>
                    </div>
                    <div class="mb-3">
                        <label for="tipoServico" class="form-label">Tipo de Serviço</label>
                        <input type="text" class="form-control" id="tipoServico" required>
                    </div>
                    <div class="mb-3">
                        <label for="precoServico" class="form-label">Preço</label>
                        <input type="number" class="form-control" id="precoServico" required>
                    </div>
                    <input type="hidden" id="servicoId">
                    <button type="submit" class="btn btn-primary">Salvar alterações</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Rodapé -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>© 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do jQuery e Bootstrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<!-- Scripts do DataTables -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
$(document).ready(function() {
    // Inicializando a tabela com DataTables e carregando dados via AJAX
    $('#tabelaServicos').DataTable({
        "ajax": {
            "url": "/barberHub1/servico", // Substitua pela URL do seu servlet ou endpoint
            "type": "GET",
            "dataSrc": "" // Use um campo específico se o JSON estiver encapsulado
        },
        "columns": [
            { "data": "servicoId" },
            { "data": "nome" },
            { "data": "descricao" },
            { "data": "tipoServicoNome" },
            { "data": "preco" },
            { 
                "data": null, 
                "render": function(data, type, row) {
                    var id = row.servicoId;
                    return '<a href="#" class="btn btn-warning btn-sm editRow" data-id="' + id + '">Editar</a>' +
                           ' <button class="btn btn-danger btn-sm deleteRow" data-id="' + id + '">Excluir</button>';
                }
            }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/pt-BR.json"
        }
    });

    // Evento de clique no botão "Editar"
    $('#tabelaServicos').on('click', '.editRow', function() {
        var id = $(this).data('id'); // Obtém o ID do serviço

        // Fazendo uma requisição AJAX para buscar os dados do serviço
        $.ajax({
            url: "/barberHub1/servico?servicoId=" + id, // Substitua pela URL para obter os dados do serviço
            method: 'GET',
            success: function(response) {
                // Preenchendo o modal com os dados retornados
                $('#servicoId').val(response.servicoId);
                $('#nomeServico').val(response.nome);
                $('#descricaoServico').val(response.descricao);
                $('#tipoServico').val(response.tipoServicoNome);
                $('#precoServico').val(response.preco);

                // Exibindo o modal
                $('#formModal').modal('show');
            },
            error: function(xhr) {
                alert('Erro ao buscar dados: ' + xhr.responseText);
            }
        });
    });

    // Evento de envio do formulário para salvar as alterações
    $('#editarServicoForm').submit(function(e) {
        e.preventDefault(); // Previne o comportamento padrão de submit

        var servicoId = $('#servicoId').val();
        var nome = $('#nomeServico').val();
        var descricao = $('#descricaoServico').val();
        var tipoServico = $('#tipoServico').val();
        var preco = $('#precoServico').val();

        // Envia os dados atualizados de volta ao servidor
        var formData = {
            servicoId: servicoId,
            nome: nome,
            descricao: descricao,
            tipoServicoNome: tipoServico,
            preco: preco
        };

        $.ajax({
            url: "/barberHub1/servico?servicoId=" + servicoId,  // Certifique-se de que o ID está sendo enviado na URL
            method: 'PUT',  // Mude para PUT
            data: JSON.stringify(formData),  // Envie os dados como JSON
            contentType: 'application/json',  // Defina o tipo de conteúdo como JSON
            success: function(response) {
                alert('Serviço atualizado com sucesso!');
                // Fechar o modal
                $('#formModal').modal('hide');
                // Recarregar a tabela de serviços
                $('#tabelaServicos').DataTable().ajax.reload();
            },
            error: function(xhr) {
                alert('Erro ao atualizar serviço: ' + xhr.responseText);
            }
        });
    });

    // Evento de clique no botão "Excluir"
    $('#tabelaServicos').on('click', '.deleteRow', function() {
        var id = $(this).data('id'); // Obtém o ID do serviço

        if (confirm("Você tem certeza que deseja excluir este serviço?")) {
            // Envia uma requisição AJAX para excluir o serviço
            $.ajax({
                url: "/barberHub1/servico?servicoId=" + id,  // Substitua pela URL do seu servlet ou endpoint
                method: 'DELETE',  // Mude para DELETE
                success: function(response) {
                    alert('Serviço excluído com sucesso!');
                    // Recarregar a tabela de serviços
                    $('#tabelaServicos').DataTable().ajax.reload();
                },
                error: function(xhr) {
                    alert('Erro ao excluir serviço: ' + xhr.responseText);
                }
            });
        }
    });
});
</script>


</body>
</html>
