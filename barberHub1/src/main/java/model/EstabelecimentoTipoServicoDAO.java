package model;

import java.sql.*;
import java.util.List;

import database.DBConnection;

public class EstabelecimentoTipoServicoDAO {
    private DBConnection dbConnection;

    // Construtor para inicializar a conexão com o banco
    public EstabelecimentoTipoServicoDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    // Método para associar um tipo de serviço a um estabelecimento
    public void associarTipoServico(int idEstabelecimento, int idTipoServico) throws SQLException {
        String sql = "INSERT INTO EstabelecimentoTipoServico (estabelecimento_id, tipo_servico_id) VALUES (?, ?)";
        
        try (Connection connection = dbConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEstabelecimento);
            stmt.setInt(2, idTipoServico);
            stmt.executeUpdate();
        }
    }

    // Método para remover a associação entre um tipo de serviço e um estabelecimento
    public void removerAssociacao(int idEstabelecimento, int idTipoServico) throws SQLException {
        String sql = "DELETE FROM EstabelecimentoTipoServico WHERE estabelecimento_id = ? AND tipo_servico_id = ?";
        
        try (Connection connection = dbConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idEstabelecimento);
            stmt.setInt(2, idTipoServico);
            stmt.executeUpdate();
        }
    }
}