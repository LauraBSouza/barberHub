package model;

import java.util.Arrays;
import java.sql.Time;

public class Disponibilidade {
	private int disponibilidadeId;
	private int profissionalId;
	private String data;
	private Time horaInicio;
	private Time horaFim;
	private boolean em_agendamento;

	public Disponibilidade( int disponibilidadeId, int profissionalId, String data, Time horaInicio, Time horaFim, boolean em_agendamento ) {
		this.setDisponibilidadeid( disponibilidadeId );
		this.setProfissionalid( profissionalId );
		this.setData( data );
		this.setHorainicio( horaInicio );
		this.setHorafim( horaFim );
		this.setEm_agendamento( em_agendamento );
	}

	public Disponibilidade() {
		
	}

	public String[] toArray() {
		return new String[] {
			String.valueOf(this.getDisponibilidadeid()),			
			String.valueOf(this.getProfissionalid()),			
			String.valueOf(this.getData()),			
			String.valueOf(this.getHorainicio()),			
			String.valueOf(this.getHorafim()),			
			String.valueOf(this.getEm_agendamento())
		};
	}

	public String toString() {
		return Arrays.toString(this.toArray());
	}

	public void setDisponibilidadeid(int disponibilidadeId) {
		this.disponibilidadeId = disponibilidadeId;
	}

	public int getDisponibilidadeid() {
		return this.disponibilidadeId;
	}

	public void setProfissionalid(int profissionalId) {
		this.profissionalId = profissionalId;
	}

	public int getProfissionalid() {
		return this.profissionalId;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getData() {
		return this.data;
	}

	public void setHorainicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}

	public Time getHorainicio() {
		return this.horaInicio;
	}

	public void setHorafim(Time horaFim) {
		this.horaFim = horaFim;
	}

	public Time getHorafim() {
		return this.horaFim;
	}

	public void setEm_agendamento(boolean em_agendamento) {
		this.em_agendamento = em_agendamento;
	}

	public boolean getEm_agendamento() {
		return this.em_agendamento;
	}
}
