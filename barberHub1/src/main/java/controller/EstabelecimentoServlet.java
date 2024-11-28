package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Estabelecimento;
import model.TipoServico;

@WebServlet("/exibirEstabelecimento")
public class EstabelecimentoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Criar ou buscar o estabelecimento
        Estabelecimento estabelecimento = new Estabelecimento(1, "Barbearia XYZ", "contato@barbeariaxyz.com", "senha", "123456789", "12345-678", "Rua A", "123", "Apto 1", "Centro", "Cidade", "Estado", 1, "2023-11-27", "foto.jpg");

        // Criar ou buscar os tipos de serviços
        TipoServico tipoServico1 = new TipoServico(1, "Corte de Cabelo", "Corte de cabelo moderno");
        TipoServico tipoServico2 = new TipoServico(2, "Barba", "Aparar e fazer barba");
        
        List<TipoServico> tiposDeServico = Arrays.asList(tipoServico1, tipoServico2);

        // Atribuindo os dados ao request para o JSP
        request.setAttribute("estabelecimento", estabelecimento);
        request.setAttribute("tiposDeServico", tiposDeServico);

        // Encaminhando para a página JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/exibirEstabelecimento.jsp");
        dispatcher.forward(request, response);
    }
}
