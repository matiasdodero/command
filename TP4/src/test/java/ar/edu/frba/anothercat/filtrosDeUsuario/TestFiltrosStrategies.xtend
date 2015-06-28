package ar.edu.frba.anothercat.filtrosDeUsuario

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.Date
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.CondicionPreexistente
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.tipoRutina
import ar.edu.frba.anothercat.beforeReceta.BeforeReceta
import ar.edu.frba.anothercat.observers.Consulta

class TestFiltrosStrategies {
	
	Usuario JoseCampanela
	Diabetico diabetico
	CondicionPreexistente hipertenso
	
	Repositorio_Receta Utilisima
	
	FiltroSobrepeso FSobrep
	FiltroBurgues FBurguez
	FiltroDisgusto Fdisgusto
	FiltroCondicionesPre FcondicionesP
	BeforeReceta todasMisRecetasdeTest
	
	Consulta ConsultaUser
	
	
@Before

	def void init(){
		
		todasMisRecetasdeTest = new BeforeReceta
		
		ConsultaUser = new Consulta
			
		diabetico = new Diabetico
		hipertenso = new Hipertenso
		  
		FSobrep = new FiltroSobrepeso
		FBurguez = new FiltroBurgues
		Fdisgusto = new FiltroDisgusto
		FcondicionesP = new FiltroCondicionesPre
		
		
		Utilisima = new Repositorio_Receta  => [
			agregarRecetasPublicas(todasMisRecetasdeTest.getCarneDulce())
			agregarRecetasPublicas(todasMisRecetasdeTest.getLechonsal)
			agregarRecetasPublicas(todasMisRecetasdeTest.getPolentadulce())
			agregarRecetasPublicas(todasMisRecetasdeTest.getAguita())
			
		]
		
		
		 JoseCampanela = new Usuario => [
	    	setNombre("Juan")
			fechaDeNacimiento = new Date(01-01-1987)
			peso=200
			altura=1.71
			sexo = "m"
			agregarPrefer(todasMisRecetasdeTest.getCarne())
			agregarPrefer(todasMisRecetasdeTest.getLechon())
			rutinaE = tipoRutina.PREINTENSIVO
			agregarReceta(todasMisRecetasdeTest.getMilapolentosa())
			
			agregarReceta(todasMisRecetasdeTest.getCaviarR())
		] 
		}
		
		@Test
			def void FiltroSobrepeso(){
				ConsultaUser.agregarFiltro(FSobrep)
		//		Receta 5 y 3 
				Assert.assertEquals(ConsultaUser.consultarRecetas(Utilisima,JoseCampanela).size(), 4)
				
			}
		@Test
			def void FiltroSBurgues(){
				ConsultaUser.agregarFiltro(FBurguez)
		//		Receta 2 y 6 
				Assert.assertEquals(ConsultaUser.consultarRecetas(Utilisima,JoseCampanela).size(), 4)
				
			}
		
		@Test
			def void FiltroDisgusto(){
				ConsultaUser.agregarFiltro(Fdisgusto)
				JoseCampanela.agregarDisgusto(todasMisRecetasdeTest.getAgua())
		//		Receta 1-3-4 
				Assert.assertEquals(ConsultaUser.consultarRecetas(Utilisima,JoseCampanela).size(), 3)
				
			}
		
		@Test
			def void FiltroCondicionesPreexistentes(){
				ConsultaUser.agregarFiltro(FcondicionesP)
				JoseCampanela.agregarCondicion(diabetico)
				JoseCampanela.agregarCondicion(hipertenso)
				
		//		Receta 1-2-3 
				Assert.assertEquals(ConsultaUser.consultarRecetas(Utilisima,JoseCampanela).size(), 3)
				
		}
		
		
		@Test
			def void FiltroTodosJuntos(){
				ConsultaUser.agregarFiltro(FcondicionesP)
				JoseCampanela.agregarCondicion(diabetico)
				JoseCampanela.agregarCondicion(hipertenso)
				ConsultaUser.agregarFiltro(Fdisgusto)
				JoseCampanela.agregarDisgusto(todasMisRecetasdeTest.getAgua())
				ConsultaUser.agregarFiltro(FBurguez)
				ConsultaUser.agregarFiltro(FSobrep)
		//		Receta 1-2-3 
				Assert.assertEquals(ConsultaUser.consultarRecetas(Utilisima,JoseCampanela).size(), 0)
				
			}
		
		
}