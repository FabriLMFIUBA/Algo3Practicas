!classDefinition: #TestMarsRover category: '05-MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'north south east west positionZeroZero'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!TestMarsRover methodsFor: 'setUp' stamp: 'FLM 11/16/2021 16:36:47'!
setUp
	north := North new.
	south:= South new.
	east := East new.
	west := West new.
	
	positionZeroZero := (0@0).! !


!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 17:22:59'!
assertThatDirectionFacingRemainsUnchangedAfterLandingIn: aPosition facing: aCardinalDirection

	|marsRover|
	
	marsRover := MarsRover landedAt: aPosition facing: aCardinalDirection.
	self assert: (marsRover directionFacing = aCardinalDirection).! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 18:20:07'!
assertThatMarsRover:aMarsRover afterExectuting: aCommand aNumberOfTimes: aNumberOfTimes finalPositionIs: aFinalPosition
        |initialCardinalDirection|
	initialCardinalDirection  := aMarsRover directionFacing.
	
	1 to: aNumberOfTimes do: [:index| 
		aMarsRover executeCommands: aCommand.
		].
	
	self assert: aMarsRover position = aFinalPosition.
	self assert: aMarsRover directionFacing  = initialCardinalDirection .
	! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 17:53:03'!
assertThatMarsRover: aMarsRover afterExecuting: stringCommands Faces:aCardinalDirection finalPosition: aPosition

	aMarsRover executeCommands: stringCommands.
	self assert: (aMarsRover directionFacing =aCardinalDirection).
	self assert: (aMarsRover position =aPosition)
! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 17:55:55'!
assertThatMarsRover: aMarsRover afterRotatingToTheLeftFaces:aCardinalDirection

	|initialPosition|
	
	initialPosition  := aMarsRover position.
	self assertThatMarsRover: aMarsRover  afterExecuting:  'l'  Faces: aCardinalDirection finalPosition: initialPosition. ! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 17:55:37'!
assertThatMarsRover: aMarsRover afterRotatingToTheRightFaces:aCardinalDirection

 	|initialPosition|
	
	initialPosition  := aMarsRover position.
	self assertThatMarsRover: aMarsRover  afterExecuting:  'r'  Faces: aCardinalDirection finalPosition: initialPosition. 
! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 18:00:11'!
assertThatMarsRoverFacing:aCardinalDirection afterExecutingCommands: stringCommands expectedFinalPosition: positionExpected


	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: aCardinalDirection .
	self assertThatMarsRover: marsRover afterExecuting: stringCommands  Faces: aCardinalDirection  finalPosition: positionExpected 
	
! !

!TestMarsRover methodsFor: 'private' stamp: 'LEI 11/18/2021 17:19:56'!
assertThatPositionRemainsUnchangedAfterLandingIn: aPosition facing: aCardinalDirection

	|marsRover|
	
	marsRover := MarsRover landedAt: aPosition facing: aCardinalDirection.
	self assert: (marsRover position = aPosition ).! !


!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:20:21'!
test01WhenMarsRoverDoesntExecuteCommandStayInTheInitialPosition

	self assertThatPositionRemainsUnchangedAfterLandingIn: positionZeroZero facing: north.! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:21:46'!
test02MultipleMarsRoversThatdontGetCommandsToExecuteStayIntheirInitialPosition

	
	self assertThatPositionRemainsUnchangedAfterLandingIn: positionZeroZero facing: north.	self assertThatPositionRemainsUnchangedAfterLandingIn: (1@0) facing: north.
	self assertThatPositionRemainsUnchangedAfterLandingIn: (1@0) facing: east.
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:24:11'!
test03WhenMarsRoverDoesntExecuteCommandsKeepFacingItsInitialDirection

	self assertThatDirectionFacingRemainsUnchangedAfterLandingIn: positionZeroZero facing: north. ! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:24:53'!
test04MultipleMarsRoverThatdontGetCommandToExecuteKeepFacingTheirInitialDirection
	
	
	self assertThatDirectionFacingRemainsUnchangedAfterLandingIn: positionZeroZero facing: north.
	self assertThatDirectionFacingRemainsUnchangedAfterLandingIn: positionZeroZero facing: east. ! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:34:59'!
