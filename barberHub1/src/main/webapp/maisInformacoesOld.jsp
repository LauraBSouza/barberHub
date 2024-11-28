<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <img src="https://via.placeholder.com/500" class="img-fluid rounded" alt="Barbearia">
        </div>
        <div class="col-md-6">
            <h3>Barbearia X</h3>
            <p><strong>Localização:</strong> Rua da Barbearia, 123 - Centro</p>
            <p><strong>Serviços:</strong></p>
            <ul>
                <li>Corte de Cabelo</li>
                <li>Barba e Corte</li>
                <li>Hidratação Capilar</li>
            </ul>
            <p><strong>Horário de Funcionamento:</strong> Segunda a Sexta - 9:00 às 18:00</p>
            <p><strong>Descrição:</strong> A Barbearia X oferece os melhores cortes de cabelo e serviços de barbearia em um ambiente moderno e acolhedor.</p>

            <!-- Botão para Agendar -->
            <a href="agendarServico.jsp" class="btn btn-primary">Agendar Agora</a>
        </div>
    </div>

    <hr>

    <!-- Avaliações -->
    <h3 class="mb-3">Avaliações</h3>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">João Silva</h5>
            <p class="card-text">"Excelente atendimento, recomendo a todos! O corte de cabelo ficou perfeito."</p>
            <p class="card-text"><small class="text-muted">Publicado em 20/10/2024</small></p>
        </div>
    </div>
    <div class="card mt-3">
        <div class="card-body">
            <h5 class="card-title">Maria Souza</h5>
            <p class="card-text">"Ambiente muito agradável e o atendimento foi rápido. Voltarei com certeza."</p>
            <p class="card-text"><small class="text-muted">Publicado em 18/10/2024</small></p>
        </div>
    </div>

</div>

<!-- Rodapé -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>© 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
