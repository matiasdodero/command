package ar.edu.frba.anothercat.receta

import ar.edu.frba.anothercat.nuevoOrigDatos.ParametroBusqueda
import ar.edu.frba.anothercat.nuevoOrigDatos.RecetaJSON
import ar.edu.frba.anothercat.nuevoOrigDatos.RepoAdapter
import org.junit.Before
import org.junit.Test

class Tp3punto2 {
	
	
	ParametroBusqueda parametrosDeBusqueda	
	RecetaJSON polloALaProvenzal	
	Ingrediente pollo	
	RepoAdapter repoAdapter
	
	@Before
	def void init(){
		
		
		pollo = new Ingrediente		
		parametrosDeBusqueda = new ParametroBusqueda
		
		
		parametrosDeBusqueda =>[
			setNombreABuscar("polloALaProvenzal")
			setDificultad("F")
			palabrasClave.add("pollo")
			palabrasClave.add("provenzal")
			palabrasClave.add("facil")
		]
		
		polloALaProvenzal = new RecetaJSON
		polloALaProvenzal =>[
			setNombreReceta("polloALaProvenzal")
			ingredientes.add(pollo)
			setTiempoDePreparacion(30)
			setTotalCalorias(300)
			setDificultad("F")
			setAutor("masterChef")
			setAnioDeCreacion(2015)
		]
		
		repoAdapter = new RepoAdapter
		repoAdapter =>[
			recetasJSON.add(polloALaProvenzal)
			setUnosParametros(parametrosDeBusqueda)
		]		
		
	}
	
	@Test
	def void buscarRecetas(){
		println(repoAdapter.buscarRecetas())
	}
		
	
	
}