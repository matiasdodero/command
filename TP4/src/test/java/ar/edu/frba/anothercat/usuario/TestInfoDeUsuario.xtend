package ar.edu.frba.anothercat.usuario

import org.junit.Test
import org.junit.Assert
import org.junit.Before
import java.util.Date
import ar.edu.frba.anothercat.receta.Ingrediente

class TestInfoDeUsuario{
	Usuario pepe

	@Before
	def void init(){
	    pepe = new Usuario => [
			nombre = "Gervasio"
			sexo = "m"
			fechaDeNacimiento = new Date(01-01-1987)
			altura = 1.78
			peso = 78
			rutinaE = tipoRutina.NADA
		]
	}
	@Test
	def usuarioSinNombre(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Nombre
		pepe.nombre = null
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioSinPeso(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Peso
		pepe.peso = 0
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioSinAltura(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Altura
		pepe.altura = 0
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioSinFechaDeNacimiento(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Falta Fecha de Nacimiento
		pepe.altura = 0
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioConNombreCorto(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Cambiamos el nombre por uno de menos de 4 letras
		pepe.nombre = "Any"
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioDiabeticoSinSexoConPreferencia(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es diabetico
		pepe.agregarCondicion(new Diabetico)
		//Agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "Fruta" calorias = 2])
		
		//No tiene sexo Pepe
		pepe.sexo = null
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioDiabeticoConSexoSinPreferencias(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es diabetico
		pepe.agregarCondicion(new Diabetico)
		
		//Debe dar falso, todav�a no tiene la preferencia
		Assert.assertFalse(pepe.sosValido())
		
		//Le agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "Fruta" calorias = 2])
		
		Assert.assertTrue(pepe.sosValido())
	}

	@Test
	def usuarioHipertensoSinPreferencia(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es hipertenso
		pepe.agregarCondicion(new Hipertenso)
		
		//Debe dar falso, todav�a no tiene la preferencia
		Assert.assertFalse(pepe.sosValido())
		
		//Le agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "Fruta" calorias = 2])
		
		//Ahora que ya tiene preferencia, debe dar v�lido
		Assert.assertTrue(pepe.sosValido())
	}

	@Test
	def usuarioVeganoConPreferenciaCarnivora(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Le decimos que es vegano
		pepe.agregarCondicion(new Vegano)
		
		//Debe dar verdadero, todav�a no tiene la preferencia
		Assert.assertTrue(pepe.sosValido())
		
		//Le agregamos una preferencia
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "chivito" tipoIngrediente = "carne" calorias = 40])
		
		//Como la preferencia es Carne, debe dar inv�lido
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioNacioEnElFuturo(){
		//El usuario inicialmente es v�lido
		Assert.assertTrue(pepe.sosValido())
		
		//Le cambiamos la fecha de nacimiento por una del futuro
//		pepe.fech = "05-23-2015"
		
		//Ahora debe ser inv�lido
		Assert.assertFalse(pepe.sosValido())
	}

	@Test
	def usuarioConImcDebajoDe18(){
		pepe.altura = 1.7
		pepe.peso = 50
		
		//El IMC = 17.3, debe dar no saludable
		Assert.assertFalse(pepe.seguisDietaSaludable())
	}

	@Test
	def usuarioConImcPorEncimaDe30(){
		pepe.altura = 1.6
		pepe.peso = 77

		//El IMC = 30.07, debe dar no saludable
		Assert.assertFalse(pepe.seguisDietaSaludable())
	}

	@Test
	def usuarioConImcEnRango18a30(){
		//El IMC = 24.61, sin precondiciones, es saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}

	@Test
	def usuarioCeliacoConRutinaSaludable(){
		//El usuario inicialmente sigue una rutina saludable, porque tiene el imc entre 18 y 30 y no tiene enfermedades
		Assert.assertTrue(pepe.seguisDietaSaludable())
		
		//Le decimos a pepe que es cel�aco
		pepe.agregarCondicion(new Celiaco)
		
		//Como los cel�acos no cumplen condiciones, deber�a ser v�lido
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}

	@Test
	def usuarioVeganoConRutinaSaludable(){
		//El usuario inicialmente sigue una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
		
		//Le decimos a pepe que es vegano
		pepe.agregarCondicion(new Vegano())

		//Es vegano, pero no subsana su condici�n todav�a
		Assert.assertFalse(pepe.seguisDietaSaludable())
		
		//Ahora le decimos que le gusta la fruta, y tiene que seguir una rutina saludable
		pepe.agregarPrefer(new Ingrediente => [nombreIngrediente = "Manzana" tipoIngrediente = "fruta" calorias = 2])
		
		//Ahora debe seguir una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}
	
	@Test
	def usuarioHipertensoConRutinaSaludable(){
		//El usuario inicialmente sigue una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())

		//Le decimos a pepe que es Hipertenso
		pepe.agregarCondicion(new Hipertenso())

		//Es hipertenso, pero no subsana su condici�n todav�a
		Assert.assertFalse(pepe.seguisDietaSaludable())

		//Ahora le decimos a pepe que sigue una rutina activa intensiva con ejercicio adicional
		pepe.rutinaE = tipoRutina.INTENSIVO

		//Ahora debe seguir una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}
	
	@Test
	def usuarioDiabeticoConEjercicioYConRutinaSaludable(){
		//El usuario inicialmente sigue una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	
		//Le decimos a pepe que es Diabetico
		pepe.agregarCondicion(new Diabetico())

		//Es Diab�tico, pero no subsana su condici�n todav�a
		Assert.assertFalse(pepe.seguisDietaSaludable())

		//Ahora le decimos a pepe que sigue una rutina activa
		pepe.rutinaE = tipoRutina.PREINTENSIVO

		//Ahora debe seguir una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}

	@Test
	def usuarioDiabeticoConBajoPesoYConRutinaSaludable(){
		//El usuario inicialmente sigue una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	
		//Le decimos a pepe que es Diabetico
		pepe.agregarCondicion(new Diabetico())

		//Es Diab�tico, pero no subsana su condici�n todav�a
		Assert.assertFalse(pepe.seguisDietaSaludable())

		//Ahora le decimos a pepe que es delgado
		pepe.peso = 69

		//Ahora debe seguir una rutina saludable
		Assert.assertTrue(pepe.seguisDietaSaludable())
	}
}