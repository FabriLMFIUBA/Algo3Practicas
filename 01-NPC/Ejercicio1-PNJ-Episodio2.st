!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frases frasesParaJugadoresPrometedores cantidadDeInteracciones cantidadDeInteraccionesPorJugador'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:58:05'!
interactuar
	self recordarInteraccion.
	^ self responderSegunCantidadDeInteracciones! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:58:05'!
interactuarCon: personajeJugableAInteractuar
	
	self recordarInteraccionCon:personajeJugableAInteractuar.
	^ self responderSegunCantidadDeInteraccionesCon: personajeJugableAInteractuar.
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:58:05'!
olvidar	cantidadDeInteracciones  := 0.
	cantidadDeInteraccionesPorJugador := Dictionary new.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 17:28:56'!
olvidarJugador: personajeJugable
	cantidadDeInteraccionesPorJugador at: personajeJugable put: 0.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 17:29:56'!
ascenderAPrometedor: personajeJugable
	personajeJugable hacerPrometedor.
	self olvidarJugador: personajeJugable .
	TreborElGuardiaDeSkyrim olvidarJugador: personajeJugable .! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 17:35:41'!
esCalificadoComoPrometedor: cantidadInteracciones
	^ cantidadInteracciones >= (frases size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 16:58:05'!
recordarInteraccion
	cantidadDeInteracciones := cantidadDeInteracciones + 1.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 16:58:05'!
recordarInteraccionCon: personajeJugable
	|contieneRecuerdo|
	contieneRecuerdo := cantidadDeInteraccionesPorJugador  includesKey: personajeJugable.
	contieneRecuerdo  ifTrue:[
		|cantidadInteraccionesPrevias|
		cantidadInteraccionesPrevias :=  cantidadDeInteraccionesPorJugador at: personajeJugable.
		cantidadDeInteraccionesPorJugador at: personajeJugable put: (cantidadInteraccionesPrevias +1).]
	ifFalse:[
		cantidadDeInteraccionesPorJugador at: personajeJugable put: 1.		].
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 16:58:05'!
responderSegunCantidadDeInteracciones
	^ frases at: (cantidadDeInteracciones min: frases size)! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 17:26:52'!
responderSegunCantidadDeInteraccionesCon: personajeJugable
	|dialogoAElegir|
	dialogoAElegir  := cantidadDeInteraccionesPorJugador at: personajeJugable ifAbsent: [1].
	personajeJugable esJugadorPrometedorEnRiverWood ifTrue:[
		^frasesParaJugadoresPrometedores at: (dialogoAElegir min: frases size) ]
	ifFalse:[
		
		(self esCalificadoComoPrometedor: dialogoAElegir) ifTrue:[
			self ascenderAPrometedor: personajeJugable .
		] .
	^ frases at: (dialogoAElegir min: frases size).] .! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 17:36:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesParaJugadoresPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hamilton class' category: 'Ejercicio1-PNJ-Episodio2'!
Hamilton class
	instanceVariableNames: 'esPrometedorEnRiverWood'!

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:34:07'!
esJugadorPrometedorEnRiverWood
	^esPrometedorEnRiverWood ! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:37:04'!
hacerDesconocido
	esPrometedorEnRiverWood := false.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:36:45'!
hacerPrometedor
	esPrometedorEnRiverWood := true.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 17:36:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	esPrometedorEnRiverWood := false.! !


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


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 17:31:18'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^unPersonaje esJugadorPrometedorEnRiverWood.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 17:08:06'!
hacerQueLaCuranderaOlvideSusInteracciones
	(self carolinaLaCurandera) olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 17:09:53'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	(self hamilton) hacerDesconocido .
	(self tirion) hacerDesconocido.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 17:09:32'!
hacerQueRiverwoodVeaPrometedorAHamilton
	(self hamilton) hacerPrometedor.! !

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

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
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


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 16:52:35'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Hamilton hacerDesconocido.
	Tirion hacerDesconocido.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FLM 9/28/2021 16:39:38'!
hacerQueRiverwoodVeaPrometedorAHamilton
	(self hamilton) hacerPrometedor. ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tirion class' category: 'Ejercicio1-PNJ-Episodio2'!
Tirion class
	instanceVariableNames: 'esPrometedorEnRiverWood'!

!Tirion class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:45:46'!
esJugadorPrometedorEnRiverWood
	^esPrometedorEnRiverWood ! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:45:46'!
hacerDesconocido
	esPrometedorEnRiverWood := false.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 16:45:46'!
hacerPrometedor
	esPrometedorEnRiverWood := true.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 17:36:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	esPrometedorEnRiverWood := false.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frases frasesParaJugadoresPrometedores cantidadDeInteracciones cantidadDeInteraccionesPorJugador'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'JMB 9/18/2021 11:24:55'!
interactuar
	self recordarInteraccion.
	^ self responderSegunCantidadDeInteracciones! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:10:04'!
interactuarCon: personajeJugableAInteractuar
	
	self recordarInteraccionCon:personajeJugableAInteractuar.
	^ self responderSegunCantidadDeInteraccionesCon: personajeJugableAInteractuar.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 16:12:54'!
olvidar	cantidadDeInteracciones  := 0.
	cantidadDeInteraccionesPorJugador := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FLM 9/28/2021 17:29:36'!
olvidarJugador: personajeJugable
	cantidadDeInteraccionesPorJugador at: personajeJugable put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'JMB 9/18/2021 11:25:28'!
recordarInteraccion
	cantidadDeInteracciones := cantidadDeInteracciones + 1.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 16:27:25'!
recordarInteraccionCon: personajeJugable
	|contieneRecuerdo|
	contieneRecuerdo := cantidadDeInteraccionesPorJugador  includesKey: personajeJugable.
	contieneRecuerdo  ifTrue:[
		|cantidadInteraccionesPrevias|
		cantidadInteraccionesPrevias :=  cantidadDeInteraccionesPorJugador at: personajeJugable.
		cantidadDeInteraccionesPorJugador at: personajeJugable put: (cantidadInteraccionesPrevias +1).]
	ifFalse:[
		cantidadDeInteraccionesPorJugador at: personajeJugable put: 1.		].
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'JMB 9/18/2021 11:35:15'!
responderSegunCantidadDeInteracciones
	^ frases at: (cantidadDeInteracciones min: frases size)! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'FLM 9/28/2021 16:45:06'!
responderSegunCantidadDeInteraccionesCon: personajeJugable
	|dialogoAElegir|
	dialogoAElegir  := cantidadDeInteraccionesPorJugador at: personajeJugable ifAbsent: [1].
	personajeJugable esJugadorPrometedorEnRiverWood ifTrue:[
		^frasesParaJugadoresPrometedores at: (dialogoAElegir min: frases size) ]
	ifFalse:[^ frases at: (dialogoAElegir min: frases size).] .! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FLM 9/28/2021 17:36:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaJugadoresPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteracciones := 0.
	cantidadDeInteraccionesPorJugador := ((Dictionary new) add: (Hamilton->0); add: (Tirion->0); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Tirion initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!