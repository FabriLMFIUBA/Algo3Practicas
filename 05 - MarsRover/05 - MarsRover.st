!classDefinition: #MarsRoverTest category: '05 - MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRovers positionZeroZero positionZeroOne north south east oeast west'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!MarsRoverTest methodsFor: 'setUp' stamp: 'LEI 11/12/2021 17:32:48'!
addCommandsToMarsRover: aMarsRover
	
	
 	aMarsRover addCommand: (Backward withKey: $b).
	aMarsRover addCommand: (Forward withKey: $f).
	aMarsRover addCommand: (RotateRight withKey: $r).
	aMarsRover addCommand: (RotateLeft withKey: $l).! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'LEI 11/12/2021 17:42:14'!
setUp
	
	north:= North new.
	south:= South new.
	east := East new.
	west := West new.
	
	positionZeroZero := (0@0).
	
	positionZeroOne := (0@1).! !


!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:33:32'!
test01CuandoNoSeEjecutaComandosLapoisiconEsConLaQueSeInicio

	
	
	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction:north.
	marsRovers executeCommands: ''.
	self assert: marsRovers position = positionZeroZero . 
	
	
	
	marsRovers := MarsRover initialPosition: positionZeroOne cardinaDirecction:south.
	marsRovers executeCommands: ''.
	self assert: marsRovers position = positionZeroOne . ! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 15:49:52'!
test02
	
	marsRovers := MarsRover initialPosition: positionZeroOne cardinaDirecction: north .
	
	self assert: marsRovers position = positionZeroOne . ! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 15:49:15'!
test03CuandoNoSeEjecutaComandosLaDireccionCardinalSeMantieneConLaQueSeInicio

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	
	self assert: marsRovers cardinaPoint = north. 
	
	
	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: south.
	self assert: marsRovers cardinaPoint = south. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 15:50:32'!
test04

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	self deny: marsRovers cardinaPoint = south. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:31:57'!
test05CuandoSeLePasaUnComandoParaIrParaAdelanteVaAlaPosicionEsperada

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	self addCommandsToMarsRover: marsRovers.
	marsRovers executeCommands:  'f'.
	
	
	 self assert: marsRovers position = positionZeroOne.! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:32:02'!
test06UnComandoParaIrEnReversaVaALaPosicionEsperada

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	self addCommandsToMarsRover: marsRovers.
	marsRovers executeCommands:  'b'.
	
	
	 self assert: marsRovers position = (0 @ -1).! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:32:07'!
test07PasarUnComandoDeRotarAlaDerechaTieneElPuntoCardinalEsperado

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north .
	self addCommandsToMarsRover: marsRovers.
	
	marsRovers executeCommands:  'r'.
	
	
	 self assert: marsRovers cardinaPoint = east .! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:32:10'!
test08PasarUnComandoDeRotarAlaIzquierdaTieneElPuntoCardinalEsperado

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north .
	self addCommandsToMarsRover: marsRovers.
	
	marsRovers executeCommands:  'l'.
	
	
	 self assert: marsRovers cardinaPoint = west .! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/12/2021 19:32:16'!
test09PasarleVariosComandosDeMovimientoYrotarLoDejaEnLaPosicionYpuntoCardinalEsperado

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	self addCommandsToMarsRover: marsRovers.
	marsRovers executeCommands:  'frf'.
	
	
	self assert: marsRovers position = (1@1).
	self assert: marsRovers cardinaPoint = east.! !

!MarsRoverTest methodsFor: 'test' stamp: 'LEI 11/13/2021 17:14:01'!
test10EjecutaComandosHastaEncontrarUnoQueNoSePuedaEjecutarElRestoNoSeEjecuta

	marsRovers := MarsRover initialPosition: positionZeroZero cardinaDirecction: north.
	self addCommandsToMarsRover: marsRovers.
	
	
	self 
		should: [ 
			marsRovers executeCommands:  'frxff'.
			]
		raise: Error
		withExceptionDo: [ :anError | 
			
			self assert: marsRovers position = (0@1).
			self assert: marsRovers cardinaPoint = east.
			self assert: anError messageText equals: MarsRover invalidCommand ].
	! !


!classDefinition: #CardinalDirection category: '05 - MarsRover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:59:02'!
= anotherCardinalDirection
	^self class = anotherCardinalDirection class.! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:44:02'!
getCardinalDirectionOnLeft
	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:44:06'!
getCardinalDirectionOnRight
	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:44:43'!
getDirectionVector
	self subclassResponsibility.! !


!classDefinition: #East category: '05 - MarsRover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:47:51'!
getCardinalDirectionOnLeft
	^North new.
 ! !

