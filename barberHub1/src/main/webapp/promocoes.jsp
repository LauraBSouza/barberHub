<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promoções - BarberHub</title>
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

<!-- Tela de Promoções -->
<div class="container my-5">
    <h2 class="text-center mb-4">Promoções Ativas</h2>

    <!-- Cartões de Promoção -->
    <div class="row">
        <!-- Cartão de Promoção 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 1">
                <div class="card-body">
                    <h5 class="card-title">Desconto em Cortes de Cabelo</h5>
                    <p class="card-text">Aproveite 20% de desconto nos cortes de cabelo durante o mês de novembro.</p>
                    <a href="detalhesPromocao.jsp?id=1" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Cartão de Promoção 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 2">
                <div class="card-body">
                    <h5 class="card-title">Combo de Barba e Cabelo</h5>
                    <p class="card-text">Adquira um combo de corte de cabelo e barba com 25% de desconto.</p>
                    <a href="detalhesPromocao.jsp?id=2" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Cartão de Promoção 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 3">
                <div class="card-body">
                    <h5 class="card-title">Desconto para Novos Clientes</h5>
                    <p class="card-text">Novos clientes ganham 15% de desconto na primeira visita.</p>
                    <a href="detalhesPromocao.jsp?id=3" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <!-- Cartão de Promoção 1 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 1">
                <div class="card-body">
                    <h5 class="card-title">Desconto em Cortes de Cabelo</h5>
                    <p class="card-text">Aproveite 20% de desconto nos cortes de cabelo durante o mês de novembro.</p>
                    <a href="detalhesPromocao.jsp?id=1" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Cartão de Promoção 2 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 2">
                <div class="card-body">
                    <h5 class="card-title">Combo de Barba e Cabelo</h5>
                    <p class="card-text">Adquira um combo de corte de cabelo e barba com 25% de desconto.</p>
                    <a href="detalhesPromocao.jsp?id=2" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>

        <!-- Cartão de Promoção 3 -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Promoção 3">
                <div class="card-body">
                    <h5 class="card-title">Desconto para Novos Clientes</h5>
                    <p class="card-text">Novos clientes ganham 15% de desconto na primeira visita.</p>
                    <a href="detalhesPromocao.jsp?id=3" class="btn btn-primary">Ver Detalhes</a>
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

</body>
</html>
