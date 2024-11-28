package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import model.Profissional;
import model.ProfissionalDAO;

@WebServlet("/profissional")
public class ProfissionalController extends HttpServlet {

    private ProfissionalDAO dao = new ProfissionalDAO();
    private Gson gson = new GsonBuilder().setPrettyPrinting().create();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        String profissionalId = request.getParameter("profissionalId");

        try {
            if (profissionalId != null) {
                // Busca um profissional por ID
                Profissional profissional = dao.findById(Integer.parseInt(profissionalId));
                if (profissional != null) {
                    String json = gson.toJson(profissional);
                    response.getWriter().write(json);
                } else {
                    sendErrorResponse(response, "Profissional não encontrado");
                }
            } else {
                // Lista todos os profissionais
                ArrayList<Profissional> profissionais = dao.findAll();
                String json = gson.toJson(profissionais);
                response.getWriter().write(json);
            }
        } catch (Exception e) {
            sendErrorResponse(response, e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        try {
            // Recebe o JSON enviado do frontend e converte para um objeto Profissional
            Profissional profissional = gson.fromJson(request.getReader(), Profissional.class);

            if (profissional.getNome() == null || profissional.getNome().isEmpty()) {
                sendErrorResponse(response, "Nome do profissional é obrigatório");
                return;
            }

            // Salva ou atualiza o profissional
            int result = dao.save(profissional);
            JsonObject json = new JsonObject();
            json.addProperty("status", "success");
            json.addProperty("message", result > 0 ? "Profissional salvo com sucesso" : "Erro ao salvar profissional");
            response.getWriter().write(gson.toJson(json));

        } catch (Exception e) {
            sendErrorResponse(response, e.getMessage());
        }
    }

    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String profissionalId = request.getParameter("profissionalId");

        try {
            if (profissionalId != null && !profissionalId.isEmpty()) {
                // Busca o profissional a ser atualizado
                Profissional profissionalExistente = dao.findById(Integer.parseInt(profissionalId));
                if (profissionalExistente == null) {
                    sendErrorResponse(response, "Profissional não encontrado para atualização");
                    return;
                }

                // Recebe os dados atualizados do profissional
                Profissional profissional = gson.fromJson(request.getReader(), Profissional.class);

                // Validação: verificar se campos obrigatórios estão preenchidos
                if (profissional.getNome() == null || profissional.getNome().isEmpty()) {
                    sendErrorResponse(response, "Nome do profissional é obrigatório");
                    return;
                }

                if (profissional.getServico() == null || profissional.getServico().isEmpty()) {
                    sendErrorResponse(response, "Serviço do profissional é obrigatório");
                    return;
                }

                // Atualiza o profissional
                int result = dao.save(profissional);
                JsonObject json = new JsonObject();
                json.addProperty("status", "success");
                json.addProperty("message", "Profissional atualizado com sucesso");
                response.getWriter().write(gson.toJson(json));
            } else {
                sendErrorResponse(response, "profissionalId é necessário");
            }
        } catch (Exception e) {
            sendErrorResponse(response, e.getMessage());
        }
    }


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String profissionalId = request.getParameter("profissionalId"); // Obtém o ID do profissional

        try {
            if (profissionalId != null && !profissionalId.isEmpty()) {
                // Exclui o profissional pelo ID
                int id = Integer.parseInt(profissionalId);
                int result = dao.deleteById(id); // Supondo que você tenha um método para deletar pelo ID

                JsonObject json = new JsonObject();
                if (result > 0) {
                    json.addProperty("status", "success");
                    json.addProperty("message", "Profissional excluído com sucesso");
                } else {
                    json.addProperty("status", "error");
                    json.addProperty("message", "Erro ao excluir profissional");
                }
                response.getWriter().write(gson.toJson(json));
            } else {
                sendErrorResponse(response, "profissionalId é necessário");
            }
        } catch (Exception e) {
            sendErrorResponse(response, e.getMessage());
        }
    }


    private void sendErrorResponse(HttpServletResponse response, String errorMessage) throws IOException {
        JsonObject json = new JsonObject();
        json.addProperty("status", "error");
        json.addProperty("message", errorMessage);
        response.getWriter().write(gson.toJson(json));
    }
}
