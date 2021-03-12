package com.william.negocio;

import com.william.entidades.Loguin;

public class clsLoguin {
	

	public int acceso(Loguin log) {
		int acceso=0;
		if(log.getUser().equals("william") && log.getPass().equals("123"))
		{
			acceso =1;
		}
		
		return acceso;
	}
}
