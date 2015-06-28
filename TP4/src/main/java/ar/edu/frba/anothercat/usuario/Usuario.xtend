package ar.edu.frba.anothercat.usuario

import java.text.SimpleDateFormat
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.TransactionalAndObservable
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.ProcesamientoPosterior
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.estadoReceta

@Accessors
@TransactionalAndObservable
class Usuario extends Entity {
	Date fechaDeNacimiento
	String nombre
	String sexo
	double altura
	int peso
	
	List<CondicionPreexistente> precondiciones = new ArrayList<CondicionPreexistente>	
	List<Ingrediente> preferencias = new ArrayList<Ingrediente>
	List<Ingrediente> disgustos = new ArrayList<Ingrediente>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<Receta> favoritas = new ArrayList<Receta>
	
//	String rutina
	tipoRutina rutinaE
	
	def boolean sosValido() {
		if ((nombre == null) || (peso == 0) || (altura == 0) || (fechaDeNacimiento == null) || (rutinaE.equals(null))) {
			return false
		}
		if (nombre.length() <= 4)
		{
			return false
		}
		if (precondiciones.isEmpty() == false)
		{
			if (precondiciones.forall [precondicion | precondicion.cumpleValidacion(this)] == false)
			{return false} 		
		}
         
		if (!validaFechaNacimiento()) {         
           
         	return false
         }

		return true	
	}
	
	    def Date convertirFecha(String unafech) {
		var SimpleDateFormat formatoDelTexto
		
		formatoDelTexto = new SimpleDateFormat("MM-dd-yyyy");
		var Date fecha
        
		fecha = formatoDelTexto.parse(unafech);
		
		return fecha
	}
	

		def validaFechaNacimiento() {
		fechaDeNacimiento < new Date()
	}
	
	def public void agregarCondicion(CondicionPreexistente unaCond) {

		precondiciones.add(unaCond)

	}
	
	
	def public void agregarPrefer(Ingrediente unaPreferencia) {

		preferencias.add(unaPreferencia)

	}	
	
	def public void agregarDisgusto(Ingrediente unDisgusto) {

		disgustos.add(unDisgusto)

	}	
	
	def double calcularImc()
	{
		return peso/(altura*altura)
	}
	
	def public boolean seguisDietaSaludable(){
		if (this.calcularImc <= 18 || this.calcularImc >= 30 && precondiciones.size < 1){
			return false
		}else if (this.calcularImc > 18 && this.calcularImc < 30 && precondiciones.size < 1){
			return true
		}else{
		 	return precondiciones.forall [precondicion | precondicion.subsanasteCondicionesPreEx(this)]
		}
	}
	
	def boolean puedoVerReceta(Receta unaReceta){
		
		return (unaReceta.getEstado == estadoReceta.Publica || this.misRecetas.exists[unaRec| unaRec == unaReceta]
			|| this.misGrupos.exists[unGrupo| unGrupo.misRecetas.exists[unaRec| unaRec == unaReceta]]
			|| this.misGrupos.exists[unGrupo| unGrupo.misUsuarios.exists[unUsuario| unUsuario.misRecetas.exists[unaRece | unaRece == unaReceta]]]
		)
		
	}
	 def boolean puedoModificarReceta(Receta unaReceta){
	 	return ( unaReceta.getEstado == estadoReceta.Publica || !(unaReceta.getEstado == estadoReceta.Publica) 
	 		&& this.misRecetas.exists[unaRec| unaRec == unaReceta]
	 	)
	}
	
	def public agregarReceta(Receta unaReceta) {
		
		var Receta unaNuevaR = new Receta
		
		unaNuevaR.setNombrePlato(unaReceta.getNombrePlato)
		unaNuevaR.setIngredientes(unaReceta.getIngredientes)
		unaNuevaR.setCondimentos(unaReceta.getCondimentos)
		unaNuevaR.setPasos(unaReceta.getPasos)
		unaNuevaR.setCondiciones(unaReceta.getCondiciones)
		unaNuevaR.setTotalCalorias(unaReceta.getTotalCalorias)
		unaNuevaR.setDificultad(unaReceta.getDificultad)
		unaNuevaR.setTemporadas(unaReceta.getTemporadas)
							
			
		if (unaReceta.validar())
		{  
			if (precondiciones.exists[unaPre | unaPre.esInadecuadaPara(unaReceta)]) 
			{	throw new NoCumpleRequisitosException("No es apto por sus precondiciones")}
			else{ 
				unaNuevaR.setEstado(estadoReceta.Privada)
				misRecetas.add(unaNuevaR)
				
			}

		}
		
	}
	
	
	def public agregarRecetaFavorita(Receta unaReceta) {
			
		if (unaReceta.validar())
		{  
			if (precondiciones.exists[unaPre | unaPre.esInadecuadaPara(unaReceta)]) 
			{	throw new NoCumpleRequisitosException("No es apto")}
			else{
				favoritas.add(unaReceta)	
			}

		}
		
	}
	
	
	def public eliminarReceta(Receta unaReceta) {
									
		if (misRecetas.exists[unaR | unaR == unaReceta])
		{  
				misRecetas.remove(unaReceta)	
		}
		else 
    	{
    		throw new NoCumpleRequisitosException("La receta no est� contenida")
    	}   	
		
	}
	
