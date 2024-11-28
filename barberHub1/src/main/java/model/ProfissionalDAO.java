package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.DBConnection;
import database.DBQuery;

public class ProfissionalDAO extends DBQuery {

    public ProfissionalDAO() {
        this.setTableName("profissional");
        this.setFieldsName("profissionalId, estabelecimentoId, nome, servico, cep, rua, numero, complemento, bairro, cidade, estado, foto");
        this.setFieldKey("profissionalId");
    }

    public int save(Profissional profissional) {
        if (profissional.getProfissionalid() > 0) {
            return this.update(profissional.toArray());
        } else {
            return this.insert(profissional.toArray());
        }
    }

    public int insert(Object[] values) {
        String query = "INSERT INTO " + this.getTableName() + " (" + this.getFieldsName() + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (DBConnection dbConn = new DBConnection();
             Connection conn = dbConn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            for (int i = 0; i < values.length; i++) {
                stmt.setObject(i + 1, values[i]);
            }

            int affectedRows = stmt.executeUpdate(); 
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        // Obtém o ID gerado
                        int generatedId = generatedKeys.getInt(1);
                        // Atualiza o ID no objeto Sistema
                        ((Sistema) values[0]).setSistemaid(generatedId);  // Atribui o ID gerado
                    }
                }
            }
            return affectedRows;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    
    public int delete(Profissional profissional) {
        if (profissional.getProfissionalid() != 0) {
            String query = "DELETE FROM " + this.getTableName() + " WHERE " + this.getFieldKey() + " = ?";
            try (DBConnection dbConn = new DBConnection();
                 Connection conn = dbConn.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(query)) {

                stmt.setInt(1, profissional.getProfissionalid());
                return stmt.executeUpdate(); 
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }
    
    public int deleteById(int id) {
        String query = "DELETE FROM profissional WHERE id = ?";
        try (DBConnection dbConn = new DBConnection();
        		Connection conn = dbConn.getConnection();
        		 PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; 
        }
    }


    public ResultSet select(String where) {
        return super.select(where); 
    }

    public ArrayList<Profissional> findAll() {
        ResultSet rs = this.select("");
        ArrayList<Profissional> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Profissional profissional = new Profissional();
                profissional.setProfissionalid(rs.getInt("profissionalId"));
                profissional.setEstabelecimentoid(rs.getInt("estabelecimentoId"));
                profissional.setNome(rs.getString("nome"));
                profissional.setServico(rs.getString("servico"));
                profissional.setCep(rs.getString("cep"));
                profissional.setRua(rs.getString("rua"));
                profissional.setNumero(rs.getString("numero"));
                profissional.setComplemento(rs.getString("complemento"));
                profissional.setBairro(rs.getString("bairro"));
                profissional.setCidade(rs.getString("cidade"));
                profissional.setEstado(rs.getString("estado"));
                profissional.setFoto(rs.getString("foto"));
                list.add(profissional);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Profissional findById(int id) {
        System.out.println("Buscando profissional com ID: " + id);  // Log para verificar o ID

        // SQL para buscar o profissional pelo ID
        String sql = """
            SELECT profissionalId, estabelecimentoId, nome, servico, cep, rua, numero, complemento, bairro, cidade, estado, foto
            FROM profissional WHERE profissionalId = ?
        """;

        Profissional profissional = null;

        try (DBConnection dbConn = new DBConnection();
             Connection conn = dbConn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);  // Definindo o parâmetro ID na consulta
            ResultSet rs = stmt.executeQuery();  // Executando a consulta

            if (rs != null && rs.next()) {
                // Criando o objeto Profissional com os dados retornados
                profissional = new Profissional();
                profissional.setProfissionalid(rs.getInt("profissionalId"));
                profissional.setEstabelecimentoid(rs.getInt("estabelecimentoId"));
                profissional.setNome(rs.getString("nome"));
                profissional.setServico(rs.getString("servico"));
                profissional.setCep(rs.getString("cep"));
                profissional.setRua(rs.getString("rua"));
                profissional.setNumero(rs.getString("numero"));
                profissional.setComplemento(rs.getString("complemento"));
                profissional.setBairro(rs.getString("bairro"));
                profissional.setCidade(rs.getString("cidade"));
                profissional.setEstado(rs.getString("estado"));
                profissional.setFoto(rs.getString("foto"));
            } else {
                System.out.println("Profissional não encontrado para ID: " + id);  // Log se não encontrar
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return profissional;
    }

    
    public ResultSet select1(String where) {
        String query = "SELECT * FROM " + this.getTableName();
        if (!where.isEmpty()) {
            query += " WHERE " + where;
        }

        try (DBConnection dbConn = new DBConnection();
             Connection conn = dbConn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            return stmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}


