<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Estabelecimento, model.TipoServico" %>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Estabelecimento e Serviços</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Detalhes do Estabelecimento</h1>
        <!-- Exibindo informações do estabelecimento -->
        <div class="card">
            <img src="${estabelecimento.foto}" class="card-img-top" alt="Imagem do Estabelecimento">
            <div class="card-body">
                <h5 class="card-title">${estabelecimento.nome}</h5>
                <p class="card-text">
                    <strong>Email:</strong> ${estabelecimento.email} <br>
                    <strong>Telefone:</strong> ${estabelecimento.telefone} <br>
                    <strong>Endereço:</strong> ${estabelecimento.rua}, ${estabelecimento.numero} - ${estabelecimento.bairro}, ${estabelecimento.cidade} - ${estabelecimento.estado} <br>
                    <strong>CEP:</strong> ${estabelecimento.cep} <br>
                    <strong>Data de Cadastro:</strong> ${estabelecimento.dataCadastro}
                </p>
            </div>
        </div>

        <h2 class="mt-4">Tipos de Serviços</h2>
        <div class="row">
            <!-- Exibindo os serviços -->
            <c:forEach var="servico" items="${tiposDeServico}">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${servico.nome}</h5>
                            <p class="card-text">${servico.descricao}</p>
                            <p class="card-text"><strong>Preço:</strong> R$ ${servico.preco}</p>
                            <p class="card-text"><strong>Duração:</strong> ${servico.duracao} minutos</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
