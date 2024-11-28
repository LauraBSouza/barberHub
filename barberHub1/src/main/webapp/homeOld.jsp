<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BarberHub</title>

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
                <input type="text" class="form-control" id="localizacao" placeholder="Digite sua cidade ou bairro">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="servico">Serviço</label>
                <select class="form-control" id="servico">
                    <option value="corte">Corte de cabelo</option>
                    <option value="barba">Barba</option>
                    <option value="pacote">Pacote Completo</option>
                </select>
            </div>
        </div>
        <div class="col-md-4 d-flex align-items-end">
            <button class="btn btn-primary w-100">Buscar</button>
        </div>
    </div>
</div>

<!-- Barbearias em Destaque -->
<div class="container my-5">
    <h2 class="text-center mb-4">Barbearias em Destaque</h2>
    <div class="row">
        <!-- Card de Barbearia -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Barbearia 1">
                <div class="card-body">
                    <h5 class="card-title">Barbearia Vip</h5>
                    <p class="card-text">Corte de cabelo, barba e pacotes completos. Localização: Centro.</p>
                    <a href="maisInformacoes.jsp?id=1" class="btn btn-primary">Ver Mais</a>
                </div>
            </div>
        </div>
        <!-- Card de Barbearia -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Barbearia 2">
                <div class="card-body">
                    <h5 class="card-title">Barbearia Elite</h5>
                    <p class="card-text">Corte moderno, estética masculina e pacotes especiais. Localização: Bairro Nova.</p>
                    <a href="maisInformacoes.jsp" class="btn btn-primary">Ver Mais</a>
                </div>
            </div>
        </div>
        <!-- Card de Barbearia -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Barbearia 3">
                <div class="card-body">
                    <h5 class="card-title">Corte & Barba</h5>
                    <p class="card-text">Especialistas em cortes e barba. Localização: Zona Sul.</p>
                    <a href="maisInformacoes.jsp" class="btn btn-primary">Ver Mais</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Seção de Promoções -->
<div class="container my-5">
    <h2 class="text-center mb-4">Promoções</h2>
    <div class="row">
        <!-- Card de Promoção -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Promoção 1">
                <div class="card-body">
                    <h5 class="card-title">Promoção de Corte + Barba</h5>
                    <p class="card-text">Desconto de 20% em pacotes de corte de cabelo e barba.</p>
                    <a href="#" class="btn btn-warning">Aproveitar</a>
                </div>
            </div>
        </div>
        <!-- Card de Promoção -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Promoção 2">
                <div class="card-body">
                    <h5 class="card-title">Corte de Cabelo - Só R$ 29,90</h5>
                    <p class="card-text">Aproveite o corte de cabelo por apenas R$ 29,90. Exclusivo para novos clientes.</p>
                    <a href="#" class="btn btn-warning">Aproveitar</a>
                </div>
            </div>
        </div>
        <!-- Card de Promoção -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Promoção 3">
                <div class="card-body">
                    <h5 class="card-title">Pacote Completo - 10% OFF</h5>
                    <p class="card-text">Desconto em pacotes de serviços completos. Agende agora!</p>
                    <a href="#" class="btn btn-warning">Aproveitar</a>
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