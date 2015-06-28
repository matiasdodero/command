package ar.edu.frba.anothercat.command

import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroSobrepeso
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarCalorias
import ar.edu.frba.anothercat.observers.Consulta
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Vegano
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestCommand {

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

	Repositorio_Receta repo1

	FiltroSobrepeso filtroSobrepeso

	OrdenarCalorias ordenarCalorias

	ConsultaCommand consultaCommand

	EnviarMail enviarMail

	StubServidorMails servidorDePrueba

	Mail mailDePrueba

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
			//	agregarCondicion(hiperten) 
			agregarCondicion(vegano)
			//	agregarPrefer(pollo)
			//	agregarPrefer(carne)
			agregarDisgusto(ingrediente3)
		]

		daniel = new Usuario => [
			setNombre("daniel")
			fechaDeNacimiento = new Date(01 - 01 - 1987)
			//	    	rutina = "dsad"
			peso = 50
			altura = 1.71
			setSexo("h")
			//	agregarCondicion(hiperten) 
			//	agregarCondicion(diabe)
			//	agregarCondicion(vegano) 
			//	agregarPrefer(pollo)
			//	agregarPrefer(carne)
			agregarDisgusto(ingrediente3)
		]

		repo1 = new Repositorio_Receta

		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(10)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(15)
		]

		ingrediente3 = new Ingrediente => [
			setNombreIngrediente("pure")
			setCalorias(20)
		]

		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("pollo")
			setCalorias(25)
		]

		ingrediente5 = new Ingrediente => [
			setNombreIngrediente("pescado")
			setCalorias(30)
		]

		ingrediente6 = new Ingrediente => [
			setNombreIngrediente("berenjena")
			setCalorias(35)
		]

		ingrediente7 = new Ingrediente => [
			setNombreIngrediente("pan")
			setCalorias(40)
		]

		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(110)
		]

		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(15)
		]

		condimento3 = new Condimento => [
			setNombreCondimento("aceite")
			setCantidad(150)
		]

		condimento4 = new Condimento => [
			setNombreCondimento("vinagre")
			setCantidad(150)
		]

		condimento5 = new Condimento => [
			setNombreCondimento("harina")
			setCantidad(150)
		]

		condimento6 = new Condimento => [
			setNombreCondimento("levadura")
			setCantidad(150)
		]

		hiperten = new Hipertenso

		diab = new Diabetico

		receta1 = new Receta
		receta2 = new Receta
		receta3 = new Receta
		receta4 = new Receta
		receta5 = new Receta
		receta6 = new Receta
		receta7 = new Receta

		receta1 => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento1)
			sumarCalorias(ingrediente1.calorias)
			setDificultad("d")
			validar()
		]

		receta3 => [
			agregarIngrediente(ingrediente3)
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento2)
			sumarCalorias(ingrediente3.calorias)
			setDificultad("d")
			validar()
		]

		receta2 => [
			agregarIngrediente(ingrediente5)
			agregarCondimento(condimento3)
			agregarCondimento(condimento4)
			sumarCalorias(ingrediente5.calorias)
			setDificultad("d")
			validar()
		]

		receta4 => [
			agregarIngrediente(ingrediente6)
			agregarCondimento(condimento1)
			sumarCalorias(ingrediente6.calorias)
			setDificultad("d")
			validar()
		]

		receta5 => [
			agregarIngrediente(ingrediente7)
			agregarCondimento(condimento6)
			sumarCalorias(ingrediente7.calorias)
			setDificultad("d")
			validar()
		]

		receta6 => [
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento4)
			agregarCondimento(condimento5)
			sumarCalorias(ingrediente7.calorias)
			setDificultad("d")
			validar()
		]

		receta7 => [
			setDificultad("d")
		]

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

		filtroSobrepeso = new FiltroSobrepeso

		ordenarCalorias = new OrdenarCalorias

		consulta1 = new Consulta

		consulta1.consultarRecetas(repo1, matias)

		mailDePrueba = new Mail

		servidorDePrueba = new StubServidorMails

		enviarMail = new EnviarMail => [
			setServidor(servidorDePrueba)
			setMail(mailDePrueba)
		]

		consultaCommand = new ConsultaCommand => [
			agregarCommand(enviarMail)
			setUnaConsulta(consulta1)
			activarCommands()
		]

	}

	@Test
	def void testeoRecepcionMails() {
		Assert.assertEquals(1, servidorDePrueba.cantidadDeMailsEnviados)
	}

}
