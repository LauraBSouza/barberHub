<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Servi�os - BarberHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<!-- Barra de Navega��o -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Barbearia Marketplace</a>
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

<!-- T�tulo e Bot�o de Adicionar Servi�o -->
<div class="container my-5">
    <h2>Gerenciamento de Servi�os</h2>
    <a href="cadastrarServico.jsp" class="btn btn-primary mb-3">Adicionar Novo Servi�o</a>

    <!-- Tabela de Servi�os -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome do Servi�o</th>
                <th>Descri��o</th>
                <th>Pre�o</th>
                <th>A��es</th>
            </tr>
        </thead>
        <tbody>
            <!-- Exemplo de servi�o, substitua com dados din�micos do banco -->
            <tr>
                <td>1</td>
                <td>Corte de Cabelo</td>
                <td>Corte de cabelo masculino ou feminino</td>
                <td>R$ 50,00</td>
                <td>
                    <a href="editarServico.jsp?id=1" class="btn btn-warning btn-sm">Editar</a>
                    <a href="excluirServico.jsp?id=1" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Barba e Bigode</td>
                <td>Barba bem feita, modelada e aparada</td>
                <td>R$ 30,00</td>
                <td>
                    <a href="editarServico.jsp?id=2" class="btn btn-warning btn-sm">Editar</a>
                    <a href="excluirServico.jsp?id=2" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <!-- Servi�os din�micos aqui -->
        </tbody>
    </table>
</div>

<!-- Rodap� -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>� 2024 BarberHub - Todos os direitos reservados.</p>
</footer>

<!-- Scripts do Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
