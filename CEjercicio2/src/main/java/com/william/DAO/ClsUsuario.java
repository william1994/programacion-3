package com.william.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.william.Conexion.ConexionBd;
import com.william.entidades.usuario;

public class ClsUsuario {
	ConexionBd conexion = new ConexionBd();
	Connection con = conexion.RetornarConexion();

	public ArrayList<usuario> ListadoUSUARIOS() {
		ArrayList<usuario> Lista = new ArrayList<>();

		try {

			CallableStatement consulta = con.prepareCall("call SP_S_SOLOUSUARIOS()");
			ResultSet rs = consulta.executeQuery();
			while (rs.next()) {
				usuario user = new usuario();
				user.setIdUsuario(rs.getInt("idUsuario"));
				user.setUsuario(rs.getString("Usuario"));
				user.setPass(rs.getString("PassWord"));
				user.setIdTipoUsuario(rs.getInt("tipoUsuario"));
				Lista.add(user);
			}
		} catch (Exception e) {
			// JOptionPane.showMessageDialog(null, "Ha ocurrido un error en: \n\n\n\n" + e);
		}

		return Lista;
	}

	public void Eliminar(usuario user) {

		try {
			CallableStatement consulta = con.prepareCall("call SP_D_USUER(?)");
			consulta.setInt("pIdUsuario", user.getIdUsuario());
			consulta.executeQuery();
			System.out.println("Exito");
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void ActualizarUsuario(usuario user) {

		try {
			CallableStatement consulta = con.prepareCall("call SP_U_USUARIO(?,?,?)");
			consulta.setString("PUsuario", user.getUsuario());
			consulta.setString("PPass", user.getPass());
			consulta.setInt("PidUsuario", user.getIdUsuario());
			consulta.executeQuery();
			System.out.println("Exito");
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
