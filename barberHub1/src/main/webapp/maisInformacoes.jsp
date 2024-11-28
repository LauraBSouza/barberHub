<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Mais - BarberHub</title>
    <!-- Incluindo o Bootstrap para design responsivo e moderno -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                <a class="nav-link" href="#">Meus Agendamentos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Conteúdo da Página Ver Mais -->
<div class="container my-5">
    <h2 class="text-center mb-4">Detalhes da Barbearia</h2>

    <!-- Informações da Barbearia -->
    <div class="row">
        <div class="col-md-6">
            <img id="barbearia-imagem" src="https://via.placeholder.com/500" class="img-fluid rounded" alt="Barbearia">
        </div>
        <div class="col-md-6">
            <h3 id="barbearia-nome">Barbearia X</h3>
            <p><strong>Localização:</strong> <span id="barbearia-localizacao">Rua da Barbearia, 123 - Centro</span></p>
            <p><strong>Serviços:</strong></p>
            <ul id="barbearia-servicos">
                <!-- Serviços da barbearia serão adicionados aqui -->
            </ul>
            <p><strong>Horário de Funcionamento:</strong> <span id="barbearia-horario">Segunda a Sexta - 9:00 às 18:00</span></p>
            <p><strong>Descrição:</strong> <span id="barbearia-descricao">Descrição da barbearia.</span></p>

            <!-- Botão para Agendar -->
            <a href="agendarServico.jsp" class="btn btn-primary">Agendar Agora</a>
        </div>
    </div>

    <hr>

    <!-- Avaliações -->
    <h3 class="mb-3">Avaliações</h3>
    <div id="avaliacoes-container">
        <!-- Avaliações serão carregadas aqui -->
    </div>

</div>

<!-- Rodapé -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>© 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do Bootstrap e jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

<script>
    // Carregar detalhes da barbearia usando AJAX
    $(document).ready(function() {
        // Suponha que o ID da barbearia seja 1, ou obtenha o ID de alguma forma (ex: URL)
        var barbeariaId = 1;

        $.ajax({
            url: '/barberHub1/BarbeariaServlet?id=' + barbeariaId,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                // Preenchendo os detalhes da barbearia
                $('#barbearia-nome').text(data.nome);
                $('#barbearia-localizacao').text(data.localizacao);
                $('#barbearia-horario').text(data.horario);
                $('#barbearia-descricao').text(data.descricao);
                $('#barbearia-imagem').attr('src', data.imagemUrl);

                // Preenchendo a lista de serviços
                var servicosHtml = '';
                data.servicos.forEach(function(servico) {
                    servicosHtml += '<li>' + servico + '</li>';
                });
                $('#barbearia-servicos').html(servicosHtml);

                // Preenchendo as avaliações
                var avaliacoesHtml = '';
                data.avaliacoes.forEach(function(avaliacao) {
                    avaliacoesHtml += `
                        <div class="card mt-3">
                            <div class="card-body">
                                <h5 class="card-title">${avaliacao.nomeCliente}</h5>
                                <p class="card-text">"${avaliacao.comentario}"</p>
                                <p class="card-text"><small class="text-muted">Publicado em ${avaliacao.data}</small></p>
                            </div>
                        </div>
                    `;
                });
                $('#avaliacoes-container').html(avaliacoesHtml);
            },
            error: function(xhr, status, error) {
                console.error('Erro ao carregar detalhes da barbearia:', error);
            }
        });
    });
</script>

</body>
</html>
