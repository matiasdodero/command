package ar.edu.frba.anothercat.usuario;

import org.uqbar.commons.model.CollectionBasedHome
import java.util.Set
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import java.util.Date
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroDisgusto
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.ProcesamientoPosterior
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import java.util.ArrayList

@Accessors
class RepoUsuarios extends CollectionBasedHome<Usuario>{
	
	Set<Usuario> Aceptados = new HashSet<Usuario>;
	//Set<Usuario> Pendientes
	Set<UsuarioRechazado> Rechazados = new HashSet<UsuarioRechazado>;
	
	UsuarioInter UsuarioServer

	
	override protected getCriterio(Usuario arg0) {
		null
	}
	
	def void init() {

		var Diabetico unaCond = new Diabetico
		var Ingrediente unIngr = new Ingrediente
		var Ingrediente otroIngr = new Ingrediente
		var Grupo unGrupo = new Grupo
		var FiltroReceta unFiltro = new FiltroDisgusto
		var ProcesamientoPosterior unProc = new Pares
		var Receta receta1 = new Receta => [
		nombrePlato = "plato de receta 1"
		sumarCalorias(100)
		estado = estadoReceta.Publica
		agregarIngrediente(new Ingrediente)
		agregarCondimento(new Condimento)		
			]	
		var Receta receta2 = new Receta
		=> [
		nombrePlato = "plato de receta 2"
		sumarCalorias(100)
		estado = estadoReceta.Publica
		agregarIngrediente(new Ingrediente)
		agregarCondimento(new Condimento)		
			]	
	    this.create("cesar","m",new Date(),1.7,80,estadoRepo.Pendiente,unaCond , unIngr, 
	    	otroIngr , receta1, unGrupo, receta2, unFiltro, unProc , tipoRutina.INTENSIVO)
	    this.create("pablo","m",   new Date() ,1.8,70,estadoRepo.Pendiente,unaCond , unIngr, 
	    	otroIngr , receta1, unGrupo, receta2, unFiltro, unProc , tipoRutina.INTENSIVO)
	}
	
	def void create(String pNombre, String pSexo, Date pFecha, double pAltura, int pPeso, estadoRepo pEstadoMiRepo,
		CondicionPreexistente pUnListCondic, Ingrediente pPreferencias, Ingrediente pDisgustos, Receta pMisRecetas,
		Grupo pMisGrupos, Receta pFavoritas, FiltroReceta pMiFiltro, ProcesamientoPosterior pMisProcesamientos,
		tipoRutina pRutinaE) {
		this.create(new Usuario => [
			setNombre(pNombre)
			setSexo(pSexo)
			setFechaDeNacimiento(pFecha) 
			altura = pAltura
			peso = pPeso
			agregarCondicion(pUnListCondic)
			agregarPrefer(pPreferencias)
			agregarDisgusto(pDisgustos)
			agregarReceta(pMisRecetas)
			solicitarAgregarmeAlGrupo(pMisGrupos)
			agregarRecetaFavorita(pFavoritas)
			//agregarFiltro(pMiFiltro)
			//agregarProcesamientoPosterior(pMisProcesamientos)
			rutinaE = pRutinaE
			
		])
	}
	
	override createExample() {
		new Usuario
	}
	
	override getEntityType() {
		typeof(Usuario)
	}
	