test05MarsRoverCanMoveFowardInAllDirections


	self assertThatMarsRoverFacing: north afterExecutingCommands: 'f' expectedFinalPosition: (0@1). 
	self assertThatMarsRoverFacing: south afterExecutingCommands: 'f' expectedFinalPosition: (0@-1).
	self assertThatMarsRoverFacing: east afterExecutingCommands: 'f' expectedFinalPosition: (1@0).  
	self assertThatMarsRoverFacing: west afterExecutingCommands: 'f' expectedFinalPosition: (-1@0). 
! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:35:57'!
test06MarsRoverCanMoveBackwardInAllDirections

	
	self assertThatMarsRoverFacing: north afterExecutingCommands: 'b' expectedFinalPosition: (0@-1). 
	self assertThatMarsRoverFacing: south afterExecutingCommands: 'b' expectedFinalPosition: (0@1).
	self assertThatMarsRoverFacing: east afterExecutingCommands: 'b' expectedFinalPosition: (-1@0).  
	self assertThatMarsRoverFacing: west afterExecutingCommands: 'b' expectedFinalPosition: (1@0). 
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:53:47'!
test07MarsRoverCanRotateToTheRightInAllDirections
	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.	
	self assertThatMarsRover: marsRover afterRotatingToTheRightFaces:east. 
	self assertThatMarsRover: marsRover afterRotatingToTheRightFaces:south. 
	self assertThatMarsRover: marsRover afterRotatingToTheRightFaces:west. 
	self assertThatMarsRover: marsRover afterRotatingToTheRightFaces:north. 
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 17:57:06'!
test08MarsRoverCanRotateToTheLeftInAllDirections

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.	
	self assertThatMarsRover: marsRover afterRotatingToTheLeftFaces:west. 
	self assertThatMarsRover: marsRover afterRotatingToTheLeftFaces:south.
	self assertThatMarsRover: marsRover afterRotatingToTheLeftFaces: east.
	self assertThatMarsRover: marsRover afterRotatingToTheLeftFaces:north.
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:13:28'!
test09TwoIndividualsForwardCommandsTranslateMarsRoverAccordingly

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.	
	self assertThatMarsRover: marsRover afterExectuting: 'f'  aNumberOfTimes:2  finalPositionIs:(0@2). 
	
	.	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:13:53'!
test10TwoIndividualsBackwardCommandsTranslateMarsRoverAccordingly

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	self assertThatMarsRover: marsRover afterExectuting: 'b'  aNumberOfTimes:2  finalPositionIs:(0@-2). ! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:15:45'!
test11AcombinationOfForwardCommandsTranslateMarsRoverAccordingly

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.	
	self assertThatMarsRover: marsRover afterExecuting: 'ff'  Faces: north  finalPosition: (0@2). 
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:16:08'!
test12AcombinationOfForwardAndBackwardCommandsTranslateMarsRoverAccordingly

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.
	self assertThatMarsRover: marsRover afterExecuting: 'fbf'  Faces: north  finalPosition: (0@1). 
! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:16:38'!
test13AcombinationOfForwardBackwardAndRotateCommandsTranlateMarsRoverAccordingly

	|marsRover|
	marsRover := MarsRover landedAt: (0@0)facing: north.	
	self assertThatMarsRover: marsRover afterExecuting: 'frflfl'  Faces: west  finalPosition: (1@2). 
	
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:18:21'!
test14AnEmptyStringDoesntMoveOrRotateToMarsRover


	|marsRover|
	marsRover := MarsRover landedAt: positionZeroZero facing: north.	
	self assertThatMarsRover: marsRover afterExecuting: '' Faces: north  finalPosition: positionZeroZero .
	! !

!TestMarsRover methodsFor: 'test' stamp: 'LEI 11/18/2021 18:40:43'!
test15CommandExecutionStopsWhenUnknownCommandAppears


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
		self assert: anError messageText equals: MarsRover invalidCommandErrorMessage
           ].! !