!East methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:48:04'!
getCardinalDirectionOnRight
	^South new.
 ! !

!East methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:47:15'!
getDirectionVector
	^(1@0)! !


!classDefinition: #North category: '05 - MarsRover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:46:08'!
getCardinalDirectionOnLeft
	^ West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:45:55'!
getCardinalDirectionOnRight
	^ East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:46:45'!
getDirectionVector
	^(0@1).! !


!classDefinition: #South category: '05 - MarsRover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:49:19'!
getCardinalDirectionOnLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:49:33'!
getCardinalDirectionOnRight
	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:50:00'!
getDirectionVector
	^(0@-1).! !


!classDefinition: #West category: '05 - MarsRover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:51:36'!
getCardinalDirectionOnLeft
	^South new! !

!West methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:51:50'!
getCardinalDirectionOnRight
	^North new! !

!West methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:51:03'!
getDirectionVector
	^(-1@0)! !


!classDefinition: #Commands category: '05 - MarsRover'!
Object subclass: #Commands
	instanceVariableNames: 'key'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Commands methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 16:30:44'!
executeCommand: aMarsRover
	self subclassResponsibility ! !

!Commands methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 16:48:54'!
getKey

	^key ! !

!Commands methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:14:04'!
initializeWith: aKey
	key  := aKey.! !


!classDefinition: #Backward category: '05 - MarsRover'!
Commands subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 16:36:48'!
executeCommand: aMarsRover

 	
aMarsRover addToCurrentPosition: (0 @ -1)

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: '05 - MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 16:44:27'!
withKey: aKey.
	^self new initializeWith: aKey. 
	! !


!classDefinition: #Forward category: '05 - MarsRover'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:54:00'!
executeCommand: aMarsRover


	aMarsRover addToCurrentPosition: (aMarsRover cardinaPoint) getDirectionVector 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: '05 - MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 16:45:10'!
withKey: aKey.
	^self new initializeWith: aKey. 
	! !


!classDefinition: #RotateLeft category: '05 - MarsRover'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:57:10'!
executeCommand: aMarsRover
	
	aMarsRover rotateToDirection: ((aMarsRover cardinaPoint )getCardinalDirectionOnLeft ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: '05 - MarsRover'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:14:26'!
withKey: aKey.
	^self new initializeWith: aKey. ! !


!classDefinition: #RotateRight category: '05 - MarsRover'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:57:22'!
executeCommand: aMarsRover
	
	aMarsRover rotateToDirection: ((aMarsRover cardinaPoint )  getCardinalDirectionOnRight ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: '05 - MarsRover'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'as yet unclassified' stamp: 'LEI 11/12/2021 17:00:44'!
withKey: aKey.
	^self new initializeWith: aKey. 
	! !


!classDefinition: #MarsRover category: '05 - MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinaPoint commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!


!MarsRover methodsFor: 'init' stamp: 'LEI 11/12/2021 16:47:37'!
initialazeWithPosition: aPoint andWithCardinaPoint:aString
	position := aPoint.
	cardinaPoint:= aString.
	commands := Dictionary new.
	
	! !


!MarsRover methodsFor: 'test' stamp: 'LEI 11/12/2021 15:42:58'!
cardinaPoint
	^cardinaPoint ! !

!MarsRover methodsFor: 'test' stamp: 'LEI 11/12/2021 14:53:21'!
position
	^position! !


!MarsRover methodsFor: 'comands' stamp: 'LEI 11/12/2021 16:49:26'!
addCommand: aCommand
	commands at: (aCommand getKey) put: aCommand.! !

!MarsRover methodsFor: 'comands' stamp: 'LEI 11/13/2021 16:55:45'!
executeCommands: aStringCommands
		
		1 to: (aStringCommands size) do:[:pos|
				(commands at: (aStringCommands at: pos)  ifAbsent: [self error: MarsRover invalidCommand]) executeCommand: self.
		]	
	


		

	! !


!MarsRover methodsFor: 'operation' stamp: 'LEI 11/12/2021 16:36:29'!
addToCurrentPosition: addPosition
	position := position + addPosition. ! !

!MarsRover methodsFor: 'operation' stamp: 'LEI 11/12/2021 17:11:23'!
rotateToDirection: newDirection

	cardinaPoint := newDirection ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05 - MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'init' stamp: 'LEI 11/12/2021 15:38:16'!
initialPosition: aPoint cardinaDirecction: aString 
	^self new initialazeWithPosition: aPoint andWithCardinaPoint: aString.! !


!MarsRover class methodsFor: 'error' stamp: 'LEI 11/13/2021 16:56:19'!
invalidCommand
	^'invalid command read'! !
