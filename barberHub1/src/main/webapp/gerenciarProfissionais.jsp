<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	</table>
</div>
<div id="formModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Profissional Form</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<form id="profissionalForm">
					<div class="mb-3">
						<label for="profissionalId" class="form-label">Profissionalid</label>
						<input type="text" id="profissionalId" name="profissionalId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="estabelecimentoId" class="form-label">Estabelecimentoid</label>
						<input type="text" id="estabelecimentoId" name="estabelecimentoId" class="form-control">
					</div>
					<div class="mb-3">
						<label for="nome" class="form-label">Nome</label>
						<input type="text" id="nome" name="nome" class="form-control">
					</div>
					<div class="mb-3">
						<label for="servico" class="form-label">Servico</label>
						<input type="text" id="servico" name="servico" class="form-control">
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
					<div class="mb-3">
						<label for="foto" class="form-label">Foto</label>
						<input type="text" id="foto" name="foto" class="form-control">
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
						return `<button class='btn btn-warning btn-sm editRow' data-id='${row.profissionalId}'>Edit</button> ` +
						`<button class='btn btn-danger btn-sm deleteRow' data-id='${row.profissionalId}'>Delete</button>`;
					}
				}
			]
		});
		
		// Add new profissional
		$('#addNew').on('click', function() {
			// Clear form and open modal
			$('#profissionalForm')[0].reset();
			$('#formModal').modal('show');
			$('#saveData').data('action', 'add');
		});

		// Save Data (Add or Edit)
		$('#saveData').on('click', function() {
			var formData = $('#profissionalForm').serialize();
			var action = $(this).data('action'); // Determine if Add or Edit
			var url = '/barberHub1/profissional';
			var method = 'POST';

			if (action === 'edit') {
				url = '/barberHub1/profissional/' + $('#profissionalId').val();
				method = 'PUT';
			}

			$.ajax({
				url: url,
				method: method,
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

		// Edit profissional
		$('#profissional').on('click', '.editRow', function() {
			var id = $(this).data('id');
			$.ajax({
				url: '/barberHub1/profissional/' + id,
				method: 'GET',
				success: function(response) {
					// Pre-fill the form with the profissional's data
					$('#profissionalId').val(response.profissionalId);
					$('#estabelecimentoId').val(response.estabelecimentoId);
					$('#nome').val(response.nome);
					$('#servico').val(response.servico);
					$('#cep').val(response.cep);
					$('#rua').val(response.rua);
					$('#numero').val(response.numero);
					$('#complemento').val(response.complemento);
					$('#bairro').val(response.bairro);
					$('#cidade').val(response.cidade);
					$('#estado').val(response.estado);
					$('#foto').val(response.foto);

					// Set action to edit
					$('#saveData').data('action', 'edit');
					
					// Show modal
					$('#formModal').modal('show');
				},
				error: function(xhr) {
					alert('Error: ' + xhr.responseText);
				}
			});
		});

		// Delete profissional
		$('#profissional').on('click', '.deleteRow', function() {
			var id = $(this).data('id');
			if (confirm('Are you sure you want to delete this profissional?')) {
				$.ajax({
					url: '/barberHub1/profissional/' + id,
					method: 'DELETE',
					success: function(response) {
						table.ajax.reload();
					},
					error: function(xhr) {
						alert('Error: ' + xhr.responseText);
					}
				});
			}
		});
	});
</script>

</body>
</html>