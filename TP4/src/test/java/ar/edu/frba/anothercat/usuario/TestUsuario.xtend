package ar.edu.frba.anothercat.usuario

import org.junit.Test
import org.junit.Assert
import org.junit.Before
import java.util.ArrayList
import java.util.List
import java.util.Date
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarAlfabeticamente
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.filtrosDeUsuario.OrdenarCalorias
import ar.edu.frba.anothercat.filtrosDeUsuario.PrimerosN
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroBurgues
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroDisgusto
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroCondicionesPre
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroSobrepeso
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.usuario.RepoUsuarios
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.Grupo
import ar.edu.frba.anothercat.usuario.tipoRutina
import java.util.HashSet

class TestUsuario {
	
	//String CondPreex
	Usuario matias
	Usuario daniel
	
	OrdenarAlfabeticamente OrdAlf
	OrdenarCalorias OrdCal
	Pares misPares
	PrimerosN misPrimN
	
	//Pendientes unRepoUsuario
	//Aceptados unRepoUsuarioAceptado
	//Rechazados unRepoUsuarioRechazado
	
	Ingrediente ingrediente1
	Ingrediente ingrediente2
	Ingrediente ingrediente3
	Ingrediente ingrediente4
	Ingrediente ingrediente5
	Ingrediente ingrediente6
	
	RepoUsuarios unRepoUsuario
	
	Condimento condimento1
	Condimento condimento2
	Condimento condimento3
	Condimento condimento4
	Condimento condimento5
	Condimento condimento6

	
	Repositorio_Receta Repo1
	
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
	
	Grupo PinPals
	
	FiltroBurgues fBurgues
	FiltroCondicionesPre fCondPre
	FiltroDisgusto fDisg
	FiltroSobrepeso fSobreP

	@Before
	def void init(){

		
		ingrediente1 = new Ingrediente => [
			setNombreIngrediente("carne")
			setCalorias(200)
			setSosCaro(false)
		]

		ingrediente2 = new Ingrediente => [
			setNombreIngrediente("agua")
			setCalorias(20)
			setSosCaro(false)
		]
		
		ingrediente3 = new Ingrediente => [
			setNombreIngrediente("polenta")
			setCalorias(20)
			setSosCaro(false)
		]
		
		ingrediente4 = new Ingrediente => [
			setNombreIngrediente("lechon")
			setCalorias(20)
			setSosCaro(false)
		]
		
		ingrediente5 = new Ingrediente => [
			setNombreIngrediente("salmon")
			setCalorias(20)
			setSosCaro(true)
		]
		
		
		condimento1 = new Condimento => [
			setNombreCondimento("azucar")
			setCantidad(200)
		]
		
		condimento2 = new Condimento => [
			setNombreCondimento("sal")
			setCantidad(200)
		]
		
		condimento3 = new Condimento => [
			setNombreCondimento("caldo")
			setCantidad(200)
		]
		
		condimento4 = new Condimento => [
			setNombreCondimento("harina")
			setCantidad(200)

		]
		
		receta1 = new Receta => [
		nombrePlato = "plato de receta 1"
		sumarCalorias(100)
		estado = estadoReceta.Publica
		agregarIngrediente(ingrediente1)
		agregarCondimento(condimento1)
		//agregarCondimento(condimento2)
		//agregarCondimento(condimento3)
		
			]	
			
		receta2 = new Receta =>[
		    nombrePlato = "plato de receta 2"
			sumarCalorias(300)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente2)
			agregarCondimento(condimento2)
		]
		
