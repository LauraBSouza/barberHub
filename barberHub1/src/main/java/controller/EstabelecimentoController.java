package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.Estabelecimento;
import model.EstabelecimentoDAO;
import model.ProfissionalServico;
import model.ProfissionalServicoDAO;

@WebServlet("/estabelecimento")
public class EstabelecimentoController extends HttpServlet {

	
    private ProfissionalServicoDAO profissionalservicoDAO = new ProfissionalServicoDAO(); // Acesso ao
	private EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
	private Gson gson = new GsonBuilder().setPrettyPrinting().create();

	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("application/json");
	        try {
	            List<Estabelecimento> estabelecimentos = estabelecimentoDAO.findAll();
	            JsonArray jsonArray = new JsonArray();

	            for (Estabelecimento estabelecimento : estabelecimentos) {
	                JsonObject estabelecimentoJson = new JsonObject();
	                estabelecimentoJson.addProperty("id", estabelecimento.getEstabelecimentoid());
	                estabelecimentoJson.addProperty("nome", estabelecimento.getNome());
	                estabelecimentoJson.addProperty("email", estabelecimento.getEmail());
	                estabelecimentoJson.addProperty("cidade", estabelecimento.getCidade());
	                estabelecimentoJson.addProperty("telefone", estabelecimento.getTelefone());
	                
					/*
					 * // Buscando os serviços associados List<ProfissionalServico> servicos =
					 * (List<ProfissionalServico>)
					 * profissionalservicoDAO.findById(estabelecimento.getEstabelecimentoid());
					 * JsonArray servicosJson = new JsonArray(); for (ProfissionalServico servico :
					 * servicos) { JsonObject servicoJson = new JsonObject();
					 * servicoJson.addProperty("tipoServico",
					 * servico.getServico().getTipoServico().getServico()); // Exemplo de como
					 * acessar o nome do tipo de serviço servicosJson.add(servicoJson); }
					 * estabelecimentoJson.add("servico", servicosJson);
					 */

	                jsonArray.add(estabelecimentoJson);
	            }

	            response.getWriter().write(gson.toJson(jsonArray));
	        } catch (Exception e) {
	            JsonObject json = new JsonObject();
	            json.addProperty("error", e.getMessage());
	            response.getWriter().write(gson.toJson(json));
	        }
	    }



	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		try {
			Estabelecimento estabelecimento = gson.fromJson(request.getReader(), Estabelecimento.class);
			estabelecimentoDAO.save(estabelecimento);
			JsonObject json = new JsonObject();
			json.addProperty("success", true);
			response.getWriter().write(gson.toJson(json));
		} catch (Exception e) {
			JsonObject json = new JsonObject();
			json.addProperty("error", e.getMessage());
			response.getWriter().write(gson.toJson(json));
		}
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		String estabelecimentoId = request.getParameter("estabelecimentoId");
		try {
			if (estabelecimentoId != null) {
				Estabelecimento estabelecimento = gson.fromJson(request.getReader(), Estabelecimento.class);
				estabelecimentoDAO.save(estabelecimento);
				JsonObject json = new JsonObject();
				json.addProperty("success", true);
				response.getWriter().write(gson.toJson(json));
			} else {
				JsonObject json = new JsonObject();
				json.addProperty("error", "estabelecimentoId is required");
				response.getWriter().write(gson.toJson(json));
			}
		} catch (Exception e) {
			JsonObject json = new JsonObject();
			json.addProperty("error", e.getMessage());
			response.getWriter().write(gson.toJson(json));
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		try {
			Estabelecimento estabelecimento = gson.fromJson(request.getReader(), Estabelecimento.class);
			estabelecimentoDAO.delete(estabelecimento);
			JsonObject json = new JsonObject();
			json.addProperty("success", true);
			response.getWriter().write(gson.toJson(json));
		} catch (Exception e) {
			JsonObject json = new JsonObject();
			json.addProperty("error", e.getMessage());
			response.getWriter().write(gson.toJson(json));
		}
	}
	


}
