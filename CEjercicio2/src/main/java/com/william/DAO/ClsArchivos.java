package com.william.DAO;

import java.sql.PreparedStatement;

import com.william.Conexion.ConexionBd;

public class ClsArchivos {
	
	public void guardararchivos(String nombre) {
		try {
			
		
		ConexionBd con = new ConexionBd();
		PreparedStatement stm;
		String consultad = "insert into imagen(Nombrearchivo) values(?)";
		
		stm = con.RetornarConexion().prepareStatement(consultad);
		stm.setString(1, nombre);
		stm.executeUpdate();
		
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}
	

}
