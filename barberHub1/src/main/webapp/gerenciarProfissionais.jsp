<!DOCTYPE html>
<html>
<head>
    <title>Profissional Management</title>
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
</head>
<body>
<div class="container my-4">
    <h1>Profissional Management</h1>
    <div class="mb-3">
        <!-- Alteração no evento de clique -->
        <button class="btn btn-primary" id="addNew">Add New Profissional</button>
    </div>
    <table id="profissional" class="table table-striped">
        <thead>
            <tr>
                <th>Profissionalid</th>
                <th>Estabelecimentoid</th>
                <th>Nome</th>
                <th>Servico</th>
                <th>Cep</th>
                <th>Rua</th>
                <th>Numero</th>
                <th>Complemento</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>Foto</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dados serão carregados via AJAX -->
        </tbody>
    </table>
</div>

<!-- Modal para Editar Profissional -->
<div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="formModalLabel">Editar Profissional</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formProfissional">
            <!-- Campo ProfissionalId agora oculto -->
            <input type="hidden" id="profissionalId">
            
            <div class="mb-3">
                <label for="estabelecimentoId" class="form-label">Estabelecimento ID</label>
                <input type="text" class="form-control" id="estabelecimentoId">
            </div>
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" id="nome">
            </div>
            <div class="mb-3">
                <label for="servico" class="form-label">Servico</label>
                <input type="text" class="form-control" id="servico">
            </div>
            <div class="mb-3">
                <label for="cep" class="form-label">CEP</label>
                <input type="text" class="form-control" id="cep">
            </div>
            <div class="mb-3">
                <label for="rua" class="form-label">Rua</label>
                <input type="text" class="form-control" id="rua">
            </div>
            <div class="mb-3">
                <label for="numero" class="form-label">Numero</label>
                <input type="text" class="form-control" id="numero">
            </div>
            <div class="mb-3">
                <label for="complemento" class="form-label">Complemento</label>
                <input type="text" class="form-control" id="complemento">
            </div>
            <div class="mb-3">
                <label for="bairro" class="form-label">Bairro</label>
                <input type="text" class="form-control" id="bairro">
            </div>
            <div class="mb-3">
                <label for="cidade" class="form-label">Cidade</label>
                <input type="text" class="form-control" id="cidade">
            </div>
            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <input type="text" class="form-control" id="estado">
            </div>
            <div class="mb-3">
                <label for="foto" class="form-label">Foto</label>
                <input type="text" class="form-control" id="foto">
            </div>
            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Scripts do jQuery e DataTables -->
<script>
$(document).ready(function() {
    // Inicializando a DataTable com AJAX
    var table = $('#profissional').DataTable({
        "ajax": {
            "url": "/barberHub1/profissional", // Usando o mesmo padrão AJAX da página de base
            "type": "GET",
            "dataSrc": function (json) {
                return json.map(function(item) {
                    // Ajustando a formatação dos dados, se necessário
                    return {
                        profissionalId: item.profissionalId,
                        estabelecimentoId: item.estabelecimentoId,
                        nome: item.nome,
                        servico: item.servico,
                        cep: item.cep,
                        rua: item.rua,
                        numero: item.numero,
                        complemento: item.complemento,
                        bairro: item.bairro,
                        cidade: item.cidade,
                        estado: item.estado,
                        foto: item.foto
                    };
                });
            }
        },
        "columns": [
            { "data": "profissionalId" },
            { "data": "estabelecimentoId" },
            { "data": "nome" },
            { "data": "servico" },
            { "data": "cep" },
            { "data": "rua" },
            { "data": "numero" },
            { "data": "complemento" },
            { "data": "bairro" },
            { "data": "cidade" },
            { "data": "estado" },
            { "data": "foto" },
            {
                "data": null,
                "render": function(data, type, row) {
                    var id = row.profissionalId;
                    return '<button class="btn btn-warning editRow" data-id="' + id + '">Editar</button>' +
                    '<button class="btn btn-danger deleteRow" data-id="' + id + '">Excluir</button>';
                }
            }
        ]
    });

    // Abrir a página de cadastro ao clicar no botão de "Add New Profissional"
    $('#addNew').click(function() {
        window.location.href = "/barberHub1/cadastroProfissional.jsp"; // Página de cadastro
    });

    // Abrir o modal ao clicar no botão de editar
    $('#profissional').on('click', '.editRow', function() {
        var id = $(this).data('id');
        console.log(id);
        $.ajax({
            url: "/barberHub1/profissional?profissionalId=" + id, // Usando o padrão AJAX da página de base para buscar os dados
            method: 'GET',
            success: function(data) {
                // Preencher os campos com os dados do profissional
                $('#profissionalId').val(data.profissionalId); // O campo de ID ainda é usado internamente
                $('#estabelecimentoId').val(data.estabelecimentoId);
                $('#nome').val(data.nome);
                $('#servico').val(data.servico);
                $('#cep').val(data.cep);
                $('#rua').val(data.rua);
                $('#numero').val(data.numero);
                $('#complemento').val(data.complemento);
                $('#bairro').val(data.bairro);
                $('#cidade').val(data.cidade);
                $('#estado').val(data.estado);
                $('#foto').val(data.foto);
                $('#formModal').modal('show');
            },
            error: function(err) {
                alert('Erro ao carregar dados do profissional');
            }
        });
    });

    // Evento de clique no botão "Excluir"
    $('#profissional').on('click', '.deleteRow', function() {
        var id = $(this).data('id'); // Obtém o ID do profissional

        if (confirm("Você tem certeza que deseja excluir este profissional?")) {
            // Fazendo uma requisição AJAX para excluir o profissional
            $.ajax({
                url: "/barberHub1/profissional?profissionalId=" + id,  // Substitua pela URL do seu servlet ou endpoint
                method: 'DELETE',  // Mude para DELETE
                success: function(response) {
                    alert("Profissional excluído com sucesso");
                    table.ajax.reload();  // Recarregar os dados da tabela
                },
                error: function(error) {
                    alert("Erro ao excluir profissional");
                }
            });
        }
    });
    
 // Função de salvar dados editados
    $('#formProfissional').submit(function(e) {
        e.preventDefault();

        var id = $('#profissionalId').val();
        var profissionalData = {
            profissionalId: id,
            estabelecimentoId: $('#estabelecimentoId').val(),
            nome: $('#nome').val(),
            servico: $('#servico').val(),
            cep: $('#cep').val(),
            rua: $('#rua').val(),
            numero: $('#numero').val(),
            complemento: $('#complemento').val(),
            bairro: $('#bairro').val(),
            cidade: $('#cidade').val(),
            estado: $('#estado').val(),
            foto: $('#foto').val()
        };

        $.ajax({
            url: "/barberHub1/profissional?profissionalId=" + id, 
            method: 'PUT',
            data: profissionalData,
            success: function(response) {
                alert("Profissional editado com sucesso!");
                $('#formModal').modal('hide');
                table.ajax.reload();  // Recarrega a tabela com os dados atualizados
            },
            error: function(error) {
                alert("Erro ao salvar dados do profissional.");
            }
        });
    });

    // Função de mask para CEP
    $('#cep').mask('00000-000');
});
</script>
</body>
</html>
