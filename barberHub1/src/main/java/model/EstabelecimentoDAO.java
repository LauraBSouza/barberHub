package model;

import java.sql.ResultSet;
import java.util.ArrayList;
import database.DBQuery;

public class EstabelecimentoDAO extends DBQuery {

	public EstabelecimentoDAO() {
		this.setTableName("estabelecimento");
		this.setFieldsName("estabelecimentoId, nome, email, senha, telefone, cep, rua, numero, complemento, bairro, cidade, estado, statusCadastroId, dataCadastro, foto");
		this.setFieldKey("estabelecimentoId");
	}

	public int save(Estabelecimento estabelecimento) {
		if(estabelecimento.getEstabelecimentoid() >= 0) {
			return this.update(estabelecimento.toArray());
		} else {
			return this.insert(estabelecimento.toArray());
		}
	}

	public int delete(Estabelecimento estabelecimento) {
		if(estabelecimento.getEstabelecimentoid() != 0) {
			return this.delete(estabelecimento.toArray());
		} else {
			return 0;
		}
	}

	public ResultSet select(String where) {
	    return super.select(where); // Chama o método select da classe base (DBQuery)
	}

	public ArrayList<Estabelecimento> findAll() {
		ResultSet rs = this.select("");
		ArrayList<Estabelecimento> list = new ArrayList<>();
		try {
			while (rs.next()) {
				Estabelecimento estabelecimento = new Estabelecimento();
				estabelecimento.setEstabelecimentoid(rs.getInt("estabelecimentoId"));
				estabelecimento.setNome(rs.getString("nome"));
				estabelecimento.setEmail(rs.getString("email"));
				estabelecimento.setSenha(rs.getString("senha"));
				estabelecimento.setTelefone(rs.getString("telefone"));
				estabelecimento.setCep(rs.getString("cep"));
				estabelecimento.setRua(rs.getString("rua"));
				estabelecimento.setNumero(rs.getString("numero"));
				estabelecimento.setComplemento(rs.getString("complemento"));
				estabelecimento.setBairro(rs.getString("bairro"));
				estabelecimento.setCidade(rs.getString("cidade"));
				estabelecimento.setEstado(rs.getString("estado"));
				estabelecimento.setStatuscadastroid(rs.getInt("statusCadastroId"));
				estabelecimento.setDatacadastro(rs.getString("dataCadastro"));
				estabelecimento.setFoto(rs.getString("foto"));
				list.add(estabelecimento);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Estabelecimento findById(int id) {
		ResultSet rs = this.select("WHERE " + this.getFieldKey() + " = " + id);
		try {
			if (rs.next()) {
				Estabelecimento estabelecimento = new Estabelecimento();
				estabelecimento.setEstabelecimentoid(rs.getInt("estabelecimentoId"));
				estabelecimento.setNome(rs.getString("nome"));
				estabelecimento.setEmail(rs.getString("email"));
				estabelecimento.setSenha(rs.getString("senha"));
				estabelecimento.setTelefone(rs.getString("telefone"));
				estabelecimento.setCep(rs.getString("cep"));
				estabelecimento.setRua(rs.getString("rua"));
				estabelecimento.setNumero(rs.getString("numero"));
				estabelecimento.setComplemento(rs.getString("complemento"));
				estabelecimento.setBairro(rs.getString("bairro"));
				estabelecimento.setCidade(rs.getString("cidade"));
				estabelecimento.setEstado(rs.getString("estado"));
				estabelecimento.setStatuscadastroid(rs.getInt("statusCadastroId"));
				estabelecimento.setDatacadastro(rs.getString("dataCadastro"));
				estabelecimento.setFoto(rs.getString("foto"));
				return estabelecimento;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Estabelecimento> findByTipoServico(int tipoServicoId) {
	    // Ajuste a consulta para atender à estrutura do seu banco de dados
	    String where = "INNER JOIN estabelecimentoServico es ON estabelecimento.estabelecimentoId = es.estabelecimentoId " +
	                   "WHERE es.tipoServicoId = " + tipoServicoId;

	    ResultSet rs = this.select(where); // Reutilizando o método select da classe base
	    ArrayList<Estabelecimento> list = new ArrayList<>();

	    try {
	        while (rs.next()) {
	            Estabelecimento estabelecimento = new Estabelecimento();
	            estabelecimento.setEstabelecimentoid(rs.getInt("estabelecimentoId"));
	            estabelecimento.setNome(rs.getString("nome"));
	            estabelecimento.setEmail(rs.getString("email"));
	            estabelecimento.setSenha(rs.getString("senha"));
	            estabelecimento.setTelefone(rs.getString("telefone"));
	            estabelecimento.setCep(rs.getString("cep"));
	            estabelecimento.setRua(rs.getString("rua"));
	            estabelecimento.setNumero(rs.getString("numero"));
	            estabelecimento.setComplemento(rs.getString("complemento"));
	            estabelecimento.setBairro(rs.getString("bairro"));
	            estabelecimento.setCidade(rs.getString("cidade"));
	            estabelecimento.setEstado(rs.getString("estado"));
	            estabelecimento.setStatuscadastroid(rs.getInt("statusCadastroId"));
	            estabelecimento.setDatacadastro(rs.getString("dataCadastro"));
	            estabelecimento.setFoto(rs.getString("foto"));
	            list.add(estabelecimento);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
