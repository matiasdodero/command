package ar.edu.frba.anothercat.nuevoOrigDatos

import ar.edu.frba.anothercat.receta.Repositorio_Receta

import com.google.gson.JsonParser
import org.eclipse.xtend.lib.annotations.Accessors
import javax.json.JsonArray
import java.util.ArrayList
import java.util.List

@Accessors
class RepoAdapter extends Repositorio_Receta{
	RepoExterno unRepoExterno
	ParametroBusqueda unosParametros
	JsonParser jsonParser = new JsonParser()
	List<RecetaJSON> recetasJSON = new ArrayList<RecetaJSON>
	
	com.google.gson.JsonArray userarray
	
	def dameLaRecetaPosta(){
	
		userarray = jsonParser.parse(unRepoExterno.getRecetas(unosParametros)).asJsonArray
		
		
	}
	
	def Iterable<RecetaJSON> buscarRecetas(){
		recetasJSON.filter[unaReceta | unaReceta.nombreReceta.equals((unosParametros.nombreABuscar))]
	}
}