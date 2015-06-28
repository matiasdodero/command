package ar.edu.frba.anothercat.receta

import java.util.List
import org.junit.Before
import org.junit.Test
import java.util.ArrayList
import org.junit.Assert
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.Vegano
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.CondicionPreexistente
import ar.edu.frba.anothercat.beforeReceta.BeforeReceta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestReceta {

	Receta receta1

	Receta receta3
	Receta receta2
	Receta receta4
	Receta receta5
	Receta receta6
	
	
	//RecetaSimple recetaPure
	

	
	Hipertenso hiperten
	Vegano vegano
	Diabetico diab
	
	BeforeReceta todasMisRecetasdeTest
	
	
	List<CondicionPreexistente> condiciones = new ArrayList<CondicionPreexistente>
	
	

	@Before
	def void init() {
		
		todasMisRecetasdeTest = new BeforeReceta
		
		hiperten = new Hipertenso
		vegano = new Vegano
		diab = new Diabetico
		
		condiciones.add(hiperten)
		condiciones.add(vegano)
		condiciones.add(diab)

	}

	@Test
	def void creacionReceta1() {

		receta1  => [
			agregarIngrediente(todasMisRecetasdeTest.getCarne())
			sumarCalorias(todasMisRecetasdeTest.getCarne().getCalorias())
			validar()
		]
		

	}
	
	@Test
	def void otraReceta(){
		receta3 =>[
			agregarIngrediente(todasMisRecetasdeTest.getAgua())
			agregarIngrediente(todasMisRecetasdeTest.getCarne())
			agregarCondimento(todasMisRecetasdeTest.getAzucar())
			agregarCondimento(todasMisRecetasdeTest.getSal())
			recetaInadecuadaPara(condiciones)
			
		]
		
		
	}
	
	@Test
	def void decimeSiSosSimple(){
		
		Assert.assertTrue(todasMisRecetasdeTest.getCarneDulce().sosSimple())
		
	}
	
	@Test
	def void decimeSiSosCompuesta(){
		
		todasMisRecetasdeTest.getCarneDulce().agregarmeReceta(todasMisRecetasdeTest.getPolloConPure())
		Assert.assertFalse(receta1.sosSimple())
		
	}
	
	/*@Test
	def void decimeTusIngredientesTotales(){
		
		
		receta3.decimeTusIngredientesTotales.forEach[unI | System.out.println(unI.getNombreIngrediente)]
		
	}
	@Test
	def void decimeTusIngredientesTotales2(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		receta1.decimeTusIngredientesTotales.forEach[unI | System.out.println(unI.getNombreIngrediente)]
		
	}	*/
	
	@Test
	def void decimeTusIngredientesTotales3(){
		
		/*receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)*/		
		receta1.agregarmeReceta(receta3)
		receta3.decimeTusCondimentosTotales.forEach[unI | System.out.println(unI.getNombreCondimento)]

		
	}	
	
	@Test
	def void decimeTusCaloriasFinales2(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		System.out.println(receta1.caloriasFinales)
		
	}
	
	@Test
	def void dameTuAzucarTotal1(){
		
		System.out.println(receta1.azucarTotal)
		
	}
	
	@Test
	def void dameTuAzucarTotal2(){
		
		receta2.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta4)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		System.out.println(receta1.azucarTotal)
		
	}
	
	@Test
	def void decimePorFavorSiTenesAzucar(){
		
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta2)		
		receta1.agregarmeReceta(receta3)
		System.out.println("receta 1 azucar" + receta1.tenesAzucar)
		
	}
	
	@Test
	def void TenesAzucar2(){
		
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta2)	
		System.out.println("receta 3 azucar" + receta3.tenesAzucar)
		
	}
	
	@Test
	def void decimePorFavorSiTenesSal(){
		
		receta2.agregarmeReceta(receta5)
		receta1.agregarmeReceta(receta2)
		System.out.println("receta 1 sal" + receta1.tenesSal)
		
	}
	
	@Test
	def void TenesSal2(){
		
		receta2.agregarmeReceta(receta5)
		receta3.agregarmeReceta(receta2)
		System.out.println("receta 3 sal" + receta3.tenesSal)
		
	}
	
	@Test
	def void decimePorFavorSiTenesAlgoDeEsto(){
		
		receta2.agregarmeReceta(receta5)
		receta1.agregarmeReceta(receta2)		
		System.out.println("receta 1 algo " + receta1.tenesPolloCarneChivitoChori)
		
	}
	
	@Test
	def void decimePorFavorSiTenesAlgoDeEsto2(){
		
		receta2.agregarmeReceta(receta5)
		System.out.println("receta 2 algo " + receta2.tenesPolloCarneChivitoChori)
		
	}
	
	/*@Test
	def void noPodesAgregarteAVosMisma(){
		receta5.agregarmeReceta(receta5)	
	}*/
	
	@Test
	def void noPodesAgregarteAUnaRecetaQueYaTeTenga(){
		//receta3.agregarmeReceta(receta1)
		receta5.agregarmeReceta(receta3)
		receta5.agregarmeReceta(receta2)
		receta1.agregarmeReceta(receta5)
		receta2.agregarmeReceta(receta4)
		receta4.agregarmeReceta(receta5)
	}
	
	@Test
	def void noPodesAgregarteAUnaRecetaQueYaTeTenga2(){
		//receta3.agregarmeReceta(receta1)
		receta3.agregarmeReceta(receta6)
		receta3.agregarmeReceta(receta5)
		receta1.agregarmeReceta(receta3)
		receta2.agregarmeReceta(receta4)
		receta4.agregarmeReceta(receta3)
		receta4.agregarmeReceta(receta6)
	}

	@Test
	def void paraQuienSosInadecuada(){
		
		receta5.agregarmeReceta(receta6)
		receta2.agregarmeReceta(receta5)
		receta1.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 1 inad " + unaP)]
		receta2.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 2 inad " + unaP)]
		receta3.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 3 inad " + unaP)]
		receta4.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 4 inad " + unaP)]
		receta5.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 5 inad " + unaP)]
		receta6.recetaInadecuadaPara(condiciones).forEach[unaP | System.out.println("receta 6 inad " + unaP)]
		
	}
	

}