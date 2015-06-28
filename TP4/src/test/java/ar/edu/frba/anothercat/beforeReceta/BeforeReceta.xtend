package ar.edu.frba.anothercat.beforeReceta

import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Condimento
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.creacionales.RecetaBuilder
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.receta.Receta

@Accessors
class BeforeReceta {
//	Ingredientes de Test
	Ingrediente carne = new Ingrediente => [setNombreIngrediente("carne")
											setCalorias(200)
											setSosCaro(false)]
	
	Ingrediente agua =  new Ingrediente => [setNombreIngrediente("agua")
											setCalorias(20)
											setSosCaro(false)]
											
											
	Ingrediente polenta =new Ingrediente => [setNombreIngrediente("polenta")
											setCalorias(20)
											setSosCaro(false)]
	
	Ingrediente lechon = new Ingrediente => [setNombreIngrediente("lechon")
											setCalorias(20)
											setSosCaro(true)]
	
	Ingrediente caviar = new Ingrediente => [setNombreIngrediente("caviar")
											setCalorias(90)
											setSosCaro(true)]
											
	Ingrediente milanesa = new Ingrediente => [setNombreIngrediente("milanesa")
											setCalorias(250)
											setSosCaro(false)]
	
	Ingrediente pure = new Ingrediente => [setNombreIngrediente("pure")
											setCalorias(15)
											setSosCaro(false)]
	
	Ingrediente pollo =  new Ingrediente => [setNombreIngrediente("pollo")
											setCalorias(25)
											setSosCaro(false)]

	Ingrediente pescado = new Ingrediente => [setNombreIngrediente("pescado")
											setCalorias(30)
											setSosCaro(false)]
	
	Ingrediente berenjena = new Ingrediente => [setNombreIngrediente("berenjena")
											setCalorias(35)
											setSosCaro(false)]
	
	Ingrediente pan = new Ingrediente => [setNombreIngrediente("pan")
											setCalorias(40)
											setSosCaro(false)]
	
	//condimentos de Test
	Condimento azucar = new Condimento => [	setNombreCondimento("azucar")
											setCantidad(200)]
	
	Condimento sal=  new Condimento => [	setNombreCondimento("sal")
											setCantidad(200)]
	
	Condimento aceite=  new Condimento => [	setNombreCondimento("aceite")
											setCantidad(150)]
	
	Condimento vinagre=  new Condimento => [setNombreCondimento("vinagre")
											setCantidad(150)]
	
	Condimento harina=  new Condimento => [	setNombreCondimento("harina")
											setCantidad(150)]
	
	
	Condimento levadura= new Condimento => [setNombreCondimento("levadura")
											setCantidad(150)]
	
	//Recetas de Test
	Receta carneDulce 	= new RecetaBuilder().
								agregarNombre("carneDulce").
								agregarCalorias(300).
								agregarEstado(estadoReceta.Publica).
								agregarIngrediente(carne).
								agregarIngrediente(agua).
								agregarCondimento(azucar).
								build()
							
	Receta lechonsal 	= new	RecetaBuilder().
								agregarNombre("lechonsal").
								agregarCalorias(100).
								agregarEstado(estadoReceta.Publica).
								agregarIngrediente(lechon).
								agregarIngrediente(polenta).
								agregarCondimento(sal).
								build()
							
	Receta polentadulce = new 	RecetaBuilder().
								agregarNombre("polenta dulce").
								agregarCalorias(501).
								agregarEstado(estadoReceta.Publica).
								agregarIngrediente(agua).
								agregarIngrediente(polenta).
								agregarCondimento(azucar).
								build()
								
	Receta aguita		= new	RecetaBuilder().
								agregarNombre("aguita").
								agregarCalorias(11).
								agregarEstado(estadoReceta.Compartida).
								agregarIngrediente(agua).
								build()
						
	Receta milapolentosa =new 	RecetaBuilder().
								agregarNombre("Mila  Polentosa").
								agregarCalorias(900).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(milanesa).
								agregarIngrediente(polenta).
								build()
								
	Receta caviarR 		= new	RecetaBuilder().
								agregarNombre("caviarR").
								agregarCalorias(10).
								agregarEstado(estadoReceta.Publica).
								agregarIngrediente(caviar).
								build()
								
	Receta polloConPure = new 	RecetaBuilder().
								agregarNombre("polloConPure").
								agregarCalorias(10).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(pollo).
								agregarIngrediente(pure).
								agregarCondimento(sal).
								build()
								
	Receta PescadoAlVinagre=new RecetaBuilder().
								agregarNombre("Pescado al Vinagre").
								agregarCalorias(30).agregarEstado(estadoReceta.Privada).
								agregarIngrediente(pescado).
								agregarCondimento(aceite).
								agregarCondimento(aceite).
								build()		
												   
	Receta berenjenaDulce = new RecetaBuilder().
								agregarNombre("Berenjena Dulce").
								agregarCalorias(35).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(berenjena).
								agregarCondimento(azucar).
								build()
								
	Receta PanDuro 		 = new 	RecetaBuilder().
								agregarNombre("Pan de Ayer").
								agregarCalorias(40).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(pan).
								agregarCondimento(levadura).
								build()	
								
	Receta carneFuerte 	 = new 	RecetaBuilder().
								agregarNombre("Carne con Vinagre").
								agregarCalorias(100).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(carne).
								agregarIngrediente(agua).
								agregarCondimento(vinagre).
								agregarCondimento(harina).
								build()
								
	Receta carneConPolenta =new RecetaBuilder().
								agregarNombre("Carne con Polenta").
								agregarCalorias(40).
								agregarEstado(estadoReceta.Privada).
								agregarIngrediente(carne).
								agregarIngrediente(polenta).
								agregarCondimento(azucar).
								build()

	

	
						   
						   
	
		

}