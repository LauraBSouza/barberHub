<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Endereco Management</title>
	<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
</head>
<body>
<div class="container my-4">
	<h1>Endereco Management</h1>
	<div class="mb-3">
		<button class="btn btn-primary" id="addNew">Add New Endereco</button>
	</div>
	<table id="dataTable" class="table table-striped">
		<thead>
			<tr>
				<th>Enderecoid</th>
				<th>Cep</th>
				<th>Rua</th>
				<th>Numero</th>
				<th>Complemento</th>
				<th>Bairro</th>
				<th>Cidade</th>
				<th>Estado</th>
				<th>Actions</th>
			</tr>
		</thead>
	</table>
</div>
<div id="formModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Endereco Form</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<form id="enderecoForm">
					<div class="mb-3">
						<label for="enderecoId" class="form-label">Enderecoid</label>
						<input type="text" id="enderecoId" name="enderecoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="cep" class="form-label">Cep</label>
						<input type="text" id="cep" name="cep" class="form-control">
					</div>
					<div class="mb-3">
						<label for="rua" class="form-label">Rua</label>
						<input type="text" id="rua" name="rua" class="form-control">
					</div>
					<div class="mb-3">
						<label for="numero" class="form-label">Numero</label>
						<input type="text" id="numero" name="numero" class="form-control">
					</div>
					<div class="mb-3">
						<label for="complemento" class="form-label">Complemento</label>
						<input type="text" id="complemento" name="complemento" class="form-control">
					</div>
					<div class="mb-3">
						<label for="bairro" class="form-label">Bairro</label>
						<input type="text" id="bairro" name="bairro" class="form-control">
					</div>
					<div class="mb-3">
						<label for="cidade" class="form-label">Cidade</label>
						<input type="text" id="cidade" name="cidade" class="form-control">
					</div>
					<div class="mb-3">
						<label for="estado" class="form-label">Estado</label>
						<input type="text" id="estado" name="estado" class="form-control">
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
		var table = $('#dataTable').DataTable({
			ajax: {
				url: '/endereco',
				dataSrc: ''
			},
			columns: [
				{ data: 'enderecoId' },
				{ data: 'cep' },
				{ data: 'rua' },
				{ data: 'numero' },
				{ data: 'complemento' },
				{ data: 'bairro' },
				{ data: 'cidade' },
				{ data: 'estado' },
				{
					data: null,
					render: function(data, type, row) {
						return `<button class='btn btn-warning btn-sm editRow' data-id='${row.enderecoId}'>Edit</button> ` +
						`<button class='btn btn-danger btn-sm deleteRow' data-id='${row.enderecoId}'>Delete</button>`;
					}
				}
			]
		});
		$('#addNew').on('click', function() {
			$('#formModal').modal('show');
		});
		$('#saveData').on('click', function() {
			var formData = $('#enderecoForm').serialize();
			$.ajax({
				url: '/endereco',
				method: 'POST',
				data: formData,
				success: function(response) {
					table.ajax.reload();
					$('#formModal').modal('hide');
				},
				error: function(xhr) {
					alert('Error: ' + xhr.responseText);
				}
			});
		});
	});
</script>
</body>
</html>