<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Profissional</title>

    <!-- Incluindo o Bootstrap para um design responsivo e bonito -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>

<!-- Barra de Navega��o -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">BarberHub</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navega��o">
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
                <a class="nav-link" href="gerenciarServicos.jsp">Servi�os</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarProfissionais.jsp">Profissionais</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarPromocoes.jsp">Promo��es</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Container principal para o formul�rio -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Cadastro de Profissional</h2>
    <form id="cadastroProfissionalForm" method="POST" action="/profissional">
        <div class="row">
            <div class="col-md-6">
                <!-- Campos para o Profissional -->
                <div class="mb-3">
                    <label for="estabelecimentoId" class="form-label">Estabelecimento ID</label>
                    <input type="text" id="estabelecimentoId" name="estabelecimentoId" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" id="nome" name="nome" class="form-control">
                </div>

                <!-- Sele��o do Servi�o -->
                <div class="form-group mb-3">
                    <label for="servico" class="form-label">Servi�o</label>
                    <select id="servico" name="servico" class="form-select">
                        <option value="">Selecione um servi�o</option>
                        <!-- Op��es carregadas dinamicamente com os servi�os e seus tipos -->
                    </select>
                </div>

                <div class="form-group mb-3">
                    <label for="cep" class="form-label">CEP</label>
                    <input type="text" id="cep" name="cep" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="foto" class="form-label">Foto</label>
                    <input type="text" id="foto" name="foto" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="rua" class="form-label">Rua</label>
                    <input type="text" id="rua" name="rua" class="form-control">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="numero" class="form-label">N�mero</label>
                    <input type="text" id="numero" name="numero" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="complemento" class="form-label">Complemento</label>
                    <input type="text" id="complemento" name="complemento" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="bairro" class="form-label">Bairro</label>
                    <input type="text" id="bairro" name="bairro" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="cidade" class="form-label">Cidade</label>
                    <input type="text" id="cidade" name="cidade" class="form-control">
                </div>

                <div class="form-group mb-3">
                    <label for="estado" class="form-label">Estado</label>
                    <input type="text" id="estado" name="estado" class="form-control">
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-primary mt-4">Cadastrar Profissional</button>
        </div>
    </form>
</div>

<!-- Rodap� -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>� 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        // Faz a chamada AJAX para obter os servi�os do banco
        $.ajax({
            url: '/barberHub1/servico',  // URL para buscar os servi�os com os tipos
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                // Carregar os servi�os com seus tipos
                var servicoHtml = '<option value="">Selecione um servi�o</option>';
                data.forEach(function(servico) {
                    servicoHtml += '<option value="' + servico.id + '">' + servico.nome + '</option>';
                });
                $('#servico').html(servicoHtml);
            },
            error: function(error) {
                console.error('Erro ao buscar dados dos servi�os:', error);
                alert('Erro ao carregar os servi�os. Por favor, tente novamente mais tarde.');
            }
        });
        
     
        $('#cep').mask('00000-000');
        

        // Quando o formul�rio for enviado
        $('#cadastroProfissionalForm').submit(function(e) {
            e.preventDefault();  // Impede o envio normal do formul�rio

            // Coleta os dados do formul�rio
            let formData = {
                nome: $('#nome').val(),
                servico: $('#servico').val(),
                cep: $('#cep').val(),
                rua: $('#rua').val(),
                numero: $('#numero').val(),
                complemento: $('#complemento').val(),
                bairro: $('#bairro').val(),
                cidade: $('#cidade').val(),
                estado: $('#estado').val(),
                foto: $('#foto').val(),
                estabelecimentoId: $('#estabelecimentoId').val()
            };
            

            // Envia os dados via AJAX
            $.ajax({
                url: '/barberHub1/profissional',  // URL do endpoint para cadastrar o profissional
                type: 'POST',
                data: formData,
                success: function(response) {
                    alert('Profissional cadastrado com sucesso!');
                    // Reset do formul�rio
                    $('#cadastroProfissionalForm')[0].reset();
                },
                error: function(error) {
                    alert('Erro ao cadastrar o profissional. Tente novamente.');
                }
            });
        });
    });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

</body>
</html>
