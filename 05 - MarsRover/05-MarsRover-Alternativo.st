!classDefinition: #TestMarsRover category: '05-MarsRover-Alternativo'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'north south east west positionZeroZero'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:36:47'!
setUp
	north := North new.
	south:= South new.
	east := East new.
	west := West new.
	
	positionZeroZero := (0@0).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 14:55:44'!
test1
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	self assert: (marsRover position = (0@0)).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:20:53'!
test10
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'fbf'.
	self assert: (marsRover position = (0@1)).	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:10:08'!
test11
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: ''.
	self assert: (marsRover position = (0@0)).	
	self assert: (marsRover directionFacing = north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:21:00'!
test12
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'frflfl'.
	self assert: (marsRover position = (1@2)).
	self assert: (marsRover  directionFacing  = west).	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:22:13'!
test13
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
    	self 
        should: [ 
            marsRover executeCommands:  'frxff'.
            ]
        raise: Error
        withExceptionDo: [ :anError | 

            self assert: marsRover position = (0@1).
            self assert: marsRover directionFacing = east.
            self assert: anError messageText equals: MarsRover invalidCommandErrorMessage ].! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 14:55:55'!
test2
	|marsRover marsRover2|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	self assert: (marsRover position = (0@0)).
	
	marsRover2 := MarsRover landedAt: (1@0) facing: north.
	self assert: (marsRover2 position = (1@0)).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 14:54:07'!
test3
	|marsRover|
	marsRover := MarsRover landedAt: (0@0) facing: north.
	self assert: (marsRover directionFacing = north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 14:56:47'!
test4
	|marsRover marsRover2|
	marsRover := MarsRover landedAt: (0@0) facing: north.
	self assert: (marsRover directionFacing = north).
	
	marsRover2 := MarsRover landedAt: (0@0) facing: east.
	self assert: (marsRover2 directionFacing = east).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:19:42'!
test5
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'f'.
	self assert: (marsRover position = (0@1)).
	
	marsRover := MarsRover landedAt: (0@0)facing: south.
	marsRover executeCommands: 'f'.
	self assert: (marsRover position = (0@-1)).
	
	marsRover := MarsRover landedAt: (0@0)facing: east.
	marsRover executeCommands: 'f'.
	self assert: (marsRover position = (1@0)).
	
	marsRover := MarsRover landedAt: (0@0)facing: west.
	marsRover executeCommands: 'f'.
	self assert: (marsRover position = (-1@0)).
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:19:57'!
test5b
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'f'.
	marsRover executeCommands: 'f'.
	self assert: (marsRover position = (0@2)).	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:20:25'!
test6
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'b'.
	self assert: (marsRover position = (0@-1)).
	
	marsRover := MarsRover landedAt: (0@0)facing: south.
	marsRover executeCommands: 'b'.
	self assert: (marsRover position = (0@1)).
	
	marsRover := MarsRover landedAt: (0@0)facing: east.
	marsRover executeCommands: 'b'.
	self assert: (marsRover position = (-1@0)).
	
	marsRover := MarsRover landedAt: (0@0)facing: west.
	marsRover executeCommands: 'b'.
	self assert: (marsRover position = (1@0)).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:20:33'!
test6b
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'b'.
	marsRover executeCommands: 'b'.
	self assert: (marsRover position = (0@-2)).	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 15:36:50'!
test7
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'r'.
	self assert: (marsRover directionFacing =east).
	marsRover executeCommands: 'r'.
	self assert: (marsRover directionFacing =south).
	marsRover executeCommands: 'r'.
	self assert: (marsRover directionFacing =west).
	marsRover executeCommands: 'r'.
	self assert: (marsRover directionFacing =north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 15:52:18'!
test8
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'l'.
	self assert: (marsRover directionFacing =west).
	marsRover executeCommands: 'l'.
	self assert: (marsRover directionFacing =south).
	marsRover executeCommands: 'l'.
	self assert: (marsRover directionFacing =east).
	marsRover executeCommands: 'l'.
	self assert: (marsRover directionFacing =north).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:20:43'!
test9
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	marsRover executeCommands: 'ff'.
	self assert: (marsRover position = (0@2)).	! !


!classDefinition: #CardinalDirection category: '05-MarsRover-Alternativo'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:37:17'!
= anotherCardinalDirection
	^ self class = anotherCardinalDirection class.
	! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:30:10'!
cardinalDirectionOnLeft
	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:30:14'!
cardinalDirectionOnRight
	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:29:30'!
directionVector
	self subclassResponsibility.! !


!classDefinition: #East category: '05-MarsRover-Alternativo'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:39'!
cardinalDirectionOnLeft
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:07'!
cardinalDirectionOnRight
	^South new.! !

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:38:11'!
directionVector
	^(1@0).! !


!classDefinition: #North category: '05-MarsRover-Alternativo'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:25'!
cardinalDirectionOnLeft
	^ West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:18'!
cardinalDirectionOnRight
	^ East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:57'!
directionVector
	^(0@1).! !


!classDefinition: #South category: '05-MarsRover-Alternativo'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:19'!
cardinalDirectionOnLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:55'!
cardinalDirectionOnRight
	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:43'!
directionVector
	^(0@-1).! !


!classDefinition: #West category: '05-MarsRover-Alternativo'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:59'!
cardinalDirectionOnLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:52'!
cardinalDirectionOnRight
	^North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:40'!
directionVector
	^(-1@0).! !


!classDefinition: #Commands category: '05-MarsRover-Alternativo'!
Object subclass: #Commands
	instanceVariableNames: 'key'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!Commands methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:15:05'!
executeCommandIn: aMarsRover
	self subclassResponsibility.! !

!Commands methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:25:39'!
getKey
	^key.! !

!Commands methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:19:04'!
initializeWithKey: aKey
	key := aKey.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: '05-MarsRover-Alternativo'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:20:01'!
withKey: aKey
	self subclassResponsibility.! !


!classDefinition: #Backward category: '05-MarsRover-Alternativo'!
Commands subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!Backward methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:16:26'!
executeCommandIn: aMarsRover
	aMarsRover translate: ((aMarsRover directionFacing directionVector) * -1).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: '05-MarsRover-Alternativo'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:19:29'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #Forward category: '05-MarsRover-Alternativo'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!Forward methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:17:25'!
executeCommandIn: aMarsRover
	aMarsRover translate: ((aMarsRover directionFacing directionVector)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: '05-MarsRover-Alternativo'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:15'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #RotateLeft category: '05-MarsRover-Alternativo'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:18:10'!
executeCommandIn: aMarsRover
	aMarsRover faceDirection: (aMarsRover directionFacing ) cardinalDirectionOnLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: '05-MarsRover-Alternativo'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:18'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #RotateRight category: '05-MarsRover-Alternativo'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:18:24'!
executeCommandIn: aMarsRover
	aMarsRover faceDirection: (aMarsRover directionFacing ) cardinalDirectionOnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: '05-MarsRover-Alternativo'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:27'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #MarsRover category: '05-MarsRover-Alternativo'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection knownCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover-Alternativo'!

!MarsRover methodsFor: 'accesing' stamp: 'FLM 11/16/2021 14:59:16'!
directionFacing
	^cardinalDirection .! !

!MarsRover methodsFor: 'accesing' stamp: 'FLM 11/16/2021 14:49:01'!
position
	^position.! !


!MarsRover methodsFor: 'initialization' stamp: 'FLM 11/16/2021 17:26:57'!
initializeAtPosition: aPosition facing: aCardinalDirection
	position := aPosition.
	cardinalDirection := aCardinalDirection.
	knownCommands := Dictionary new.
	self addCommand: (Backward withKey: $b).
	self addCommand: (Forward withKey: $f).
	self addCommand: (RotateLeft withKey: $l).
	self addCommand: (RotateRight withKey: $r).! !


!MarsRover methodsFor: 'commands' stamp: 'FLM 11/16/2021 17:25:27'!
addCommand: aNewCommand
	knownCommands at: (aNewCommand getKey) put: aNewCommand.! !

!MarsRover methodsFor: 'commands' stamp: 'FLM 11/16/2021 16:04:15'!
executeCommands: commandString
	(1 to: (commandString size)) do:[:stringPosition| self executeSingleCommand: (commandString at: stringPosition)].! !

!MarsRover methodsFor: 'commands' stamp: 'FLM 11/16/2021 17:27:11'!
executeSingleCommand: aCommand
	|command|
	command := knownCommands  at: (aCommand) ifAbsent: [self error: self class invalidCommandErrorMessage.].
	command executeCommandIn: self.! !


!MarsRover methodsFor: 'transform' stamp: 'FLM 11/16/2021 17:04:19'!
faceDirection: aNewCardinalDirection
	cardinalDirection := aNewCardinalDirection.! !

!MarsRover methodsFor: 'transform' stamp: 'FLM 11/16/2021 17:08:23'!
translate: direction
	position := position + direction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05-MarsRover-Alternativo'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:16:17'!
invalidCommandErrorMessage
	^'Invalid command!!'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 14:58:07'!
landedAt: aPosition facing: aCardinalDirection
	^self new initializeAtPosition: aPosition facing: aCardinalDirection ! !