	def void modificarNombrePlato(Receta unaReceta, String nombrePlatoAux){

		
    	if(puedoModificarReceta(unaReceta) == true){
    		
    			for(item:misRecetas){
    				if (item.getNombrePlato()==unaReceta.getNombrePlato()) {
    					item.setNombrePlato(nombrePlatoAux)
    				}
    			}
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar el nombre del plato de la Receta")
    	}    	
    	
    }
    
    def void modificarTotalCalorias(Receta unaReceta, int totalCaloriasAux){

		
    	if(puedoModificarReceta(unaReceta) == true){
    		
    			for(item:misRecetas){
    				if (item.getNombrePlato()==unaReceta.getNombrePlato()) {
    					item.setTotalCalorias(totalCaloriasAux)
    				}
    			}
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar el total de calorias de la Receta ")
    	}    	
    	
    }
    
    def void modificarDificultad(Receta unaReceta, String dificultadAux){

		
    	if(puedoModificarReceta(unaReceta) == true){
    		
    			for(item:misRecetas){
    				if (item.getNombrePlato()==unaReceta.getNombrePlato()) {
    					item.setDificultad(dificultadAux)
    				}
    			}
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar la dificultad de la Receta ")
    	}    	
    	
    }
    
    def void modificarIngredientesReceta(Receta unaReceta, Ingrediente unIngre){

		
    	if(puedoModificarReceta(unaReceta) == true){
    		
    			for(item:misRecetas){
    				if (item.getNombrePlato()==unaReceta.getNombrePlato()) {
    					item.agregarIngrediente(unIngre)
    				}
    			}
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar los ingredientes de la Receta ")
    	}    	
    	
    }
    
    def void modificarCondimentosReceta(Receta unaReceta, Condimento unCond){

		
    	if(puedoModificarReceta(unaReceta) == true){
    			
    			for(item:misRecetas){
    				if (item.getNombrePlato()==unaReceta.getNombrePlato()) {
    					item.agregarCondimento(unCond)
    				}
    			}
    	}
    	
    	else 
    	{
    		throw new NoCumpleRequisitosException("No puede modificar los condimentos de la Receta ")
    	}    	
    	
    }
    
    def void solicitarAgregarmeAlGrupo(Grupo unGrupo){
    	unGrupo.agregarUsuario(this)
    }
    
	
	def estasEnElRepoUsuarios(RepoUsuarios unRepo){
		return unRepo.sosAceptado(this)
	}
    
    def modificarFecha(Date unaFecha,RepoUsuarios unRepo){
    	fechaDeNacimiento = unaFecha
    	if (this.estasEnElRepoUsuarios(unRepo)) {
    		unRepo.update(this)
    	}
    }
    
    def modificarNombre(String unNombre,RepoUsuarios unRepo){
    	this.setNombre(unNombre)
    	if (this.estasEnElRepoUsuarios(unRepo)) {
    		unRepo.update(this)
    	}
    }
    
    
    def modificarSexo(String unSexo,RepoUsuarios unRepo){
    	this.setSexo(unSexo)
    	if (this.estasEnElRepoUsuarios(unRepo)) {
    		unRepo.update(this)
    	}
    }
    
    
    
    def modificarAltura(double unaAltura,RepoUsuarios unRepo){
    	this.setAltura(unaAltura)
    	if (this.estasEnElRepoUsuarios(unRepo)) {
    		unRepo.update(this)
    	}
    }
    
    def modificarPeso(int unPeso,RepoUsuarios unRepo){
    	this.setPeso(unPeso)
    	if (this.estasEnElRepoUsuarios(unRepo)) {
    		unRepo.update(this)
    	}
    }
    
    def boolean sosDiabetico(){
    	precondiciones.exists[unaP | unaP.decimeQueCondicionTenes()==precondicionTipo.diabetico]
    }
    
    def boolean sosHipertenso(){
    	precondiciones.exists[unaP | unaP.decimeQueCondicionTenes()==precondicionTipo.hipertenso]
    }
    
    def boolean sosCeliaco(){
    	precondiciones.exists[unaP | unaP.decimeQueCondicionTenes()==precondicionTipo.celiaco]
    }
    
    def boolean sosVegano(){
    	precondiciones.exists[unaP | unaP.decimeQueCondicionTenes()==precondicionTipo.vegano]
    }
    
    
    
    
   }

   public enum tipoRutina {
   	LEVE,
	NADA,
	MEDIANO,
	INTENSIVO,
	PREINTENSIVO;   	
   }
   
