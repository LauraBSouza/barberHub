<%@ page import="java.util.List" %>
<%@ page import="model.Estabelecimento" %>
<%@ page import="model.TipoServico" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Incluindo o jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Container que irá conter os cards */
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Espaçamento entre os cards */
            justify-content: space-around;
            padding: 20px;
        }

        /* Estilo do card */
        .card {
            width: 22%;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: white;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        @media (max-width: 768px) {
            .card {
                width: 45%; /* Cartões ocupam 45% da largura em telas médias */
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 90%; /* Cartões ocupam 90% da largura em telas pequenas */
            }
        }
    </style>
    <script>
    $.ajax({
        url: '/barberHub1/estabelecimento', // Substitua pela URL da sua requisição
        method: 'GET', 
        success: function(response) {
            // Adicione este log para verificar a resposta
            console.log(response);

            // Verifique se a resposta é um array válido
            if (Array.isArray(response)) {
                response.forEach(function(estabelecimento) {
                    console.log(estabelecimento.nome); // Aqui também verificamos se o nome está correto
                    // Exemplo de como você pode usar os dados no HTML
                    $('#estabelecimentos-list').append('<li>' + estabelecimento.nome + estabelecimento.cidade + '</li>');
                });
            } else {
                console.error("A resposta não é um array válido.");
            }
        },
        error: function(err) {
            console.error("Erro na requisição:", err);
        }
    });



        $(document).ready(function() {
            // Requisição AJAX para preencher o select de tipos de serviço
            $.ajax({
                url: '/barberHub1/tipoServico',  // Supondo que haja um endpoint para obter os tipos de serviço
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var selectHtml = '<option value="">Selecione um serviço</option>';
                    data.forEach(function(servico) {
                        selectHtml += '<option value="' + servico.tipoServicoId + '">' + servico.servico + '</option>';
                    });
                    $('#servico').html(selectHtml);
                },
                error: function(xhr, status, error) {
                    console.error('Erro ao carregar tipos de serviço:', error);
                }
            });
        });

        $(document).ready(function() {
            $('#buscar button').on('click', function() {
                var localizacao = $('#localizacao').val();
                var servico = $('#servico').val();

                var url = '/barberHub1/estabelecimento';
                if (servico) {
                    url += '?tipoServico=' + encodeURIComponent(servico);
                }

                $.ajax({
                    url: url,
                    method: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        var listHtml = '';
                        if (data.length > 0) {
                            data.forEach(function(estabelecimento) {
                                var servicos = '';
                                estabelecimento.servicos.forEach(function(servico) {
                                    servicos += '<span class="badge bg-primary me-1">' + servico.tipoServico + '</span>';
                                });

                                listHtml += '<div class="card"><img src="https://via.placeholder.com/400x200" class="card-img-top" alt="Imagem do estabelecimento"><div class="card-body"><h5 class="card-title">' + estabelecimento.nome + '</h5><p class="card-text"><strong>Serviços:</strong>' + servicos + '</p><p class="card-text"><strong>Telefone:</strong>' + estabelecimento.telefone + '</p><p class="card-text"><strong>Cidade:</strong>' + estabelecimento.cidade + '</p><a href="maisInformacoes.jsp?id=' + estabelecimento.id +'" class="btn btn-primary">Ver Mais</a></div></div>';
                            });
                        } else {
                            listHtml = '<p>Nenhum estabelecimento encontrado.</p>';
                        }
                        $('#estabelecimentos-list').html(listHtml);
                    },
                    error: function(xhr, status, error) {
                        $('#estabelecimentos-list').html('<p>Erro ao carregar estabelecimentos.</p>');
                    }
                });
            });
        });
    </script>
</head>
<body>
	<!-- Barra de Navegação -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="home.jsp">BarberHub</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Início</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="barbearias.jsp">Barbearias</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="promocoes.jsp">Promoções</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="agendamentosClientes.jsp">Meus Agendamentos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Banner Principal -->
<div class="container-fluid p-5 bg-primary text-white text-center">
    <h1>Bem-vindo ao BarberHub!</h1>
    <p>Encontre as melhores barbearias da sua cidade com facilidade</p>
    <a href="barbearias.jsp" class="btn btn-light btn-lg">Buscar Barbearias</a>
</div>

<!-- Filtros de Busca -->
<div class="container my-5" id="buscar">
    <h2 class="text-center mb-4">Encontre a Barbearia Perfeita</h2>
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="form-group">
                <label for="localizacao">Localização</label>
                <input type="text" class="form-control" id="localizacao" placeholder="Digite sua cidade">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="servico">Serviço</label>
                <select class="form-control" id="servico">
                    <option value="">Selecione um serviço</option>
                </select>
            </div>
        </div>
        <div class="col-md-2 d-flex align-items-end">
            <button class="btn btn-primary btn-block">Buscar</button>
        </div>
    </div>
</div>

<!-- Exibição dos Estabelecimentos -->
<div class="container" id="estabelecimentos-list">
    <!-- Lista de cards será gerada aqui pelo JavaScript -->
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 BarberHub. Todos os direitos reservados.</p>
</footer>

<!-- Scripts Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
