package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.creacionales.RepoUsuarioBuilder
import org.junit.Before
import java.util.Date
import org.junit.Test
import org.junit.Assert
import ar.edu.frba.anothercat.creacionales.UsuarioBuilder
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.ProcesamientoPosterior
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroDisgusto
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.PrimerosN
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarCalorias
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarAlfabeticamente
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.RepoUsuarios

import static org.mockito.Mockito.*
import org.mockito.ArgumentMatcher

class TestRepoUsuarioCreacional {

	Usuario daniel
	Usuario emiliano
	Usuario matias
	Usuario lilian
	Usuario pablo
	
	Receta  plato1
	Receta  plato2
	Receta  plato3
	Receta  plato4
	
	Condimento sal
	Condimento azucar
	Condimento pimienta
	Condimento agua
	
	Ingrediente pollo
	Ingrediente carne
	Ingrediente lechuga
	Ingrediente manzana
	
	Grupo PinPals
	
	@Before
	def void initPreparacion() {
		
		sal = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(100)
		]
		
		azucar = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(150)
		]
		
		pimienta = new Condimento => [
			setNombreCondimento("pimienta")
			setCantidad(100)
		]
		
		agua = new Condimento => [
			setNombreCondimento("agua")
			setCantidad(100)
		]
		
		carne = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(50)
			setSosCaro(false)
		]

		pollo = new Ingrediente => [
			setNombreIngrediente("pollo")
			setCalorias(20)
			setSosCaro(false)
		]
		
		manzana = new Ingrediente => [
			setNombreIngrediente("manzana")
			setCalorias(20)
			setSosCaro(false)
		]
		
		lechuga = new Ingrediente => [
			setNombreIngrediente("lechuga")
			setCalorias(20)
			setSosCaro(false)
		]
		
		plato1 = new Receta =>[
		    nombrePlato = "pollo bien salado"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(pollo)
			agregarCondimento(sal)
		]
		
		plato2 = new Receta =>[
		    nombrePlato = "manzana azucarada"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(manzana)
			agregarCondimento(azucar)
		]
		
		plato3 = new Receta =>[
		    nombrePlato = "bife al plato bien pimentada"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(carne)
			agregarCondimento(pimienta)
		]
		
		plato4 = new Receta =>[
		    nombrePlato = "lechuga al agua"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(lechuga)
			agregarCondimento(agua)
		]
		
		PinPals = new Grupo =>[
			setNombre("PinPals")
		
		]

		
		daniel = new UsuarioBuilder()
		.unNuevoUsuarioStandard("daniel","m",new Date(01-01-1987))
		.hacerUsuarioDiabetico()
		.agregarUnaReceta(plato4)
		.build()
		
		emiliano = new UsuarioBuilder()
		.setearleUnPerfil("emiliano",new Date(01-01-1987),"m",1.7,80,tipoRutina.INTENSIVO)
		.hacerUsuarioVegano()
		.agregarUnaPreferencia(new Ingrediente)
		.agregarUnDisgusto(new Ingrediente)
		.agregarUnaReceta(plato4)
		.agregarUnaFavorita(new Receta => [
		     nombrePlato = "favorito"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
		.build()
		
		
		matias = new UsuarioBuilder()
		.unNuevoUsuarioStandard("matias","m",new Date(01-01-1987))
		.hacerUsuarioHipertenso()
		.agregarUnaReceta(plato4)
		.build()
		
		lilian = new UsuarioBuilder()
		.unNuevoUsuarioStandard("lilian","f",new Date(01-01-1987))
		.hacerUsuarioCeliaco()
		.agregarUnaReceta(plato4)
		.build()
		
		pablo = new UsuarioBuilder() 
		.unNuevoUsuarioStandard("pablo","m",new Date(01-01-1987))
		.agregarUnaReceta(plato4)
		.agregarUnGrupo(PinPals)
		.build()

	}
	
	
	@Test
	def void testNombresOk() {
	Assert.assertEquals("daniel",daniel.getNombre)
	Assert.assertEquals("emiliano",emiliano.getNombre)
	Assert.assertEquals("matias",matias.getNombre)
	Assert.assertEquals("lilian",lilian.getNombre)
	Assert.assertEquals("pablo",pablo.getNombre)
	}
	
	@Test
	def void testCorrerOkAceptar() {
	Assert.assertEquals(1,daniel.getPrecondiciones.size)
	Assert.assertEquals(1,emiliano.getPrecondiciones.size)
	Assert.assertEquals(1,matias.getPrecondiciones.size)
	Assert.assertEquals(1,emiliano.getPrecondiciones.size)
	Assert.assertEquals(0,pablo.getPrecondiciones.size)
	
	}
	
	@Test
	def void testPrecondicionesDaniel() {
	Assert.assertEquals(true,daniel.sosDiabetico())
	Assert.assertEquals(false,daniel.sosHipertenso())
	Assert.assertEquals(false,daniel.sosCeliaco())
	Assert.assertEquals(false,daniel.sosVegano())
	}
	
	@Test
	def void testPrecondicionesEmiliano() {
	Assert.assertEquals(false,emiliano.sosDiabetico())
	Assert.assertEquals(false,emiliano.sosHipertenso())
	Assert.assertEquals(false,emiliano.sosCeliaco())
	Assert.assertEquals(true,emiliano.sosVegano())
	}
	
	@Test
	def void testPrecondicionesMatias() {
	Assert.assertEquals(false,matias.sosDiabetico())
	Assert.assertEquals(true,matias.sosHipertenso())
	Assert.assertEquals(false,matias.sosCeliaco())
	Assert.assertEquals(false,matias.sosVegano())
	}
	
	@Test
	def void testPrecondicionesLilian() {
	Assert.assertEquals(false,lilian.sosDiabetico())
	Assert.assertEquals(false,lilian.sosHipertenso())
	Assert.assertEquals(true,lilian.sosCeliaco())
	Assert.assertEquals(false,lilian.sosVegano())
	}
	
	@Test
	def void testPrecondicionesPablo() {
	Assert.assertEquals(false,pablo.sosDiabetico())
	Assert.assertEquals(false,pablo.sosHipertenso())
	Assert.assertEquals(false,pablo.sosCeliaco())
	Assert.assertEquals(false,pablo.sosVegano())
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testDanielPideAlgoIndebido() {
	daniel.agregarReceta(plato2)
	//System.out.println(emiliano.getPrecondiciones.size)
	}
	
	@Test
	def void testDanielPideAlgoDebido() {
	daniel.agregarReceta(plato1)
	daniel.agregarReceta(plato3)
	Assert.assertEquals(4,daniel.getMisRecetas.size)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testEmilianoPideAlgoIndebido() {
	emiliano.agregarReceta(plato3)
	//System.out.println(emiliano.getPrecondiciones.size)
	}
	
	@Test
	def void testEmilianoPideAlgoDebido() {
	emiliano.agregarReceta(plato2)
	Assert.assertEquals(2,daniel.getMisRecetas.size)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testMatiasPideAlgoIndebido() {
	matias.agregarReceta(plato1)
	}
	
	@Test
	def void testMatiasPideAlgoDebido() {
	matias.agregarReceta(plato2)
	matias.agregarReceta(plato3)
	Assert.assertEquals(4,matias.getMisRecetas.size)
	}
	
	@Test
	def void testLilianPideAlgoDebido() {
	lilian.agregarReceta(plato1)
	lilian.agregarReceta(plato2)
	lilian.agregarReceta(plato3)
	Assert.assertEquals(5,lilian.getMisRecetas.size)
	}
	
	@Test
	def void testPabloPideAlgoDebido() {
	pablo.agregarReceta(plato1)
	pablo.agregarReceta(plato2)
	pablo.agregarReceta(plato3)
	Assert.assertEquals(5,pablo.getMisRecetas.size)
	}
	
	@Test
	def void testFavoritaDeTodos() {
	Assert.assertEquals(1,daniel.getFavoritas.size)
	Assert.assertEquals(1,matias.getFavoritas.size)
	Assert.assertEquals(1,lilian.getFavoritas.size)
	Assert.assertEquals(1,emiliano.getFavoritas.size)
	Assert.assertEquals(1,pablo.getFavoritas.size)
	}
	
	@Test
	def void testPidenAlgoDebidoConMock() {
	var Receta unPlatoFicticio = mock(typeof(Receta)) 
	pablo.agregarReceta(unPlatoFicticio)
	daniel.agregarReceta(unPlatoFicticio)
	verify(unPlatoFicticio, times(2)).validar()
	Assert.assertEquals(2,pablo.getMisRecetas.size)
	}
	
	@Test
	def void testGrupoConTodos() {
	PinPals.agregarUsuario(lilian)
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(emiliano)
	PinPals.agregarUsuario(daniel)
	Assert.assertEquals(5,PinPals.getMisUsuarios.size)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testGrupoSinDiabeticos() {
	PinPals.agregarReceta(plato2)
	PinPals.agregarUsuario(lilian)
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(emiliano)
	PinPals.agregarUsuario(daniel)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testGrupoSinVeganos() {
	PinPals.agregarReceta(plato3)
	PinPals.agregarUsuario(lilian)
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(emiliano)
	PinPals.agregarUsuario(daniel)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testGrupoSinHipertensos() {
	PinPals.agregarReceta(plato1)
	PinPals.agregarUsuario(lilian)
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(emiliano)
	PinPals.agregarUsuario(daniel)
	}
	
	@Test
	def void testConDemasiadasPrecondiciones() {
	PinPals.agregarReceta(plato1)
	PinPals.agregarReceta(plato2)
	PinPals.agregarReceta(plato3)
	PinPals.agregarUsuario(lilian)
	Assert.assertEquals(2,pablo.getMisRecetas.size)
	}
	
	@Test(expected=NoCumpleRequisitosException)
	def void testConDemasiadasPrecondicionesIndebidos() {
	PinPals.agregarReceta(plato1)
	PinPals.agregarReceta(plato2)
	PinPals.agregarReceta(plato3)
	PinPals.agregarUsuario(lilian)
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(emiliano)
	PinPals.agregarUsuario(daniel)
	}
	
	
}