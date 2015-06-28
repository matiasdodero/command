package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.receta.Condimento

import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.CondicionPreexistente
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.Vegano
import java.util.ArrayList
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.Date
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroSobrepeso
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarCalorias
import ar.edu.frba.anothercat.creacionales.RecetaBuilder
import ar.edu.frba.anothercat.receta.estadoReceta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestObserver {
	Receta receta1
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	Ingrediente ingrediente3
	Ingrediente ingrediente4
	Ingrediente ingrediente5
	Ingrediente ingrediente6
	Ingrediente ingrediente7

	Receta receta3
	Receta receta2
	Receta receta4
	Receta receta5
	Receta receta6
	Receta receta7

	Usuario matias
	Usuario daniel

	List<Receta> recetas = new ArrayList<Receta>

	//RecetaSimple recetaPure
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	Condimento condimento4
	Condimento condimento5
	Condimento condimento6

	Hipertenso hiperten
	Vegano vegano
	Diabetico diab

	Consulta consulta1

	CantidadDeConsultaPorHoraDelDiaObserver observerCantidadPorHora
	RecetaMasConsultadaObserver observerRecetaMasConsultada

	Repositorio_Receta repo1

	RecetaMasConsultadaEnBaseAlSexoObserver observerRecetasPorSexo

	CantidadVeganoConsultaRecetasDificilesObserver observerVeganos

	MonitorConsultas monitor

	FiltroSobrepeso filtroSobrepeso

	OrdenarCalorias ordenarCalorias
//@Before
//	def void init() {
//	
//		
//		vegano = new Vegano	
//		matias = new Usuario => [
//			setNombre("matias")
//			fechaDeNacimiento = new Date(01 - 01 - 1987)
//			//	    	rutina = "dsad"
//			peso = 50
//			altura = 1.71
//			setSexo("h")
//			//	agregarCondicion(hiperten) 
//			agregarCondicion(vegano)
//			//	agregarPrefer(pollo)
//			//	agregarPrefer(carne)
//			agregarDisgusto(ingrediente3)
//		]
//
//		daniel = new Usuario => [
//			setNombre("daniel")
//			fechaDeNacimiento = new Date(01 - 01 - 1987)
//			//	    	rutina = "dsad"
//			peso = 50
//			altura = 1.71
//			setSexo("h")
//			//	agregarCondicion(hiperten) 
//			//	agregarCondicion(diabe)
//			//	agregarCondicion(vegano) 
//			//	agregarPrefer(pollo)
//			//	agregarPrefer(carne)
//			agregarDisgusto(ingrediente3)
//		]
//
//		repo1 = new Repositorio_Receta
//
//		ingrediente1 = new Ingrediente => [
//			setNombreIngrediente("carne")
//			setCalorias(10)
//		]
//
//		ingrediente2 = new Ingrediente => [
//			setNombreIngrediente("agua")
//			setCalorias(15)
//		]
//
//		ingrediente3 = new Ingrediente => [
//			setNombreIngrediente("pure")
//			setCalorias(20)
//		]
//
//		ingrediente4 = new Ingrediente => [
//			setNombreIngrediente("pollo")
//			setCalorias(25)
//		]
//
//		ingrediente5 = new Ingrediente => [
//			setNombreIngrediente("pescado")
//			setCalorias(30)
//		]
//
//		ingrediente6 = new Ingrediente => [
//			setNombreIngrediente("berenjena")
//			setCalorias(35)
//		]
//
//		ingrediente7 = new Ingrediente => [
//			setNombreIngrediente("pan")
//			setCalorias(40)
//		]
//
//		condimento1 = new Condimento => [
//			setNombreCondimento("azucar")
//			setCantidad(110)
//		]
//
//		condimento2 = new Condimento => [
//			setNombreCondimento("sal")
//			setCantidad(15)
//		]
//
//		condimento3 = new Condimento => [
//			setNombreCondimento("aceite")
//			setCantidad(150)
//		]
//
//		condimento4 = new Condimento => [
//			setNombreCondimento("vinagre")
//			setCantidad(150)
//		]
//
//		condimento5 = new Condimento => [
//			setNombreCondimento("harina")
//			setCantidad(150)
//		]
//
//		condimento6 = new Condimento => [
//			setNombreCondimento("levadura")
//			setCantidad(150)
//		]
//
//		hiperten = new Hipertenso
//		
//		diab = new Diabetico
//
//		receta1 = new Receta
//		receta2 = new Receta
//		receta3 = new Receta
//		receta4 = new Receta
//		receta5 = new Receta
//		receta6 = new Receta
//		receta7 = new Receta
//
//		receta1 => [
//			agregarIngrediente(ingrediente1)
//			agregarIngrediente(ingrediente2)
//			agregarCondimento(condimento1)
//			sumarCalorias(ingrediente1.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta3 => [
//			agregarIngrediente(ingrediente3)
//			agregarIngrediente(ingrediente4)
//			agregarCondimento(condimento2)
//			sumarCalorias(ingrediente3.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta2 => [
//			agregarIngrediente(ingrediente5)
//			agregarCondimento(condimento3)
//			agregarCondimento(condimento4)
//			sumarCalorias(ingrediente5.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta4 => [
//			agregarIngrediente(ingrediente6)
//			agregarCondimento(condimento1)
//			sumarCalorias(ingrediente6.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta5 => [
//			agregarIngrediente(ingrediente7)
//			agregarCondimento(condimento6)
//			sumarCalorias(ingrediente7.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta6 => [
//			agregarIngrediente(ingrediente1)
//			agregarIngrediente(ingrediente2)
//			agregarCondimento(condimento4)
//			agregarCondimento(condimento5)
//			sumarCalorias(ingrediente7.calorias)
//			setDificultad("d")
//			validar()
//		]
//
//		receta7 => [
//			setDificultad("d")
//		]
//
//		repo1 => [
//			agregarRecetasPublicas(receta1)
//			agregarRecetasPublicas(receta2)
//			agregarRecetasPublicas(receta3)
//			agregarRecetasPublicas(receta4)
//			agregarRecetasPublicas(receta5)
//			agregarRecetasPublicas(receta6)
//		]
//
//		recetas.add(receta1)
//		recetas.add(receta2)
//		recetas.add(receta3)
//		recetas.add(receta4)
//		recetas.add(receta5)
//		recetas.add(receta6)
//		recetas.add(receta7)
//
//		observerCantidadPorHora = new CantidadDeConsultaPorHoraDelDiaObserver
//
//		observerRecetaMasConsultada = new RecetaMasConsultadaObserver
//
//		observerRecetasPorSexo = new RecetaMasConsultadaEnBaseAlSexoObserver
//
//		observerVeganos = new CantidadVeganoConsultaRecetasDificilesObserver =>[
//			setVegano=vegano
//		]
//
//		filtroSobrepeso = new FiltroSobrepeso
//
//		ordenarCalorias = new OrdenarCalorias
//
//		consulta1 = new Consulta => [
//			agregarObserver(observerCantidadPorHora)
//			agregarObserver(observerRecetaMasConsultada)
//			agregarObserver(observerRecetasPorSexo)
//			agregarObserver(observerVeganos)
//			agregarFiltro(filtroSobrepeso)
//			agregarProcesamientoPosterior(ordenarCalorias)
//		]
//
//		monitor = new MonitorConsultas => [
//			//setUnaConsulta=consulta1
//			setRecetaMasConsultada(observerRecetaMasConsultada)
//			setConsultasPorHora(observerCantidadPorHora)
//			setConsultaVeganos(observerVeganos)
//			setConsultasPorSexo(observerRecetasPorSexo)
//		]
//		consulta1.consultarRecetas(repo1, matias)
//		
//
//	}
	@Before
	def void init() {
	
		
		vegano = new Vegano	
		matias = new Usuario => [
			setNombre("matias")
			fechaDeNacimiento = new Date(01 - 01 - 1987)
			//	    	rutina = "dsad"
			peso = 50
			altura = 1.71
			setSexo("h")
			agregarCondicion(vegano)
			agregarDisgusto(ingrediente3)
		]

		daniel = new Usuario => [
			setNombre("daniel")
			fechaDeNacimiento = new Date(01 - 01 - 1987)
			//	    	rutina = "dsad"
			peso = 50
			altura = 1.71
			setSexo("h")
			agregarDisgusto(ingrediente3)
		]
//
		repo1 = new Repositorio_Receta

		hiperten = new Hipertenso
		
		diab = new Diabetico

		 receta1 = new RecetaBuilder().
		 				agregarNombre("carneDulce").
							agregarCalorias(10).
							agregarIngredienteNuevo("carne","tipo",10,false).
							agregarIngredienteNuevo("agua","tipo",15,false).
							agregarCondimentoNuevo("azucar",110).
							agregarDifcultad("d").
							build()
		 
		receta2 = new 	RecetaBuilder().
			 			agregarNombre("BerenjenaDulces").
						agregarCalorias(20).
						agregarIngredienteNuevo("pescado","tipo",30,false).
						agregarCondimentoNuevo("aceite",150).
						agregarCondimentoNuevo("vinagre",150).
						agregarDifcultad("d").
						build()
		
		receta3 =  new 	RecetaBuilder().
			 			agregarNombre("Pollo Con Pure").
						agregarCalorias(20).
						agregarIngredienteNuevo("pure","tipo",20,false).
						agregarIngredienteNuevo("pollo","tipo",25,false).
						agregarCondimentoNuevo("sal",15).
						agregarDifcultad("d").
						build()
						
		ingrediente3 = new Ingrediente => [
			setNombreIngrediente("pure")
			setCalorias(20)
		]
		
		receta4 = new 	RecetaBuilder().
			 			agregarNombre("Berenjena Dulce ").
						agregarCalorias(35).
						agregarIngredienteNuevo("berenjena","tipo",35,false).
						agregarCondimentoNuevo("azucar",110).
						agregarDifcultad("d").
						build()
						
		receta5 = new 	RecetaBuilder().
			 			agregarNombre("Pan").
						agregarCalorias(40).
						agregarIngredienteNuevo("Pan","tipo",40,false).
						agregarCondimentoNuevo("levadura",150).
						agregarDifcultad("d").
						build()
		

		
		receta6 = new 	RecetaBuilder().
		 				agregarNombre("Carne a la vinagreta ").
						agregarCalorias(10).
						agregarIngredienteNuevo("carne","tipo",10,false).
						agregarIngredienteNuevo("agua","tipo",15,false).
						agregarCondimentoNuevo("harina",150).
						agregarCondimentoNuevo("vinagre",150).
						agregarDifcultad("d").
						build()
							


		receta7 = new	RecetaBuilder().
						agregarIngredienteNuevo("carne","tipo",10,false).
		 				agregarNombre("dificil ").
		 				agregarCalorias(11).
						agregarDifcultad("d").
						build()


		repo1 => [
			agregarRecetasPublicas(receta1)
			agregarRecetasPublicas(receta2)
			agregarRecetasPublicas(receta3)
			agregarRecetasPublicas(receta4)
			agregarRecetasPublicas(receta5)
			agregarRecetasPublicas(receta6)
		]

		recetas.add(receta1)
		recetas.add(receta2)
		recetas.add(receta3)
		recetas.add(receta4)
		recetas.add(receta5)
		recetas.add(receta6)
		recetas.add(receta7)
		observerCantidadPorHora = new CantidadDeConsultaPorHoraDelDiaObserver

		observerRecetaMasConsultada = new RecetaMasConsultadaObserver

		observerRecetasPorSexo = new RecetaMasConsultadaEnBaseAlSexoObserver

		observerVeganos = new CantidadVeganoConsultaRecetasDificilesObserver =>[
			setVegano=vegano
		]

		filtroSobrepeso = new FiltroSobrepeso

		ordenarCalorias = new OrdenarCalorias

		consulta1 = new Consulta => [
			agregarObserver(observerCantidadPorHora)
			agregarObserver(observerRecetaMasConsultada)
			agregarObserver(observerRecetasPorSexo)
			agregarObserver(observerVeganos)
			agregarFiltro(filtroSobrepeso)
			agregarProcesamientoPosterior(ordenarCalorias)
		]

		monitor = new MonitorConsultas => [
			setRecetaMasConsultada(observerRecetaMasConsultada)
			setConsultasPorHora(observerCantidadPorHora)
			setConsultaVeganos(observerVeganos)
			setConsultasPorSexo(observerRecetasPorSexo)
		]
		consulta1.consultarRecetas(repo1, matias)
		

	}

	@Test
	def void cantidadRecetasMasConsultadaPorHora() {

		Assert.assertEquals(1, monitor.cantidadConsultasPorHoraDelDia(00))
		// aca varia segun la hora en la que se esten haciendo las consultas

	}
	
	@Test
	def void cantidadRecetasConsultadasPorHombres(){
		Assert.assertEquals(1,monitor.cantidadDeConsultasPorSexo("h"))
	}
	
	@Test
	def void cantidadRecetasConsultadasPorMujeres(){
		Assert.assertEquals(0,monitor.cantidadDeConsultasPorSexo("m"))
	}
	
	@Test
	def void cantidadRecetasDificilesConsultadasPorVeganos(){
		Assert.assertEquals(1,monitor.cantidadConsultasDificilesDeVeganos)
	}
	
	@Test
	def void recetaMasConsultada(){
		Assert.assertEquals(1,monitor.buscarRecetaMasConsultada().size())
	}
	

}
