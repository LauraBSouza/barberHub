<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Mais - BarberHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            font-size: 1.5rem;
        }
        .container {
            max-width: 900px;
            margin-top: 40px;
        }
        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            padding: 20px;
        }
        .card-body {
            background-color: #ffffff;
            padding: 25px;
            font-size: 1.1rem;
            color: #333;
        }
        .card-body img {
            max-width: 100%;
            border-radius: 8px;
        }
        .btn-agendar {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 50px;
            font-size: 1.2rem;
            display: block;
            margin: 20px auto 0;
        }
        .btn-agendar:hover {
            background-color: #0056b3;
            cursor: pointer;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>

<!-- Barra de Navega��o -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="home.jsp">BarberHub</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navega��o">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">In�cio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="barbearias.jsp">Barbearias</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="promocoes.jsp">Promo��es</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Meus Agendamentos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Conte�do da P�gina Ver Mais -->
<div class="container">
    <h2 class="text-center mb-4">Detalhes da Barbearia</h2>

    <!-- Mensagem de carregamento -->
    <div id="mensagemStatus" style="display: none;">Carregando dados...</div>

    <!-- Dados da Barbearia -->
    <div id="dadosEstabelecimento" style="display: none;">
        <!-- Card de detalhes da barbearia -->
        <div class="card">
            <div class="card-header">
                Informa��es do Estabelecimento
            </div>
            <div class="card-body">
                <!-- Imagem fict�cia da barbearia -->
                <img src="https://via.placeholder.com/800x400.png?text=Imagem+da+Barbearia" alt="Foto da Barbearia">

                <!-- Dados da Barbearia -->
                <p><strong>Nome:</strong> <span id="nomeEstabelecimento"></span></p>
                <p><strong>Email:</strong> <span id="emailEstabelecimento"></span></p>
                <p><strong>Telefone:</strong> <span id="telefoneEstabelecimento"></span></p>
                <p><strong>Cidade:</strong> <span id="cidadeEstabelecimento"></span></p>
                <p><strong>Servi�os:</strong> <span id="servicosEstabelecimento"></span></p>
                <p><strong>Profissionais:</strong> <span id="profissionaisEstabelecimento"></span></p>
                
            </div>
        </div>

        <!-- Bot�o de Agendar com ID din�mico -->
        <a id="btnAgendar" href="#" class="btn-agendar">Agendar Agora</a>
    </div>
</div>

<!-- Rodap� -->
<footer class="bg-dark text-white py-3">
    <p>� 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        // Capturar o ID da URL
        var urlParams = new URLSearchParams(window.location.search);
        var id = urlParams.get('id'); // Pega o par�metro 'id' da URL

        if (id) {
            // Exibir a mensagem de carregamento
            $('#mensagemStatus').show();
            $('#dadosEstabelecimento').hide();

            // Fazer a requisi��o AJAX
            $.ajax({
                url: '/barberHub1/estabelecimento', // Substitua com o caminho da sua API
                type: 'GET',
                data: { id: id }, // Envia o ID capturado na URL
                dataType: 'json',
                success: function(response) {
                    console.log('Resposta do servidor:', response);

                    // Preencher os dados na p�gina
                    $('#nomeEstabelecimento').text(response.nome);
                    $('#emailEstabelecimento').text(response.email);
                    $('#telefoneEstabelecimento').text(response.telefone);
                    $('#cidadeEstabelecimento').text(response.cidade);
                    $('#servicosEstabelecimento').text(response.servicos);
                    $('#profissionaisEstabelecimento').text(response.profissionais);

                    // Esconder a mensagem de carregamento e exibir os dados
                    $('#mensagemStatus').hide();
                    $('#dadosEstabelecimento').show();

                    // Definir o ID no bot�o de agendamento
                    $('#btnAgendar').attr('href', 'agendarServico.jsp?id=' + id);
                },
                error: function(xhr, status, error) {
                    console.error('Erro ao buscar estabelecimento: ', error);
                    $('#mensagemStatus').html('<span class="error-message">Erro ao buscar dados.</span>');
                }
            });
        } else {
            // Caso n�o tenha o ID na URL
            $('#mensagemStatus').html('<span class="error-message">ID n�o encontrado na URL.</span>');
        }
    });
</script>

</body>
</html>