		receta3 = new Receta =>[
			nombrePlato = "plato de receta 3"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente1)
			agregarIngrediente(ingrediente3)
		]
		
		receta4 = new Receta =>[
			nombrePlato = "plato de receta 4"
			sumarCalorias(250)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente3)
			agregarIngrediente(ingrediente4)
		]
		
		receta5 = new Receta =>[
		    nombrePlato = "plato de receta 5"
			sumarCalorias(150)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta6 = new Receta =>[
		    nombrePlato = "plato de receta 6"
			sumarCalorias(600)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente5)
			agregarCondimento(condimento4)
		]
		
		receta7 = new Receta =>[
		    nombrePlato = "plato de receta 7"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta8 = new Receta =>[
		    nombrePlato = "plato de receta 8"
			sumarCalorias(200)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta9 = new Receta =>[
		    nombrePlato = "plato de receta 9"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta10 = new Receta =>[
		    nombrePlato = "plato de receta 10"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta11 = new Receta =>[
		    nombrePlato = "plato de receta 11"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta12 = new Receta =>[
		    nombrePlato = "plato de receta 12"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta13 = new Receta =>[
		    nombrePlato = "plato de receta 13"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta14 = new Receta =>[
		    nombrePlato = "plato de receta 14"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta15 = new Receta =>[
		    nombrePlato = "plato de receta 15"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta16 = new Receta =>[
		    nombrePlato = "plato de receta 16"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta17 = new Receta =>[
		    nombrePlato = "plato de receta 17"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta18 = new Receta =>[
		    nombrePlato = "plato de receta 18"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta19 = new Receta =>[
		    nombrePlato = "plato de receta 19"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		receta20 = new Receta =>[
		    nombrePlato = "plato de receta 20"
			sumarCalorias(100)
			estado = estadoReceta.Publica
			agregarIngrediente(ingrediente4)
			agregarCondimento(condimento4)
		]
		
		
		PinPals = new Grupo =>[
			setNombre("PinPals")
		//	agregarPreferencias(ingrediente3)
		//	agregarPreferencias(ingrediente1)
		]
		
		 matias = new Usuario => [
	    	setNombre("matias")
	    	fechaDeNacimiento = new Date(01-01-1987)
//	    	rutina = "dsad"
			peso=50
			altura=1.71
			sexo = "m"
		//	agregarCondicion(hiperten) 
			agregarCondicion(diabe)
		//	agregarCondicion(vegano) 
			agregarPrefer(manzana)
		//	agregarPrefer(pollo)
			agregarPrefer(lechuga)
		//	agregarPrefer(carne)
			agregarDisgusto(ingrediente3)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
		
		daniel = new Usuario => [
	    	setNombre("daniel")
	    	fechaDeNacimiento = new Date(01-01-1987)
//	    	rutina = "dsad"
			peso=50
			altura=1.71
			sexo = "m"
		//	agregarCondicion(hiperten) 
		//	agregarCondicion(diabe)
		//	agregarCondicion(vegano) 
			agregarPrefer(manzana)
		//	agregarPrefer(pollo)
			agregarPrefer(lechuga)
		//	agregarPrefer(carne)
			agregarDisgusto(ingrediente3)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
		
		Repo1 = new Repositorio_Receta
		
		unRepoUsuario = new RepoUsuarios
		
		fBurgues = new FiltroBurgues
		
		fCondPre = new FiltroCondicionesPre
	
		fDisg = new FiltroDisgusto
		
		fSobreP = new FiltroSobrepeso
		
		OrdAlf = new OrdenarAlfabeticamente
		
		OrdCal = new OrdenarCalorias
		
		misPares = new Pares
	 
		misPrimN = new PrimerosN	
		
		

	}

	
	Diabetico diabe = new Diabetico 
	
	Hipertenso hiperten = new Hipertenso 
	
	Vegano vegano = new Vegano 
	
	Ingrediente pollo = new Ingrediente => [
		setNombreIngrediente("pollo") 		
		setTipoIngrediente("carne")	
	]
	
	Ingrediente carne = new Ingrediente => [
		setNombreIngrediente("carne") 		
		setTipoIngrediente("carne")	
	]
	
	Ingrediente manzana = new Ingrediente => [
		setNombreIngrediente("manzana")	
		setTipoIngrediente("fruta")
	]	
	
	Ingrediente lechuga = new Ingrediente => [
		setNombreIngrediente("lechuga")	
		setTipoIngrediente("verdura")
	]
	
	
	
	

	@Test
	def void creacionUsuario () 
	{
		
	matias.agregarReceta(receta1)
	/*matias.misRecetas.forEach[unaRec | 
			System.out.println(unaRec.getNombrePlato)
			unaRec.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
			unaRec.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombre)
			System.out.println(unCond.getCantidad)
			]
			matias.precondiciones.forEach[unaPre |
				System.out.println(unaPre.esInadecuadaPara(unaRec))
			]]*/
	//	Assert.assertEquals(true,matias.sosValido())
	//	Assert.assertEquals(true,matias.seguisDietaSaludable())
	//	Assert.assertEquals(20.5,matias.calcularImc(),1)
	}
	
	
	@Test
	def void averiguarIMC(){
		Assert.assertEquals(45.2,matias.calcularImc(),0.1)
	}
	
	@Test
	def void usuarioSigueRutinaSaludable(){
		Assert.assertTrue(matias.seguisDietaSaludable())
	}
	
	@Test
	def void puedoVerRecetaPublica(){
		matias=>[
			Assert.assertTrue(puedoVerReceta(receta2))
		]
	}
	
	@Test
	def void puedoModificarRecetaPublica(){
		matias =>[
			Assert.assertTrue(puedoModificarReceta(receta2))
		]
	}
	
	@Test
	def void PuedoVerRecetaPrivada(){
		matias =>[
			Assert.assertFalse(puedoVerReceta(receta3))
		]
	}
	
	@Test
	def void puedoModificarRecetaPrivada(){
		matias =>[
			Assert.assertFalse(puedoModificarReceta(receta3))
		]
	}
	
	@Test
	def void ModificoRecetaPrivada(){
		matias.agregarReceta(receta1)
		/*System.out.println(receta1.getNombrePlato)
		System.out.println(receta1.getTotalCalorias)
		System.out.println(receta1.getDificultad)
		System.out.println(receta1.esPublica)
		receta1.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
		receta1.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombreCondimento)
			System.out.println(unCond.getCantidad)
			]
		matias.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)
	        System.out.println(unaR.getTotalCalorias)
		    System.out.println(unaR.getDificultad)
		    System.out.println(unaR.esPublica)
		    unaR.ingredientes.forEach [unIngr | 
			   System.out.println(unIngr.getNombreIngrediente)
			   System.out.println(unIngr.getTipoIngrediente)
			]
		    unaR.condimentos.forEach [unCond | 
		  	   System.out.println(unCond.getNombreCondimento)
			   System.out.println(unCond.getCantidad)
			]
		] */
		matias.modificarNombrePlato(receta1,"elPlato")
		matias.modificarTotalCalorias(receta1,100)
		matias.modificarDificultad(receta1,"facil")
		matias.modificarIngredientesReceta(receta1,ingrediente2)
		matias.modificarCondimentosReceta(receta1,condimento2)
		/*System.out.println(receta1.getNombrePlato)
		System.out.println(receta1.getTotalCalorias)
		System.out.println(receta1.getDificultad)
		System.out.println(receta1.esPublica)
		receta1.ingredientes.forEach [unIngr | 
			System.out.println(unIngr.getNombreIngrediente)
			System.out.println(unIngr.getTipoIngrediente)
			]
		receta1.condimentos.forEach [unCond | 
			System.out.println(unCond.getNombreCondimento)
			System.out.println(unCond.getCantidad)
			]
		matias.misRecetas.forEach[unaR | 
 		    System.out.println(unaR.getNombrePlato)
	        System.out.println(unaR.getTotalCalorias)
		    System.out.println(unaR.getDificultad)
		    System.out.println(unaR.esPublica)
		    unaR.ingredientes.forEach [unIngr | 
			   System.out.println(unIngr.getNombreIngrediente)
			   System.out.println(unIngr.getTipoIngrediente)
			]
		    unaR.condimentos.forEach [unCond | 
		  	   System.out.println(unCond.getNombreCondimento)
			   System.out.println(unCond.getCantidad)
			]
		] */
		
	}
	

	@Test
	def void validarUsuario(){

		matias.sosValido()
	}
	
	@Test
	def void validameAlGrupitoConUnaReceta(){

	PinPals.agregarReceta(receta1)
	}
	
	@Test
	def void validameAlGrupitoConUnaUsuario(){

	PinPals.agregarUsuario(matias)
	}
	
	@Test
	def void validameAlGrupitoenGral(){

	PinPals.agregarReceta(receta1)
	PinPals.agregarUsuario(matias)
	//PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	//PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral2(){

	PinPals.agregarUsuario(matias)
	PinPals.agregarReceta(receta1)
	//PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	//PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void validameAlGrupitoenGral3(){

	PinPals.agregarUsuario(matias)
	PinPals.agregarReceta(receta2)
	//PinPals.misRecetas.forEach[u | System.out.println(u.getNombrePlato)]
	//PinPals.misUsuarios.forEach[u | System.out.println(u.getNombre)]
	//matias.misGrupos.forEach[u | System.out.println(u.getNombre)]
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta1.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario2(){
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertTrue(receta2.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlUsuario3(){
	//receta4.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta4.sugerimeAlUsuario(matias))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertTrue(receta1.sugerimeAlGrupo(PinPals))
	}
	
	@Test
	def void sugerimeUnaRecAlGrupo2(){
	//receta1.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	//receta2.decimeTusIngredientesTotales().forEach[unI | System.out.println(unI.getNombreIngrediente)]
	Assert.assertFalse(receta2.sugerimeAlGrupo(PinPals))
	}

	
	@Test
	def void TP3punto1getUsuariosporPrecondAceptados(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)

	/*System.out.println("LA LISTA PROCESADA BUSCANDO POR PRECOND") 
 	System.out.println(unRepoUsuario.getPrecond(diabe).getNombre)
 	System.out.println("FIN")*/
	
	
	}
	
	
	@Test
	def void TP3punto1ListUsuariosporGetAceptados(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)

	/*System.out.println("LA LISTA PROCESADA BUSCANDO POR PRECOND")
	unRepoUsuario.listUsuariosPrec(diabe).forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1getUsuariosporPrecondicionesAceptados(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)

	/*System.out.println("LA LISTA PROCESADA BUSCANDO POR NOMBRE") 
 	System.out.println(unRepoUsuario.get("matias").getNombre)
 	System.out.println("FIN")*/
	
	
	}
	
	
	@Test
	def void TP3punto1ListUsuariosporNombreAceptados(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)

	/*System.out.println("LA LISTA PROCESADA BUSCANDO POR NOMBRE")
	unRepoUsuario.listUsuarios("cesar").forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("FIN")*/
	
	
	}
	
	
	 @Test
	def void TP3punto1PasarUsuariosARechazados(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.rechazarUsuario(matias, "FUE DESCORTEZ")
	

 	/*System.out.println("LA LISTA RECHAZADOS con motivo")
 	unRepoUsuario.getRechazados.forEach[unMoti | 
	System.out.println(unMoti.unUsuario.getNombre)
 	System.out.println(unMoti.getMotivo)]
 	System.out.println("LA LISTA PENDIENTE")
	unRepoUsuario.usuarios.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("FIN")*/
	
	
	}
	
	 @Test
	def void TP3punto1echameAlUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	unRepoUsuario.echarUsuario(matias, "FUE DESCORTEZ")
	

 	/*System.out.println("LA LISTA RECHAZADOS con motivo")
 	unRepoUsuario.getRechazados.forEach[unMoti | 
	System.out.println(unMoti.unUsuario.getNombre)
 	System.out.println(unMoti.getMotivo)]
 	System.out.println("LA LISTA PENDIENTE")
	unRepoUsuario.usuarios.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1ReabilitameAlUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	unRepoUsuario.echarUsuario(matias, "FUE DESCORTEZ")
	unRepoUsuario.reabilitarUsuario(matias)
	

 	/*System.out.println("LA LISTA RECHAZADOS con motivo")
 	unRepoUsuario.getRechazados.forEach[unMoti | 
	System.out.println(unMoti.unUsuario.getNombre)
 	System.out.println(unMoti.getMotivo)]
 	System.out.println("LA LISTA PENDIENTE")
	unRepoUsuario.usuarios.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1UpdeteaNombreUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	matias.modificarNombre("matiass",unRepoUsuario)

 	/*System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getNombre)]
 	System.out.println("NuevoNombre")
 	System.out.println(matias.getNombre)
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1UpdeteaFechaUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)

	matias.modificarFecha(new Date(1989-05-05),unRepoUsuario)

 	/*System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getFechaDeNacimiento)]
 	System.out.println("Nueva fecha")
 	System.out.println(matias.getFechaDeNacimiento)
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1UpdeteaSexoUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	//System.out.println(matias.getSexo)
	matias.modificarSexo("f",unRepoUsuario)

 	/*System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getSexo)]
 	System.out.println("Nuevo sexo")
 	System.out.println(matias.getSexo)
 	System.out.println("FIN")*/
	
	
	}
	
	@Test
	def void TP3punto1UpdeteaAlturaUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	//System.out.println(matias.getAltura)
	matias.modificarAltura(1.80,unRepoUsuario)

 	/*System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getAltura)]
 	System.out.println("Nuevo sexo")
 	System.out.println(matias.getAltura)
 	System.out.println("FIN")*/
	
	}
	
	@Test
	def void TP3punto1UpdeteaPesoUsuario(){
		
	unRepoUsuario.add(matias)
	unRepoUsuario.aceptarUsuario(matias)
	//System.out.println(matias.getPeso)
	matias.modificarPeso(73,unRepoUsuario)

 	/*System.out.println("LA LISTA ACEPTADA")
	unRepoUsuario.getAceptados.forEach[unUsu | 
 	        System.out.println(unUsu.getPeso)]
 	System.out.println("Nuevo sexo")
 	System.out.println(matias.getPeso)
 	System.out.println("FIN")*/
	
	}
	
	
	@Test
	def void puedoVerreceta(){
		
	/*
	PinPals.agregarUsuario(matias)
	PinPals.agregarUsuario(daniel)
	matias.agregarReceta(receta10)
	daniel.agregarReceta(receta11)
	PinPals.agregarReceta(receta12)
	System.out.println("consulta de puedo ver recetas")
	System.out.println(matias.puedoVerReceta(receta10))
	System.out.println(matias.puedoVerReceta(receta11))
	System.out.println(matias.puedoVerReceta(receta12))
	System.out.println("fin de consulta de puedo ver recetas")*/
	}
	

}