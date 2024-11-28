<%@ page import="java.util.List" %>
<%@ page import="model.Estabelecimento" %>

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
        /* Container que ir� conter os cards */
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Espa�amento entre os cards */
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
                width: 45%; /* Cart�es ocupam 45% da largura em telas m�dias */
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 90%; /* Cart�es ocupam 90% da largura em telas pequenas */
            }
        }
    </style>
    <script>
        $(document).ready(function() {
            // Requisi��o AJAX para pegar os dados dos estabelecimentos
            $.ajax({
                url: '/barberHub1/estabelecimento',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Checando se os dados retornados possuem um erro
                    if (data.error) {
                        $('#estabelecimentos-list').html('<p>' + data.error + '</p>');
                    } else {
                        // Se a resposta for bem-sucedida, populando os dados na p�gina
                        var listHtml = '';
                        data.forEach(function(estabelecimento) {
                            listHtml += '<div class="card">' +
                                            '<img src="https://via.placeholder.com/400x200" class="card-img-top" alt="Imagem do estabelecimento">' +
                                            '<div class="card-body">' +
                                                '<h5 class="card-title">' + estabelecimento.nome + '</h5>' +
                                                '<p class="card-text"><strong>Email:</strong>' + estabelecimento.email + '</p>' +
                                                '<p class="card-text"><strong>Telefone:</strong>' + estabelecimento.telefone + '</p>' +
                                                '<p class="card-text"><strong>Cidade:</strong>' + estabelecimento.cidade + '</p>' +
                                                '<a href="maisInformacoes.jsp?id=' + estabelecimento.id + '" class="btn btn-primary">Ver Mais</a>' +
                                            '</div>' +
                                          '</div>';
                        });
                        $('#estabelecimentos-list').html(listHtml);
                    }
                },
                error: function(xhr, status, error) {
                    $('#estabelecimentos-list').html('<p>Erro ao carregar dados dos estabelecimentos.</p>');
                }
            });

            // Requisi��o AJAX para preencher o select de tipos de servi�o
            $.ajax({
                url: '/barberHub1/tipoServico',  // Supondo que haja um endpoint para obter os tipos de servi�o
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var selectHtml = '<option value="">Selecione um servi�o</option>';
                    data.forEach(function(servico) {
                        // Usando 'servico.servico' para acessar o nome correto do servi�o
                        selectHtml += '<option value="' + servico.tipoServicoId + '">' + servico.servico + '</option>';
                    });
                    $('#servico').html(selectHtml);
                },
                error: function(xhr, status, error) {
                    console.error('Erro ao carregar tipos de servi�o:', error);
                }
            });

            // Captura o evento de clique nos bot�es de editar
            $(document).on('click', '.editar-btn', function() {
                // Captura o ID do estabelecimento associado ao bot�o de editar
                var estabelecimentoId = $(this).data('id');
                console.log("ID do estabelecimento para editar: " + estabelecimentoId);

                // Aqui voc� pode realizar a a��o desejada, como redirecionar para uma p�gina de edi��o ou abrir uma modal
                // Exemplo de redirecionamento para a p�gina de edi��o:
                window.location.href = "editarEstabelecimento.jsp?id=" + estabelecimentoId;
            });
        });
    </script>
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
            <!-- <div class="col-md-4">
                <div class="form-group">
                    <label for="localizacao">Localiza��o</label>
                    <input type="text" class="form-control" id="localizacao" placeholder="Digite sua cidade ou bairro">
                </div>
            </div> -->
            <div class="col-md-4">
                <div class="form-group">
                    <label for="servico">Servi�o</label>
                    <select class="form-control" id="servico">
                        <!-- As op��es ser�o preenchidas via AJAX -->
                    </select>
                </div>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <button class="btn btn-primary w-100">Buscar</button>
            </div>
        </div>
    </div>

    <!-- Lista de Estabelecimentos -->
    <h1 class="text-center my-4">Lista de Estabelecimentos</h1>
    <div class="cards-container" id="estabelecimentos-list">
        <!-- Cards ser�o preenchidos aqui via AJAX -->
    </div>

    <!-- Rodap� -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>� 2024 BarberHub - Todos os direitos reservados.</p>
    </footer>
</body>
</html>
