package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import database.DBQuery;

public class ProfissionalServicoDAO extends DBQuery {

    // Construtor para inicializar a tabela e campos
    public ProfissionalServicoDAO() {
        this.setTableName("profissionalServico");
        this.setFieldsName("profissionalId, servicoId");
        this.setFieldKey("profissionalId");
    }

    // Método para salvar um ProfissionalServico (inserção ou atualização)
    public int save(ProfissionalServico profissionalServico) {
        if (profissionalServico.getProfissional().getProfissionalid() >= 0) {
            // Atualiza registro existente
            return this.update(profissionalServico.toArray());
        } else {
            // Insere um novo registro
            return this.insert(profissionalServico.toArray());
        }
    }

    // Método para excluir um ProfissionalServico
	/*
	 * public int delete(ProfissionalServico profissionalServico) { if
	 * (profissionalServico.getProfissional().getProfissionalid() != 0) { // Exclui
	 * o registro com base no ID return super.delete("WHERE profissionalId = " +
	 * profissionalServico.getProfissional().getProfissionalid()); } else { return
	 * 0; } }
	 */

    // Método para selecionar registros com base em uma condição
    public ResultSet select(String where) {
        return super.select(where); // Chama o método select da classe base (DBQuery)
    }

    // Método para encontrar todos os registros de ProfissionalServico
    public ArrayList<ProfissionalServico> findAll() {
        ResultSet rs = this.select("");
        ArrayList<ProfissionalServico> list = new ArrayList<>();

        try {
            while (rs.next()) {
                // Inicializa o objeto ProfissionalServico e seus componentes
                ProfissionalServico profissionalServico = new ProfissionalServico();
                profissionalServico.getProfissional().setProfissionalid(rs.getInt("profissionalId"));
                profissionalServico.getServico().setServicoId(rs.getInt("servicoId"));
                
                // Adiciona o objeto à lista
                list.add(profissionalServico);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Fechar o ResultSet após uso
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }

    // Método para encontrar um ProfissionalServico por ID
    public ProfissionalServico findById(int id) {
        ProfissionalServico profissionalServico = null;

        // Usando try-with-resources para garantir que o ResultSet seja fechado
        try (ResultSet rs = this.select("WHERE " + this.getFieldKey() + " = " + id)) {
            if (rs != null && rs.next()) {
                // Inicializa o objeto ProfissionalServico com dados do ResultSet
                profissionalServico = new ProfissionalServico();
                profissionalServico.getProfissional().setProfissionalid(rs.getInt("profissionalId"));
                profissionalServico.getServico().setServicoId(rs.getInt("servicoId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return profissionalServico; // Retorna null se não encontrar nenhum registro
    }
}
