<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barbearias - BarberHub</title>
    <!-- Incluindo o Bootstrap para design responsivo e moderno -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<!-- Tela de Barbearias -->
<div class="container my-5">
    <h2 class="text-center mb-4">BarberHub</h2>

    <!-- Filtro de Busca -->
    <div class="mb-4">
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Buscar Barbearias" aria-label="Buscar" id="searchBarbearias">
            <button class="btn btn-outline-primary" type="submit">Buscar</button>
        </form>
    </div>

    <!-- Lista de Barbearias -->
    <div class="row">
        <!-- Barbearia 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Barbearia 1">
                <div class="card-body">
                    <h5 class="card-title">Barbearia X</h5>
                    <p class="card-text">Barbearia moderna com cortes de cabelo e barba, localizada no centro da cidade.</p>
                    <a href="maisInformacoes.jsp?id=1" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Barbearia 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Barbearia 2">
                <div class="card-body">
                    <h5 class="card-title">Barbearia Y</h5>
                    <p class="card-text">Ambiente aconchegante e atendimento de qualidade, ideal para um corte de cabelo rápido e elegante.</p>
                    <a href="detalhesBarbearia.jsp?id=2" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Barbearia 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Barbearia 3">
                <div class="card-body">
                    <h5 class="card-title">Barbearia Z</h5>
                    <p class="card-text">Com um atendimento especializado e um ambiente descontraído, a Barbearia Z é ideal para todos os públicos.</p>
                    <a href="detalhesBarbearia.jsp?id=3" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
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

<!-- Funcionalidade de Busca de Barbearias -->
<script>
    document.getElementById("searchBarbearias").addEventListener("input", function() {
        let searchQuery = this.value.toLowerCase();
        let cards = document.querySelectorAll(".card");
        
        cards.forEach(function(card) {
            let title = card.querySelector(".card-title").textContent.toLowerCase();
            let description = card.querySelector(".card-text").textContent.toLowerCase();
            if (title.includes(searchQuery) || description.includes(searchQuery)) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    });
</script>

</body>
</html>
