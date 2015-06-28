package ar.edu.frba.anothercat.usuario

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.Date
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.creacionales.RecetaBuilder

class TestRepoSugerimeReceta {
	Usuario JoseCampanela
	Usuario  Mbaracus
	Usuario Tiesto
	Ingrediente agua
	Ingrediente carne
	Ingrediente polenta
	Ingrediente lechon
	Receta receta1
	Receta receta2
	Receta receta3
	Receta receta4
	Diabetico diabetico
	
	Repositorio_Receta Utilisima
	
	Grupo Cocinga
	
@Before

	def void init(){
		
	 diabetico = new Diabetico 
	
		carne = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(200)
			setSosCaro(false)
		]

		agua= new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(20)
			setSosCaro(false)
		]
		
		polenta = new Ingrediente => [
			setNombreIngrediente("polenta")
			setCalorias(20)
			setSosCaro(false)
		]
		
		lechon = new Ingrediente => [
			setNombreIngrediente("lechon")
			setCalorias(20)
			setSosCaro(false)
		]
		
		
		receta1 = new	RecetaBuilder().
						agregarNombre("carneDulce").
						agregarCalorias(300).
						agregarEstado(estadoReceta.Publica).
						agregarIngrediente(carne).
						agregarIngrediente(agua).
						agregarCondimentoNuevo("azucar",200).
						build()
		
		receta2 = new 	RecetaBuilder().
						agregarNombre("lechonsal").
						agregarCalorias(100).
						agregarEstado(estadoReceta.Publica).
						agregarIngrediente(lechon).
						agregarIngrediente(polenta).
						agregarCondimentoNuevo("sal",200).
						build()
		
		
		receta3 = new 	RecetaBuilder().
						agregarNombre("polenta dulce").
						agregarCalorias(501).
						agregarEstado(estadoReceta.Publica).
						agregarIngrediente(agua).
						agregarIngrediente(polenta).
						agregarCondimentoNuevo("azucar",200).
						build()
		
		receta4 = new 	RecetaBuilder().
						agregarNombre("aguita").
						agregarCalorias(11).
						agregarEstado(estadoReceta.Compartida).
						agregarIngrediente(agua).
						build()
		
		Utilisima = new Repositorio_Receta  => [
			agregarRecetasPublicas(receta1)
			agregarRecetasPublicas(receta2)
			agregarRecetasPublicas(receta3)
			agregarRecetasPublicas(receta4)
		]
		
		Cocinga = new Grupo => [
			setNombre("cocinga")
		]
		
		 JoseCampanela = new Usuario => [
	    	setNombre("Juan")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(carne)
			agregarPrefer(lechon)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
			 Mbaracus = new Usuario => [
	    	setNombre("Marito")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=100
			altura=1.80
			sexo = "m"
			agregarPrefer(agua)
			agregarPrefer(polenta)
			rutinaE = tipoRutina.NADA
		] 
		
			Tiesto = new Usuario => [
	    	setNombre("Tiesto")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=70
			altura=1.70
			sexo = "m"
			agregarPrefer(agua)
			rutinaE = tipoRutina.NADA
		] 
		
	}
		@Test
		def void sugerimeRecetasalUserSinDisgustosNiProblemas(){
			
			
		Assert.assertEquals(Utilisima.sugerirRecetaA(JoseCampanela).size(), 4)
			
		}
		
		@Test
		def void sugerimeRecetasalUserConDisgustosSinProblemas(){
		JoseCampanela.agregarDisgusto(carne)	
		Assert.assertEquals(Utilisima.sugerirRecetaA(JoseCampanela).size(), 3)
			
			
		}
		
		@Test
		def void sugerimeRecetasalUserConDisgustosConProblemas(){
		JoseCampanela.agregarDisgusto(carne)
		JoseCampanela.agregarCondicion(diabetico)	
		Assert.assertEquals(Utilisima.sugerirRecetaA(JoseCampanela).size(), 2)
			
		}
		@Test
		def void sugerimeRecetasalGrupoConGenteConDisgustosPrecond(){
		Cocinga.agregarUsuario(Mbaracus)
		Cocinga.agregarUsuario(Tiesto)
		Mbaracus.agregarDisgusto(carne)
		Tiesto.agregarCondicion(diabetico)	
		Assert.assertEquals(Utilisima.sugerirRecetaGrupo(Cocinga).size(), 2)
			
		}
		
			@Test
		def void sugerimeRecetasalGrupo(){
		Cocinga.agregarUsuario(Mbaracus)
		Cocinga.agregarUsuario(Tiesto)
		Assert.assertEquals(Utilisima.sugerirRecetaGrupo(Cocinga).size(), 4)
			
		}
	}