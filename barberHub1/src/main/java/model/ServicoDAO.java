package model;

import java.sql.ResultSet;
import java.util.ArrayList;
import database.DBQuery;

public class ServicoDAO extends DBQuery {

	public ServicoDAO() {
		this.setTableName("servico");
		this.setFieldsName("servicoId, nome, descricao, tipoServicoId, preco, duracao");
		this.setFieldKey("servicoId");
	}

	public int save(Servico servico) {
		if(servico.getServicoId() >= 0) {
			return this.update(servico.toArray());
		} else {
			return this.insert(servico.toArray());
		}
	}

	public int delete(Servico servico) {
		if(servico.getServicoId() != 0) {
			return this.delete(servico.toArray());
		} else {
			return 0;
		}
	}

	public ResultSet select(String where) {
	    return super.select(where); // Chama o método select da classe base (DBQuery)
	}

	public ArrayList<Servico> findAll() {
		ResultSet rs = this.select("");
		ArrayList<Servico> list = new ArrayList<>();
		try {
			while (rs.next()) {
				Servico servico = new Servico();
				servico.getTipoServico().setTiposervicoid(rs.getInt("servicoId"));
				servico.setNome(rs.getString("nome"));
				servico.setDescricao(rs.getString("descricao"));
				servico.getTipoServico().setTiposervicoid(rs.getInt("tipoServicoId"));
				servico.setPreco(rs.getDouble("preco"));
				servico.setDuracao(rs.getInt("duracao"));
				list.add(servico);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Servico findById(int id) {
		ResultSet rs = this.select("WHERE " + this.getFieldKey() + " = " + id);
		try {
			if (rs.next()) {
				Servico servico = new Servico();
				servico.getTipoServico().setTiposervicoid(rs.getInt("servicoId"));
				servico.setNome(rs.getString("nome"));
				servico.setDescricao(rs.getString("descricao"));
				servico.getTipoServico().setTiposervicoid(rs.getInt("tipoServicoId"));
				servico.setPreco(rs.getDouble("preco"));
				servico.setDuracao(rs.getInt("duracao"));
				return servico;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
