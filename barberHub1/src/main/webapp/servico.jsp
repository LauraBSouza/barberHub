<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Servico Management</title>
	<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
</head>
<body>
<div class="container my-4">
	<h1>Servico Management</h1>
	<div class="mb-3">
		<button class="btn btn-primary" id="addNew">Add New Servico</button>
	</div>
	<table id="dataTable" class="table table-striped">
		<thead>
			<tr>
				<th>Servicoid</th>
				<th>Nome</th>
				<th>Descricao</th>
				<th>Tiposervicoid</th>
				<th>Preco</th>
				<th>Duracao</th>
				<th>Actions</th>
			</tr>
		</thead>
	</table>
</div>
<div id="formModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Servico Form</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<form id="servicoForm">
					<div class="mb-3">
						<label for="servicoId" class="form-label">Servicoid</label>
						<input type="text" id="servicoId" name="servicoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="nome" class="form-label">Nome</label>
						<input type="text" id="nome" name="nome" class="form-control">
					</div>
					<div class="mb-3">
						<label for="descricao" class="form-label">Descricao</label>
						<input type="text" id="descricao" name="descricao" class="form-control">
					</div>
					<div class="mb-3">
						<label for="tipoServicoId" class="form-label">Tiposervicoid</label>
						<input type="text" id="tipoServicoId" name="tipoServicoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="preco" class="form-label">Preco</label>
						<input type="text" id="preco" name="preco" class="form-control">
					</div>
					<div class="mb-3">
						<label for="duracao" class="form-label">Duracao</label>
						<input type="text" id="duracao" name="duracao" class="form-control">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="saveData">Save</button>
			</div>
		</div>
	</div>
</div>
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