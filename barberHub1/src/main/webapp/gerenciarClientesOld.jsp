<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Clientes - BarberHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<!-- Barra de Navegação -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Barbearia Marketplace</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
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
                <a class="nav-link" href="gerenciarServicos.jsp">Serviços</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarProfissionais.jsp">Profissionais</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="gerenciarPromocoes.jsp">Promoções</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Título e Botão de Adicionar Cliente -->
<div class="container my-5">
    <h2>Gerenciamento de Clientes</h2>
    <a href="cadastrarCliente.jsp" class="btn btn-primary mb-3">Adicionar Novo Cliente</a>

    <!-- Tabela de Clientes -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <!-- Exemplo de cliente, você pode substituir com dados dinâmicos do banco -->
            <tr>
                <td>1</td>
                <td>João Silva</td>
                <td>joao@gmail.com</td>
                <td>(11) 91234-5678</td>
                <td>
                    <a href="editarCliente.jsp?id=1" class="btn btn-warning btn-sm">Editar</a>
                    <a href="excluirCliente.jsp?id=1" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Maria Oliveira</td>
                <td>maria@gmail.com</td>
                <td>(11) 99876-5432</td>
                <td>
                    <a href="editarCliente.jsp?id=2" class="btn btn-warning btn-sm">Editar</a>
                    <a href="excluirCliente.jsp?id=2" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <!-- Clientes dinâmicos aqui -->
        </tbody>
    </table>
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
