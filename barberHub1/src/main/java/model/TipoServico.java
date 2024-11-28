package model;

import java.util.Arrays;

public class TipoServico {
	private int tipoServicoId;
	private String servico;
	private String descricao;

	public TipoServico( int tipoServicoId, String servico, String descricao ) {
		this.setTiposervicoid( tipoServicoId );
		this.setServico( servico );
		this.setDescricao( descricao );
	}

	public TipoServico() {
		// TODO Auto-generated constructor stub
	}

	public String[] toArray() {
		return new String[] {
			String.valueOf(this.getTiposervicoid()),			
			String.valueOf(this.getServico()),			
			String.valueOf(this.getDescricao())
		};
	}

	public String toString() {
		return Arrays.toString(this.toArray());
	}

	public void setTiposervicoid(int tipoServicoId) {
		this.tipoServicoId = tipoServicoId;
	}

	public int getTiposervicoid() {
		return this.tipoServicoId;
	}

	public void setServico(String servico) {
		this.servico = servico;
	}

	public String getServico() {
		return this.servico;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}
}