	def void add(Usuario unUsu) {
		if (!this.existisEnMiLista(unUsu)){
		usuarios.add(unUsu)
		//System.out.println(UsuarioServer.getContaInscriptos)
		//this.totalDeAceptados()
		//System.out.println(this.getUsuarioServer.getContaInscriptos)
		//Pendientes.add(unUsu)
		}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario ya está contenido en una lista")			
		}
	}	
	
	def void remove(Usuario unUsu) {
		if (this.existisEnMiLista(unUsu)){
		this.usuarios.remove(unUsu)
		//Pendientes.remove(unUsu)
		Aceptados.remove(unUsu)
		for (item:Rechazados){
			if (item.unUsuario == unUsu)
			{Rechazados.remove(item)}
		}}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario no está contenido en la lista de rechazados")			
		}
	}
	
	
	new() {
		this.init 
	}
	
	/*new(UsuarioInter miUsuarioS) {
		this.init
		UsuarioServer = miUsuarioS 
	}*/
	
	/*new(RepoServer Repo2000) {
		this()
		MiRepositorio = Repo2000
	}*/
	
	def getUsuariosPorNombre(Usuario unUsuario) {
		(ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepoUsuarios).get(unUsuario)
	}
	

	
	def Usuario get(Usuario unUsuario) {
		Aceptados.findFirst [ modelo | modelo.nombre.equals(unUsuario.getNombre) ]
	}
	

	
	override update(Usuario unUsu){
		for(item:Aceptados){
			if (item == unUsu) {
				Aceptados.remove(item)
				Aceptados.add(unUsu)
			}
		}
	}
	
	def List<Usuario> getUsuarios() {
		allInstances	
	}
	
	
	def Set<Usuario> list(Usuario unUsuarioDado) {
		var List<Usuario> ListaAux = new ArrayList<Usuario>	
		var List<Usuario> ListaAux2 = new ArrayList<Usuario>		
		ListaAux = (Aceptados.filter[unUsuario | unUsuario.nombre.equals(unUsuarioDado.getNombre) ]).toList

		if (!unUsuarioDado.getPrecondiciones.empty){
		ListaAux2 = (Aceptados.filter[unUsuario | unUsuario.nombre.equals(unUsuarioDado.getNombre) ]).toList
		//for(item: unUsuarioDado.getPrecondiciones){
		  //for (item2:ListaAux2) {
		  //	if (item2.precondiciones.exists[unaPrec | unaPrec == item])
		  //	ListaAux =  ListaAux2.filter[ unU | unU.precondiciones.exists[unaPrec | unaPrec == item]].toList
		 	ListaAux =  ListaAux2.filter[ unU | unU.precondiciones.exists[unaPrec | unUsuarioDado.getPrecondiciones.contains(unaPrec)]].toList
		  //}}
		}
		return ListaAux.toSet()
	}
	

	
	def existisEnMiLista(Usuario unUsuario){
		//para pendientes
		return (usuarios.exists[unUsu | unUsu == unUsuario])
	}
	
	/*def sosPendiente(Usuario unUsuario){
		return (Pendientes.exists[unUsu | unUsu == unUsuario])
	}*/
	
	def sosAceptado(Usuario unUsuario){
		return (Aceptados.exists[unUsu | unUsu == unUsuario])
	}
	
	def sosRechazado(Usuario unUsuario){
		return (Rechazados.exists[unUsu | unUsu.unUsuario == unUsuario])
	}
	
	def aceptarUsuario(Usuario unUsu){
	if (this.existisEnMiLista(unUsu) 
		//&& this.sosPendiente(unUsu) 
		&& !this.sosAceptado(unUsu) && !this.sosRechazado(unUsu)){
			usuarios.remove(unUsu)
			Aceptados.add(unUsu)
			//UsuarioServer.contaAceptados = UsuarioServer.contaAceptados + 1
			}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario no está contenido en la lista de pendientes o ya esta rechazado")
		}
	}
	
	def rechazarUsuario(Usuario unUsu,String miMotivo){
		var UsuarioRechazado unRecha = new UsuarioRechazado
	if (this.existisEnMiLista(unUsu) 
		//&& this.sosPendiente(unUsu) 
		&& !this.sosAceptado(unUsu) && !this.sosRechazado(unUsu)){
	//		Pendientes.remove(unUsu)
			usuarios.remove(unUsu)
			unRecha.unUsuario = unUsu
			unRecha.setMotivo(miMotivo)
			Rechazados.add(unRecha)
			//UsuarioServer.contaRechazados = UsuarioServer.contaRechazados + 1
			}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario no está contenido en la lista de pendientes o ya esta rechazado")
		}
	}
	
	def echarUsuario(Usuario unUsu,String miMotivo){
	var UsuarioRechazado unRecha = new UsuarioRechazado
	if (!this.existisEnMiLista(unUsu)
		//&& !this.sosPendiente(unUsu)
		 && this.sosAceptado(unUsu) && !this.sosRechazado(unUsu)){
			Aceptados.remove(unUsu)
			unRecha.unUsuario = unUsu
			unRecha.setMotivo(miMotivo)
			Rechazados.add(unRecha)
			//UsuarioServer.contaRechazados = UsuarioServer.contaRechazados + 1
			}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario no está contenido en la lista de Aceptados o ya esta rechazado")
		}
	}
	
	def reabilitarUsuario(Usuario unUsu){
		var UsuarioRechazado unRecha = new UsuarioRechazado
		if (!this.existisEnMiLista(unUsu) 
			//&& !this.sosPendiente(unUsu) 
			&& !this.sosAceptado(unUsu) && this.sosRechazado(unUsu)){
			//Pendientes.add(unUsu)
			usuarios.add(unUsu)
			unRecha.unUsuario = unUsu

			for (item:Rechazados){
				if (item.unUsuario == unUsu){
					Rechazados.remove(item)
				}
			}
			//UsuarioServer.contaReinscriptos = UsuarioServer.contaReinscriptos + 1
			
		}
		else
		{
			throw new NoCumpleRequisitosException("El Usuario no está contenido en la lista de rechazados")			
		}
	}
	
	
}



   public enum estadoRepo {
   	Aceptado,
   	Rechazado,
	Pendiente;   	
   }
