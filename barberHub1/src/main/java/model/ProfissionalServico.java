package model;

import java.util.Arrays;

public class ProfissionalServico {
	private Profissional profissional;
	private Servico servico;

	public ProfissionalServico( Profissional Profissional, Servico servico ) {
		this.setProfissional( Profissional );
		this.setServico( servico );
	}

	public ProfissionalServico() {
		
	}

	public String[] toArray() {
		return new String[] {
			String.valueOf(this.getProfissional()),			
			String.valueOf(this.getServico())
		};
	}

	public String toString() {
		return Arrays.toString(this.toArray());
	}

	public void setProfissional(Profissional profissional) {
		this.profissional = profissional;
	}

	public Profissional getProfissional() {
		return this.profissional;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Servico getServico() {
		return this.servico;
	}
}