!classDefinition: #CardinalDirection category: '05-MarsRover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

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


!classDefinition: #East category: '05-MarsRover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:39'!
cardinalDirectionOnLeft
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:07'!
cardinalDirectionOnRight
	^South new.! !

!East methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:38:11'!
directionVector
	^(1@0).! !


!classDefinition: #North category: '05-MarsRover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:25'!
cardinalDirectionOnLeft
	^ West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:18'!
cardinalDirectionOnRight
	^ East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:31:57'!
directionVector
	^(0@1).! !


!classDefinition: #South category: '05-MarsRover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:19'!
cardinalDirectionOnLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:55'!
cardinalDirectionOnRight
	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:32:43'!
directionVector
	^(0@-1).! !


!classDefinition: #West category: '05-MarsRover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:59'!
cardinalDirectionOnLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:52'!
cardinalDirectionOnRight
	^North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 16:33:40'!
directionVector
	^(-1@0).! !


!classDefinition: #Commands category: '05-MarsRover'!
Object subclass: #Commands
	instanceVariableNames: 'key'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

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

!classDefinition: 'Commands class' category: '05-MarsRover'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:20:01'!
withKey: aKey
	self subclassResponsibility.! !


!classDefinition: #Backward category: '05-MarsRover'!
Commands subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'LEI 11/18/2021 16:27:55'!
executeCommandIn: aMarsRover
       |currentCardinalDirection|
	currentCardinalDirection  := aMarsRover directionFacing.
	aMarsRover addToCurrentPosition: ((currentCardinalDirection directionVector) * -1).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: '05-MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:19:29'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #Forward category: '05-MarsRover'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'LEI 11/18/2021 16:27:55'!
executeCommandIn: aMarsRover	
	 |currentCardinalDirection|
	currentCardinalDirection  := aMarsRover directionFacing.
	aMarsRover addToCurrentPosition: ((currentCardinalDirection directionVector)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: '05-MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:15'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #RotateLeft category: '05-MarsRover'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!RotateLeft methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:18:10'!
executeCommandIn: aMarsRover
	aMarsRover faceDirection: (aMarsRover directionFacing ) cardinalDirectionOnLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: '05-MarsRover'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:18'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #RotateRight category: '05-MarsRover'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

!RotateRight methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:18:24'!
executeCommandIn: aMarsRover
	aMarsRover faceDirection: (aMarsRover directionFacing ) cardinalDirectionOnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: '05-MarsRover'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'as yet unclassified' stamp: 'FLM 11/16/2021 17:21:27'!
withKey: aKey
	^self new initializeWithKey: aKey.! !


!classDefinition: #MarsRover category: '05-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection knownCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05-MarsRover'!

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

!MarsRover methodsFor: 'commands' stamp: 'LEI 11/18/2021 16:24:39'!
executeCommands: commandString
	
	
	commandString do:[:command| self executeSingleCommand: (command)].! !

!MarsRover methodsFor: 'commands' stamp: 'FLM 11/16/2021 17:27:11'!
executeSingleCommand: aCommand
	|command|
	command := knownCommands  at: (aCommand) ifAbsent: [self error: self class invalidCommandErrorMessage.].
	command executeCommandIn: self.! !


!MarsRover methodsFor: 'transform' stamp: 'LEI 11/18/2021 16:27:55'!
addToCurrentPosition: direction
	position := position + direction.! !

!MarsRover methodsFor: 'transform' stamp: 'FLM 11/16/2021 17:04:19'!
faceDirection: aNewCardinalDirection
	cardinalDirection := aNewCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LEI 11/18/2021 18:33:57'!
landedAt: aPosition facing: aCardinalDirection	
	
	
	^self new initializeAtPosition: aPosition facing: aCardinalDirection ! !


!MarsRover class methodsFor: 'error' stamp: 'LEI 11/18/2021 18:41:33'!
invalidCommandErrorMessage
	^'Invalid command!!'! !
