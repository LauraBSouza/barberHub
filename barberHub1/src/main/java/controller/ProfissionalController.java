package controller;

import java.io.IOException;
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
                Profissional profissional = dao.findById(Integer.parseInt(profissionalId));
                if (profissional != null) {
                    String json = gson.toJson(profissional);
                    response.getWriter().write(json);
                } else {
                    JsonObject json = new JsonObject();
                    json.addProperty("error", "Record not found");
                    response.getWriter().write(gson.toJson(json));
                }
            } else {
                response.getWriter().write(gson.toJson(dao.findAll()));
            }
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
            Profissional profissional = gson.fromJson(request.getReader(), Profissional.class);
            if (profissional.getNome() == null || profissional.getNome().isEmpty()) {
                JsonObject json = new JsonObject();
                json.addProperty("error", "Nome do profissional é obrigatório");
                response.getWriter().write(gson.toJson(json));
                return;
            }

            dao.save(profissional);
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
        String profissionalId = request.getParameter("profissionalId");

        try {
            if (profissionalId != null) {
                Profissional profissional = gson.fromJson(request.getReader(), Profissional.class);
                dao.save(profissional);
                JsonObject json = new JsonObject();
                json.addProperty("success", true);
                response.getWriter().write(gson.toJson(json));
            } else {
                JsonObject json = new JsonObject();
                json.addProperty("error", "profissionalId é necessário");
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
            Profissional profissional = gson.fromJson(request.getReader(), Profissional.class);
            dao.delete(profissional);
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
