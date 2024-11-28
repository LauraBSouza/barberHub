package model;

import java.util.Arrays;

public class Endereco {
	private int enderecoId;
	private String cep;
	private String rua;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String estado;

	public Endereco( int enderecoId, String cep, String rua, String numero, String complemento, String bairro, String cidade, String estado ) {
		this.setEnderecoid( enderecoId );
		this.setCep( cep );
		this.setRua( rua );
		this.setNumero( numero );
		this.setComplemento( complemento );
		this.setBairro( bairro );
		this.setCidade( cidade );
		this.setEstado( estado );
	}

	public Endereco() {
		
	}

	public String[] toArray() {
		return new String[] {
			String.valueOf(this.getEnderecoid()),			
			String.valueOf(this.getCep()),			
			String.valueOf(this.getRua()),			
			String.valueOf(this.getNumero()),			
			String.valueOf(this.getComplemento()),			
			String.valueOf(this.getBairro()),			
			String.valueOf(this.getCidade()),			
			String.valueOf(this.getEstado())
		};
	}

	public String toString() {
		return Arrays.toString(this.toArray());
	}

	public void setEnderecoid(int enderecoId) {
		this.enderecoId = enderecoId;
	}

	public int getEnderecoid() {
		return this.enderecoId;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCep() {
		return this.cep;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getRua() {
		return this.rua;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getEstado() {
		return this.estado;
	}
}
