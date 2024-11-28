package model;

import java.sql.ResultSet;
import java.util.ArrayList;
import database.DBQuery;

public class EnderecoDAO extends DBQuery {

	public EnderecoDAO() {
		this.setTableName("endereco");
		this.setFieldsName("enderecoId, cep, rua, numero, complemento, bairro, cidade, estado");
		this.setFieldKey("enderecoId");
	}

	public int save(Endereco endereco) {
		if(endereco.getEnderecoid() >= 0) {
			return this.update(endereco.toArray());
		} else {
			return this.insert(endereco.toArray());
		}
	}

	public int delete(Endereco endereco) {
		if(endereco.getEnderecoid() != 0) {
			return this.delete(endereco.toArray());
		} else {
			return 0;
		}
	}

	public ResultSet select(String where) {
	    return super.select(where); // Chama o método select da classe base (DBQuery)
	}

	public ArrayList<Endereco> findAll() {
		ResultSet rs = this.select("");
		ArrayList<Endereco> list = new ArrayList<>();
		try {
			while (rs.next()) {
				Endereco endereco = new Endereco();
				endereco.setEnderecoid(rs.getInt("enderecoId"));
				endereco.setCep(rs.getString("cep"));
				endereco.setRua(rs.getString("rua"));
				endereco.setNumero(rs.getString("numero"));
				endereco.setComplemento(rs.getString("complemento"));
				endereco.setBairro(rs.getString("bairro"));
				endereco.setCidade(rs.getString("cidade"));
				endereco.setEstado(rs.getString("estado"));
				list.add(endereco);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Endereco findById(int id) {
		ResultSet rs = this.select("WHERE " + this.getFieldKey() + " = " + id);
		try {
			if (rs.next()) {
				Endereco endereco = new Endereco();
				endereco.setEnderecoid(rs.getInt("enderecoId"));
				endereco.setCep(rs.getString("cep"));
				endereco.setRua(rs.getString("rua"));
				endereco.setNumero(rs.getString("numero"));
				endereco.setComplemento(rs.getString("complemento"));
				endereco.setBairro(rs.getString("bairro"));
				endereco.setCidade(rs.getString("cidade"));
				endereco.setEstado(rs.getString("estado"));
				return endereco;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
