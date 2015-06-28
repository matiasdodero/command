package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.receta.Receta
import org.eclipse.xtend.lib.annotations.Accessors



@Accessors
class MonitorConsultas {
	
	
	RecetaMasConsultadaObserver recetaMasConsultada = new RecetaMasConsultadaObserver
	CantidadDeConsultaPorHoraDelDiaObserver consultasPorHora = new CantidadDeConsultaPorHoraDelDiaObserver
	CantidadVeganoConsultaRecetasDificilesObserver consultaVeganos = new CantidadVeganoConsultaRecetasDificilesObserver
	RecetaMasConsultadaEnBaseAlSexoObserver consultasPorSexo = new RecetaMasConsultadaEnBaseAlSexoObserver


	def Iterable<Receta> buscarRecetaMasConsultada() {
		
	recetaMasConsultada.recetasConsultadas.sortBy[-recetaMasConsultada.contadorRecetasConsultadas].take(1)

	}
	
	def int cantidadConsultasPorHoraDelDia(int hora){				
	return consultasPorHora.cantidadRecetasPorHora.filter[unaHora | unaHora==hora].size()
	}
	
	def int cantidadConsultasDificilesDeVeganos(){		
		return consultaVeganos.recetasVeganos.size()
	}
	
	def int cantidadDeConsultasPorSexo(String sexo){
		
		if(sexo.equals("h")){
			return consultasPorSexo.cantidadRecetasHombres.size()
		}
		else (sexo.equals("m")){
		return consultasPorSexo.cantidadRecetasMujeres.size()
		}
	}

}