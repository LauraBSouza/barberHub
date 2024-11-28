<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>Agendamento Management</title>
	<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
</head>
<body>
<div class="container my-4">
	<h1>Agendamento Management</h1>
	<div class="mb-3">
		<button class="btn btn-primary" id="addNew">Add New Agendamento</button>
	</div>
	<table id="dataTable" class="table table-striped">
		<thead>
			<tr>
				<th>Agendamentoid</th>
				<th>Estabelecimentoid</th>
				<th>Profissionalid</th>
				<th>Servicoid</th>
				<th>Clienteid</th>
				<th>Data</th>
				<th>Hora</th>
				<th>Preco</th>
				<th>Desconto</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
	</table>
</div>
<div id="formModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Agendamento Form</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<form id="agendamentoForm">
					<div class="mb-3">
						<label for="agendamentoId" class="form-label">Agendamentoid</label>
						<input type="text" id="agendamentoId" name="agendamentoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="estabelecimentoId" class="form-label">Estabelecimentoid</label>
						<input type="text" id="estabelecimentoId" name="estabelecimentoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="profissionalId" class="form-label">Profissionalid</label>
						<input type="text" id="profissionalId" name="profissionalId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="servicoId" class="form-label">Servicoid</label>
						<input type="text" id="servicoId" name="servicoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="clienteId" class="form-label">Clienteid</label>
						<input type="text" id="clienteId" name="clienteId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="data" class="form-label">Data</label>
						<input type="text" id="data" name="data" class="form-control">
					</div>
					<div class="mb-3">
						<label for="hora" class="form-label">Hora</label>
						<input type="text" id="hora" name="hora" class="form-control">
					</div>
					<div class="mb-3">
						<label for="preco" class="form-label">Preco</label>
						<input type="text" id="preco" name="preco" class="form-control">
					</div>
					<div class="mb-3">
						<label for="desconto" class="form-label">Desconto</label>
						<input type="text" id="desconto" name="desconto" class="form-control">
					</div>
					<div class="mb-3">
						<label for="status" class="form-label">Status</label>
						<input type="text" id="status" name="status" class="form-control">
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
				url: '/agendamento',
				dataSrc: ''
			},
			columns: [
				{ data: 'agendamentoId' },
				{ data: 'estabelecimentoId' },
				{ data: 'profissionalId' },
				{ data: 'servicoId' },
				{ data: 'clienteId' },
				{ data: 'data' },
				{ data: 'hora' },
				{ data: 'preco' },
				{ data: 'desconto' },
				{ data: 'status' },
				{
					data: null,
					render: function(data, type, row) {
						return `<button class='btn btn-warning btn-sm editRow' data-id='${row.agendamentoId}'>Edit</button> ` +
						`<button class='btn btn-danger btn-sm deleteRow' data-id='${row.agendamentoId}'>Delete</button>`;
					}
				}
			]
		});
		$('#addNew').on('click', function() {
			$('#formModal').modal('show');
		});
		$('#saveData').on('click', function() {
			var formData = $('#agendamentoForm').serialize();
			$.ajax({
				url: '/agendamento',
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