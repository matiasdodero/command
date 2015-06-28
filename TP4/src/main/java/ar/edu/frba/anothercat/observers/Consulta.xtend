package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.ProcesamientoPosterior
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import java.util.HashSet
import ar.edu.frba.anothercat.command.ConsultaCommand

@Accessors 
class Consulta { 
	List<FiltroReceta> miFiltro = new ArrayList<FiltroReceta> 
	List<ProcesamientoPosterior> misProcesamientos = new ArrayList<ProcesamientoPosterior> 
	List<ConsultaObserver> observadores = new ArrayList<ConsultaObserver>
	
	List<Repositorio_Receta> repositorios = new ArrayList<Repositorio_Receta>
	List<Usuario> usuarios = new ArrayList<Usuario>
	Set<Receta> recetas = new HashSet<Receta>
	ConsultaCommand consultaCommand
		
	
	def public void agregarFiltro(FiltroReceta unFiltro) { 
 
		miFiltro.add(unFiltro) 
 
	}	 
	 
	def public void agregarProcesamientoPosterior(ProcesamientoPosterior unProcesamiento) { 
 
		misProcesamientos.add(unProcesamiento) 
	} 
	
	def public void agregarObserver(ConsultaObserver unObserver){
		observadores.add(unObserver)
	}
	 
	def consultarRecetas(Repositorio_Receta unRepo, Usuario unUsuario){ 
		 
		 var List<Receta> recetasTodas = new ArrayList<Receta> 
   		 var List<Receta> recetasFiltradas = new ArrayList<Receta> 
   		   
		recetasTodas = this.decimeTodasTusRecetas(unRepo, unUsuario).toList()		 
 
		recetasFiltradas = (recetasTodas.filter[receta| !(this.getMiFiltro.exists[filtro|filtro.filtramePorMisFiltros(receta,unUsuario)]) ] ).toList() 
		 
		var rece = ProcesameTodasTusRecetas(recetasFiltradas)
//		if(!(monitorDeConsultas==null) ) {
//		this.monitorDeConsultas.monitoreameLasCosultas (rece, unUsuario)
//		}
		
		
		guardarBusqueda(unRepo,unUsuario,rece)
		
		seActivaElObserver(observadores,rece, unUsuario)
		
		 
		return rece 
	}
	
	def private seActivaElObserver(List<ConsultaObserver> observers, Iterable<Receta> recetas, Usuario usuario) {
		
		observadores.forEach[unObse|unObse.seRealizoConsulta(recetas, usuario)]
	}
	
	def void guardarBusqueda(Repositorio_Receta repo, Usuario usuario, Iterable<Receta> lRecetas){
		repositorios.add(repo)
		usuarios.add(usuario)
		recetas.addAll(lRecetas)
	}
	
	 
	 def private List<Receta> decimeTodasTusRecetas(Repositorio_Receta unRepo, Usuario unUsuario ){ 
    var List<Receta> Rece = new ArrayList<Receta> 
     
    //TODAS LAS RECETAS PUBLICAS DEL REPOSITORIO 
    for (item: unRepo.getRecetas_Publicas){Rece.add(item)} 
     
    //TODAS LAS RECETAS COMPARTIDAS DEL GRUPO 
    for (itGru: unUsuario.getMisGrupos ) { 
    	for (itGruRe: itGru.getMisRecetas) { 
    		Rece.add(itGruRe) 
    	} 
    } 
 
    //TODAS LAS RECETAS COMPARTIDAS DE LOS USUARIOS DEL GRUPO 
    for (itGru: unUsuario.getMisGrupos ) { 
    	for (itGruUs: itGru.misUsuarios) { 
    		if (itGruUs != unUsuario){ 
    		for (itGruRe: itGruUs.getMisRecetas) { 
    		Rece.add(itGruRe) 
    		}} 
    	} 
    } 
 
    for (misR: unUsuario.getMisRecetas){ 
    	Rece.add(misR) 
    } 
    
    return Rece 
    } 
	 
     
        def private Iterable<Receta> ProcesameTodasTusRecetas(Iterable<Receta> Recetas){ 
    	 
    var Iterable<Receta> Rece = new ArrayList<Receta> 
     
	Rece = Recetas 
 
	 
    for (item: getMisProcesamientos){ 
     Rece = this.procesoRecursivo(Rece,item) 
     } 
     
  
    return Rece 
    } 
     
    private def Iterable<Receta> procesoRecursivo(Iterable<Receta> unaLi,ProcesamientoPosterior unProceso) { 
    	var Iterable<Receta> Rece = new ArrayList<Receta> 
    	Rece = unaLi 
    	Rece = unProceso.procesamePor(unaLi) 
    	return Rece 
    } 
     
      def void actualizarObservers(ConsultaObserver unObservador){
    	observadores.add(unObservador)
    } 
    
     
 
}
    
  


