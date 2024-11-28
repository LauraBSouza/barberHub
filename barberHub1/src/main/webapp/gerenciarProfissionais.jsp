<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
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
                <a class="nav-link" href="gerenciarPromocoes.jsp">Promoções</a>
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
    </table>
</div>

<!-- Modal para Editar Profissional -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar Profissional</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProfissionalForm">
                    <input type="hidden" id="editProfissionalId">
                    <div class="mb-3">
                        <label for="editEstabelecimentoId" class="form-label">Estabelecimento ID</label>
                        <input type="number" class="form-control" id="editEstabelecimentoId">
                    </div>
                    <div class="mb-3">
                        <label for="editNome" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="editNome">
                    </div>
                    <div class="mb-3">
                        <label for="editServico" class="form-label">Serviço</label>
                        <input type="text" class="form-control" id="editServico">
                    </div>
                    <div class="mb-3">
                        <label for="editCep" class="form-label">CEP</label>
                        <input type="text" class="form-control" id="editCep">
                    </div>
                    <div class="mb-3">
                        <label for="editRua" class="form-label">Rua</label>
                        <input type="text" class="form-control" id="editRua">
                    </div>
                    <div class="mb-3">
                        <label for="editNumero" class="form-label">Número</label>
                        <input type="number" class="form-control" id="editNumero">
                    </div>
                    <div class="mb-3">
                        <label for="editComplemento" class="form-label">Complemento</label>
                        <input type="text" class="form-control" id="editComplemento">
                    </div>
                    <div class="mb-3">
                        <label for="editBairro" class="form-label">Bairro</label>
                        <input type="text" class="form-control" id="editBairro">
                    </div>
                    <div class="mb-3">
                        <label for="editCidade" class="form-label">Cidade</label>
                        <input type="text" class="form-control" id="editCidade">
                    </div>
                    <div class="mb-3">
                        <label for="editEstado" class="form-label">Estado</label>
                        <input type="text" class="form-control" id="editEstado">
                    </div>
                    <div class="mb-3">
                        <label for="editFoto" class="form-label">Foto</label>
                        <input type="text" class="form-control" id="editFoto">
                    </div>
                    <button type="button" class="btn btn-primary" id="saveEdit">Salvar Alterações</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Rodapé -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>© 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<script>
$(document).ready(function() {
    var table = $('#profissional').DataTable({
        ajax: {
            url: '/barberHub1/profissional',
            dataSrc: ''
        },
        columns: [
            { data: 'profissionalId' },
            { data: 'estabelecimentoId' },
            { data: 'nome' },
            { data: 'servico' },
            { data: 'cep' },
            { data: 'rua' },
            { data: 'numero' },
            { data: 'complemento' },
            { data: 'bairro' },
            { data: 'cidade' },
            { data: 'estado' },
            { data: 'foto' },
            {
                data: null,
                render: function(data, type, row) {
                    return `<button class='btn btn-warning btn-sm editRow' data-id='${row.profissionalId}'>Editar</button> ` +
                    `<button class='btn btn-danger btn-sm deleteRow' data-id='${row.profissionalId}'>Excluir</button>`;
                }
            }
        ]
    });

    // Editar Profissional
    $('#profissional').on('click', '.editRow', function() {
        var id = $(this).data('id');
        $.ajax({
            url: '/barberHub1/profissional?profissionalId=' + id, // URL da API
            method: 'GET',
            success: function(data) {
                if (data) {
                    $('#editProfissionalId').val(data.profissionalId);
                    $('#editEstabelecimentoId').val(data.estabelecimentoId);
                    $('#editNome').val(data.nome);
                    $('#editServico').val(data.servico);
                    $('#editCep').val(data.cep);
                    $('#editRua').val(data.rua);
                    $('#editNumero').val(data.numero);
                    $('#editComplemento').val(data.complemento);
                    $('#editBairro').val(data.bairro);
                    $('#editCidade').val(data.cidade);
                    $('#editEstado').val(data.estado);
                    $('#editFoto').val(data.foto);
                    $('#editModal').modal('show');
                } else {
                    alert('Erro ao buscar dados do profissional.');
                }
            },
            error: function() {
                alert('Erro ao se comunicar com o servidor.');
            }
        });
    });

    // Excluir Profissional
    $('#profissional').on('click', '.deleteRow', function() {
        var profissionalId = $(this).data('id'); // Captura o ID do profissional

        if (confirm('Tem certeza que deseja excluir este profissional?')) {
            $.ajax({
                url: '/barberHub1/profissional?profissionalId=' + profissionalId, // URL de exclusão
                method: 'DELETE', // Método DELETE
                success: function(response) {
                    alert('Profissional excluído com sucesso!');
                    table.ajax.reload(); // Atualiza a tabela
                },
                error: function(error) {
                    alert('Erro ao excluir profissional. Tente novamente.');
                }
            });
        }
    });

    // Salvar alterações no profissional
    $('#saveEdit').click(function() {
        var formData = $('#editProfissionalForm').serialize();
        $.ajax({
            url: '/barberHub1/profissional',
            method: 'PUT',
            data: formData,
            success: function() {
                $('#editModal').modal('hide');
                table.ajax.reload();
            },
            error: function() {
                alert('Erro ao salvar as alterações.');
            }
        });
    });
});


</script>

</body>
</html>
