!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frasesParaJugadoresDesconocidos frasesParaJugadoresPrometedores cantidadDeInteraccionesPorJugador'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 10/2/2021 23:26:30'!
interactuarCon: personajeJugable
	|mensaje|
	self recordarInteraccionCon:personajeJugable.
	mensaje := self responderSegunCantidadDeInteraccionesCon: personajeJugable.
	self ascenderSiCorresponde: personajeJugable.
	^mensaje.
	
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 17:28:56'!
olvidarJugador: personajeJugable
	cantidadDeInteraccionesPorJugador at: personajeJugable put: 0.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'LEI 9/30/2021 05:24:02'!
olvidarTodosLosJugadores
	cantidadDeInteraccionesPorJugador := Dictionary new.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 10/2/2021 23:06:18'!
ascenderAPrometedor: personajeJugable
	PuebloDeRiverWood reconocerPrometedorAJugador: personajeJugable .
	PuebloDeRiverWood olvidarInteraccionesCon: personajeJugable.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 10/2/2021 23:25:53'!
ascenderSiCorresponde: personajeJugable
	(self esCalificadoComoPrometedor: personajeJugable ) ifTrue: [self ascenderAPrometedor: personajeJugable].! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 10/2/2021 23:24:31'!
esCalificadoComoPrometedor: personajeJugable
	|cantidadInteracciones|
	cantidadInteracciones := cantidadDeInteraccionesPorJugador at: personajeJugable.
	^ cantidadInteracciones >= (frasesParaJugadoresDesconocidos size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LEI 9/30/2021 05:08:28'!
recordarInteraccionCon: personajeJugable
	|contieneRecuerdo|
	
	contieneRecuerdo := cantidadDeInteraccionesPorJugador  includesKey: personajeJugable.
	
	contieneRecuerdo 
	 ifTrue:[
		|cantidadInteraccionesPrevias|
		cantidadInteraccionesPrevias :=  cantidadDeInteraccionesPorJugador at: personajeJugable.
		cantidadDeInteraccionesPorJugador at: personajeJugable put: (cantidadInteraccionesPrevias +1).]
	ifFalse:[
		cantidadDeInteraccionesPorJugador at: personajeJugable put: 1.		].
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 10/2/2021 23:27:01'!
responderSegunCantidadDeInteraccionesCon: personajeJugable
	|dialogoAElegir esPrometedor|
	
	dialogoAElegir  := cantidadDeInteraccionesPorJugador at: personajeJugable ifAbsent: [1].
	esPrometedor  := PuebloDeRiverWood esPersonajePrometedor: personajeJugable.
	
	esPrometedor 
	ifTrue:[
		^frasesParaJugadoresPrometedores at: (dialogoAElegir min: frasesParaJugadoresPrometedores size) ]
	ifFalse:[
				
		^ frasesParaJugadoresDesconocidos at: (dialogoAElegir min: frasesParaJugadoresDesconocidos size).] .! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:30:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaJugadoresDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesParaJugadoresPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FLM 9/28/2021 17:01:32'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FLM 9/28/2021 17:10:30'!
hamilton
	^Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FLM 9/28/2021 17:10:36'!
tirion
	^Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 10/2/2021 23:09:33'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^PuebloDeRiverWood esPersonajePrometedor: unPersonaje .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LEI 9/30/2021 05:24:27'!
hacerQueLaCuranderaOlvideSusInteracciones
	(self carolinaLaCurandera) olvidarTodosLosJugadores.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 10/2/2021 23:09:49'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverWood olvidarCalificacionesSobrePersonajesJugables.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 10/2/2021 23:10:09'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverWood reconocerPrometedorAJugador: Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'LEI 9/30/2021 05:26:00'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarTodosLosJugadores .
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FLM 9/28/2021 16:39:27'!
hamilton
	^Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FLM 9/28/2021 16:46:29'!
tirion
	^Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LEI 9/30/2021 05:25:51'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarTodosLosJugadores.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FLM 10/2/2021 23:08:40'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverWood olvidarCalificacionesSobrePersonajesJugables.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FLM 10/2/2021 23:09:01'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverWood reconocerPrometedorAJugador: Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloDeRiverWood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloDeRiverWood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloDeRiverWood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloDeRiverWood class
	instanceVariableNames: 'personajesNoJugables personajesJugablesPrometedores'!

!PuebloDeRiverWood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:03:39'!
esPersonajePrometedor: personajeJugable
	^ personajesJugablesPrometedores includes: personajeJugable .! !

!PuebloDeRiverWood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:30:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	personajesNoJugables := ((OrderedCollection new) add: TreborElGuardiaDeSkyrim; add: CarolinaLaCuranderaDeRiverwood; yourself).
	personajesJugablesPrometedores := ((OrderedCollection new)).! !

!PuebloDeRiverWood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:08:09'!
olvidarCalificacionesSobrePersonajesJugables
	personajesJugablesPrometedores := OrderedCollection new.! !

!PuebloDeRiverWood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 22:46:40'!
olvidarInteraccionesCon: personajeJugable
	personajesNoJugables do: [:personajeNoJugable | personajeNoJugable olvidarJugador: personajeJugable].! !

!PuebloDeRiverWood class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:01:19'!
reconocerPrometedorAJugador: personajeJugable
	|existePreviamente|
	existePreviamente :=personajesJugablesPrometedores includes: personajeJugable.
	existePreviamente ifFalse: [personajesJugablesPrometedores add: personajeJugable ].! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesparaJugadoresDesconocidos frasesParaJugadoresPrometedores cantidadDeInteraccionesPorJugador'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:10:04'!
interactuarCon: personajeJugableAInteractuar
	
	self recordarInteraccionCon:personajeJugableAInteractuar.
	^ self responderSegunCantidadDeInteraccionesCon: personajeJugableAInteractuar.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 17:29:36'!
olvidarJugador: personajeJugable
	cantidadDeInteraccionesPorJugador at: personajeJugable put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LEI 9/30/2021 05:25:14'!
olvidarTodosLosJugadores
	cantidadDeInteraccionesPorJugador := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'LEI 9/30/2021 05:06:03'!
recordarInteraccionCon: personajeJugable
	|contieneRecuerdo|
	
	contieneRecuerdo := cantidadDeInteraccionesPorJugador  includesKey: personajeJugable.
	
	
	contieneRecuerdo  
	ifTrue:[
		|cantidadInteraccionesPrevias|
		cantidadInteraccionesPrevias :=  cantidadDeInteraccionesPorJugador at: personajeJugable.
		cantidadDeInteraccionesPorJugador at: personajeJugable put: (cantidadInteraccionesPrevias +1).]
	ifFalse:[
		cantidadDeInteraccionesPorJugador at: personajeJugable put: 1.		].
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'FLM 10/2/2021 23:05:06'!
responderSegunCantidadDeInteraccionesCon: personajeJugable
	
	|dialogoAElegir esPrometedor|
	
	dialogoAElegir  := cantidadDeInteraccionesPorJugador at: personajeJugable ifAbsent: [1].
	esPrometedor := PuebloDeRiverWood esPersonajePrometedor: personajeJugable.
	
	
	esPrometedor 
	ifTrue:[
			^frasesParaJugadoresPrometedores at: (dialogoAElegir min: frasesParaJugadoresPrometedores size) ]
		
	ifFalse:[		^ frasesparaJugadoresDesconocidos at: (dialogoAElegir min: frasesparaJugadoresDesconocidos size).] .! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FLM 10/2/2021 23:30:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesparaJugadoresDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaJugadoresPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (Hamilton->3); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
PuebloDeRiverWood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!