package ar.edu.frba.anothercat.usuario

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.Date
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarAlfabeticamente
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarCalorias
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.filtrosDeUsuario.PrimerosN
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.creacionales.RecetaBuilder

class TestRepoUsuario {
	Usuario JoseCampanela
	Usuario szifron
	Usuario tinelli
	
	Ingrediente ingrediente1
	Ingrediente ingrediente4
	
	Repositorio_Receta Utilisima
	
	RepoUsuarios unRepoUsuario
	
	OrdenarAlfabeticamente OrdAlf
	OrdenarCalorias OrdCal
	Pares misPares
	PrimerosN misPrimN
	
	Receta receta1
	Receta receta2
	Receta receta3
	Receta receta4
	Receta receta5
	Receta receta6
	Receta receta7
	Receta receta8
	Receta receta9
	Receta receta10
	Receta receta11
	Receta receta12
	Receta receta13
	Receta receta14
	Receta receta15
	Receta receta16
	Receta receta17
	Receta receta18
	Receta receta19
	Receta receta20
	
	Diabetico diabetico
	Hipertenso hipertenso
	Vegano vegano
	
	Grupo ConcinerosArgentinos
	
	
	
	@Before
	def void init(){
		
	 diabetico = new Diabetico 
	
	 hipertenso = new Hipertenso 
	
	 vegano = new Vegano
	 
	 OrdAlf = new OrdenarAlfabeticamente
		
	 OrdCal = new OrdenarCalorias
		
		misPares = new Pares
	 
		misPrimN = new PrimerosN
		
		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(200)
			setSosCaro(false)
		]
		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("lechon")
			setCalorias(20)
			setSosCaro(false)
		]
		
		receta1 = new 	RecetaBuilder().
			 			agregarNombre("carne con polenta").
						agregarCalorias(100).
						agregarIngredienteNuevo("carne","tipo",200,false).
						agregarIngredienteNuevo("polenta","tipo",20,false).
						agregarCondimentoNuevo("azucar",200).
						agregarEstado(estadoReceta.Publica).
						build()
			
		receta2 = new   RecetaBuilder().
				 		agregarNombre("agua salada").
						agregarCalorias(300).
						agregarIngredienteNuevo("agua","tipo",20,false).
						agregarCondimentoNuevo("sal",200).
						agregarEstado(estadoReceta.Publica).
						build()
		receta3 = new   RecetaBuilder().
				 		agregarNombre("carne polenta solita").
						agregarCalorias(300).
						agregarIngredienteNuevo("carne","tipo",200,false).
						agregarIngredienteNuevo("polenta","tipo",20,false).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta4 = new 	RecetaBuilder().
				 		agregarNombre("carne con lechon").
						agregarCalorias(250).
						agregarIngredienteNuevo("carne","tipo",200,false).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarEstado(estadoReceta.Publica).
						build()
		receta5 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano").
						agregarCalorias(150).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		
		receta6 = new 	RecetaBuilder().
				 		agregarNombre("harina").
				 		agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCalorias(600).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		receta7 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano2").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta8 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 3").
						agregarCalorias(200).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta9 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 4").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta10 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 5").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta11 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 6").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta12 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 7").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		
		receta13 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 8").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		
		receta14 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 9").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta15 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 10").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		receta16 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 11").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()

		receta17 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 12").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta18 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 13").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta19 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 14").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		receta20 = new 	RecetaBuilder().
				 		agregarNombre("lechon romano 15").
						agregarCalorias(100).
						agregarIngredienteNuevo("lechon","tipo",20,false).
						agregarCondimentoNuevo("harina",200).
						agregarEstado(estadoReceta.Publica).
						build()
		
		ConcinerosArgentinos = new Grupo =>[
			setNombre("PinPals")
		]
		
		 JoseCampanela = new Usuario => [
	    	setNombre("Juan")
	    	fechaDeNacimiento = new Date(01-01-1987)
	    	agregarCondicion(diabetico)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(ingrediente1)
			agregarPrefer(ingrediente4)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
		
		szifron = new Usuario => [
	    	setNombre("Juan")
			fechaDeNacimiento = new Date(01-01-1987)
	    	agregarCondicion(diabetico)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(ingrediente1)
			agregarPrefer(ingrediente4)
			rutinaE = tipoRutina.PREINTENSIVO
		]
		
		tinelli = new Usuario => [
	    	setNombre("Marcelo")
			fechaDeNacimiento = new Date(01-01-1987)
	    	agregarCondicion(diabetico)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(ingrediente1)
			agregarPrefer(ingrediente4)
			rutinaE = tipoRutina.PREINTENSIVO
		]  
		Utilisima  = new Repositorio_Receta
		
		Utilisima.agregarRecetasPublicas(receta1)
		Utilisima.agregarRecetasPublicas(receta2)
		Utilisima.agregarRecetasPublicas(receta3)
		Utilisima.agregarRecetasPublicas(receta4)
		Utilisima.agregarRecetasPublicas(receta5)
		Utilisima.agregarRecetasPublicas(receta6)
		Utilisima.agregarRecetasPublicas(receta7)
		Utilisima.agregarRecetasPublicas(receta8)
		Utilisima.agregarRecetasPublicas(receta9)
		Utilisima.agregarRecetasPublicas(receta10)
		Utilisima.agregarRecetasPublicas(receta11)
		Utilisima.agregarRecetasPublicas(receta12)
		Utilisima.agregarRecetasPublicas(receta13)
		Utilisima.agregarRecetasPublicas(receta14)
		Utilisima.agregarRecetasPublicas(receta15)
		Utilisima.agregarRecetasPublicas(receta16)
		Utilisima.agregarRecetasPublicas(receta17)
		Utilisima.agregarRecetasPublicas(receta18)
		Utilisima.agregarRecetasPublicas(receta19)
		Utilisima.agregarRecetasPublicas(receta20)
		
		unRepoUsuario = new RepoUsuarios
		
		
	}
	
	@Test
	def void TP3punto1AgregarUsuarioPendiente(){

	unRepoUsuario.add(JoseCampanela)

    Assert.assertEquals(3,unRepoUsuario.getUsuarios.size)
	
	}
	

	@Test
	def void TP3punto1BorrarUsuariosPendiente(){

	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.remove(JoseCampanela)
	
    Assert.assertEquals(2,unRepoUsuario.getUsuarios.size)
    
	}	
	
	@Test
	def void TP3punto1getUsuariosPendiente(){

    Assert.assertEquals(2,unRepoUsuario.getUsuarios.size)	
	
	}
	
		
    @Test
	def void TP3punto1getUsuarios(){ 
		
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	Assert.assertEquals(unRepoUsuario.get(JoseCampanela),JoseCampanela)	
	
	}
	
	@Test
	def void TP3punto1getUsuariosSinAgregarlo(){ 
	
	unRepoUsuario.add(JoseCampanela)
	
	Assert.assertEquals(unRepoUsuario.get(JoseCampanela),null)	

	
	}
	
	@Test
	def void TP3punto1ListarUsuariosPorNombre(){ 
	
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	
	Assert.assertEquals(1,unRepoUsuario.list(JoseCampanela).size)	

	}
	
	@Test
	def void TP3punto1ListarUsuariosPorNombreQueNoExisten(){ 
	
	unRepoUsuario.add(JoseCampanela)

	Assert.assertEquals(0,unRepoUsuario.list(JoseCampanela).size)	

	}

	@Test
	def void TP3punto1ListarUsuariosTodo(){ 
	
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.add(szifron)
	unRepoUsuario.add(tinelli)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	unRepoUsuario.aceptarUsuario(szifron)
	unRepoUsuario.aceptarUsuario(tinelli)
	
	Assert.assertEquals(2,unRepoUsuario.list(szifron).size)	

	}
	
	@Test
	def void TP3punto1PasarUsuariosDePendientesAAceptados(){
		
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	
	Assert.assertEquals(2,unRepoUsuario.getUsuarios.size)
	Assert.assertEquals(1,unRepoUsuario.getAceptados.size)
	
	
	}
	
	@Test
	def void TP3punto1PasarUsuariosDePendientesARechazados(){
		
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.rechazarUsuario(JoseCampanela,"es descortes")
	
	Assert.assertEquals(2,unRepoUsuario.getUsuarios.size)
	Assert.assertEquals(1,unRepoUsuario.getRechazados.size)
	
	
	}
	
	@Test
	def void TP3punto1PasarUsuariosDeAceptadosARechazados(){
		
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	unRepoUsuario.echarUsuario(JoseCampanela,"es maleducado")
	
	Assert.assertEquals(2,unRepoUsuario.getUsuarios.size)
	Assert.assertEquals(1,unRepoUsuario.getRechazados.size)
	
	
	}
	
	@Test
	def void TP3punto1PasarUsuariosDeRechazadosAPendientes(){
		
	unRepoUsuario.add(JoseCampanela)
	unRepoUsuario.aceptarUsuario(JoseCampanela)
	unRepoUsuario.echarUsuario(JoseCampanela,"es insolente")
	unRepoUsuario.reabilitarUsuario(JoseCampanela)
	
	Assert.assertEquals(3,unRepoUsuario.getUsuarios.size)
	Assert.assertEquals(0,unRepoUsuario.getRechazados.size)
	
	
	}
		
}

