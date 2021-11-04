!classDefinition: #OODynamicStackTest category: 'Stack-Exercise'!
TestCase subclass: #OODynamicStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:19'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := DynamicStack new.
	
	self assert: stack isEmpty! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:23'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := DynamicStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:28'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := DynamicStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:33'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := DynamicStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:39'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := DynamicStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:43'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := DynamicStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:48'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := DynamicStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:53'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := DynamicStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:03:57'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := DynamicStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OODynamicStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:04:01'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := DynamicStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStaticStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStaticStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:50:26'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := StaticStack withMaxSize: 10.
	
	self assert: stack isEmpty! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:04'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := StaticStack withMaxSize: 10.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:10'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := StaticStack withMaxSize: 10.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:18'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := StaticStack withMaxSize: 10.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:24'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := StaticStack withMaxSize: 10.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:31'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := StaticStack withMaxSize: 10.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:37'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := StaticStack withMaxSize: 10.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:45'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := StaticStack withMaxSize: 10.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:49'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := StaticStack withMaxSize: 10.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:51:53'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := StaticStack withMaxSize: 10.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:54:06'!
test11CantPushWhenStackIsFull

	| stack  |
	
	stack := StaticStack withMaxSize: 2.
	
	stack push: 10.
	stack push: 20.
	
	
	self
		should: [ stack push: 30. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = StaticStack stackLimitReachedErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:58:28'!
test12CantBeCreatedWhenDesiredSizeIsNotAnInteger

	| stack  |
	
	
	self
		should: [ stack:= StaticStack withMaxSize: 'a']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = StaticStack invalidNumberForStackSizeErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:59:44'!
test13CantBeCreatedWithMaxSize0

	| stack  |
	
	
	self
		should: [ stack:= StaticStack withMaxSize: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = StaticStack nonPositiveStackSizeErrorDescription ]
		
! !

!OOStaticStackTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:00:11'!
test14CantBeCreatedWithMaxSizeBeingNegative

	| stack  |
	
	
	self
		should: [ stack:= StaticStack withMaxSize: -1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = StaticStack nonPositiveStackSizeErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackTest sentenceFinderTest winterIsComing winningIsEverything TheWindsOfWinter WinterIsHere Wint Wont win EmptyPrefix prefixWithSpace'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'LEI 11/2/2021 16:16:30'!
assertThatCollection: aCollection FirstElementIs: aElement andSecondElementIs: anotherElement

	self assert: (aCollection at: 1) = aElement .
	self assert: (aCollection at: 2) = anotherElement .! !

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'LEI 11/2/2021 15:52:42'!
assertThatCollection: aCollection onlyContains: aElement

	self assert: (aCollection at: 1) = aElement .
	self assert: aCollection size = 1.! !

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'FLM 11/4/2021 15:21:04'!
assertThatStack: aStack contains: firstElement then: secondElement then: thirdElement then: fourthElement
	self assert: (aStack size = 4).
	self assert: ((aStack pop) = firstElement ).
	self assert: ((aStack pop) = secondElement ).
	self assert: ((aStack pop) = thirdElement ).
	self assert: ((aStack pop) = fourthElement ).
	
	aStack push: firstElement.
	aStack push: secondElement.
	aStack push: thirdElement.
	aStack push: fourthElement.! !

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'FLM 11/4/2021 15:17:12'!
assertThatStack: aStack onlyContains: anElement
	self assert: (aStack size = 1).
	self assert: ((aStack top) = anElement).! !

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'LEI 11/2/2021 16:02:55'!
fillStack: aStack with: first with: second with: third with: fourth


aStack push: first.
aStack push: second.
aStack push: third.
aStack push: fourth.
! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:49'!
test01SFBPdoesntMatchWithAnySentenceInEmptyStack
	
	|sentencesFounded|
	
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: Wint inStack: stackTest.
	
	self assert: sentencesFounded size = 0.
	
	self assert: stackTest isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:44'!
test02SFBPdoesntFindAnySentencesWithAmatchingPrefixInStackWithOnlyOneSentence
	
	|sentencesFounded|
	
	
	stackTest push: WinterIsHere.
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: Wont inStack: stackTest.
	
	
	self assert: sentencesFounded size = 0.
	
	self assertThatStack: stackTest onlyContains: WinterIsHere .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:40'!
test03SFBPgotOnlyOneMatchWithCorrectPrefixInStackWithOnlyOneSentence
	
	|sentencesFounded|
	
	
	stackTest push: WinterIsHere.
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: Wint inStack: stackTest.
	
	
	self assertThatCollection: sentencesFounded onlyContains: WinterIsHere.
	
	self assertThatStack: stackTest onlyContains: WinterIsHere .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:35'!
test04SFBSdoesntFindAnySentencesWithAMatchingPrefixInStackWithMultipleSentences
	
 	|sentencesFounded|
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: Wont inStack: stackTest.
	
	self assert: sentencesFounded size = 0.
	
	self assertThatStack: stackTest contains: WinterIsHere  then: TheWindsOfWinter then: winningIsEverything then: winterIsComing .

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:32'!
test05SFBPgotOnlyOneMatchWithCorrectPrefixInStackWithMultipleSentences
	

	|sentencesFounded|
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: Wint inStack: stackTest.
	
	self assertThatCollection: sentencesFounded  onlyContains: WinterIsHere.
	
	self assertThatStack: stackTest contains: WinterIsHere  then: TheWindsOfWinter then: winningIsEverything then: winterIsComing .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 15:37:27'!
test06SFBSfoundedMultipleSentencesWithMatchingPrefixInStackWithMultipleSentences
	
 	|sentencesFounded|
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest sentencesWithPrefix: win inStack: stackTest.
	
	self assert: sentencesFounded size = 2.
	
	self assertThatCollection: sentencesFounded FirstElementIs: winningIsEverything  andSecondElementIs: winterIsComing.
	
	self assertThatStack: stackTest contains: WinterIsHere  then: TheWindsOfWinter then: winningIsEverything then: winterIsComing .
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:11:03'!
test07CanNotFindWithPrefixWithSpace
	
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	
	self
		should: [ sentenceFinderTest sentencesWithPrefix: prefixWithSpace inStack: stackTest ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix ErrorPrefixHasSpace ]
	
	 .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FLM 11/4/2021 14:11:03'!
test08CanNotFindWithEmptyPrefix
	
	
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	
	self
		should: [ sentenceFinderTest sentencesWithPrefix: EmptyPrefix  inStack: stackTest ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix ErrorPrefixIsEmpty ]
	! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'FLM 11/4/2021 15:04:35'!
setUp

	
	stackTest := DynamicStack new.
	sentenceFinderTest := SentenceFinderByPrefix new.
	
	winterIsComing := 'winter is Coming'.
	winningIsEverything := 'winningIsEverything'.
	TheWindsOfWinter := 'The winds of Winter'.
	WinterIsHere := 'Winter is Here'.
	
	Wint := 'Wint'.
	Wont := 'Wont'.
	win := 'win'.
	
	EmptyPrefix := ''.
	prefixWithSpace := 'Win t'! !


!classDefinition: #Container category: 'Stack-Exercise'!
Object subclass: #Container
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Container methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:26:19'!
getValue
	self subclassResponsibility ! !

!Container methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:31:32'!
setValue:elementValue
	self subclassResponsibility ! !


!classDefinition: #NullContainer category: 'Stack-Exercise'!
Container subclass: #NullContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullContainer methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:28:57'!
getValue

	self error: (OOStack stackEmptyErrorDescription).! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:31:45'!
setValue:elementValue

	self error: (OOStack stackEmptyErrorDescription).! !


!classDefinition: #OpenContainer category: 'Stack-Exercise'!
Container subclass: #OpenContainer
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OpenContainer methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:29:41'!
getValue
	^value! !

!OpenContainer methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:35:29'!
initialice: valueElement.
	self setValue: valueElement.! !

!OpenContainer methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:32:24'!
setValue: valueElement
	value := valueElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OpenContainer class' category: 'Stack-Exercise'!
OpenContainer class
	instanceVariableNames: ''!

!OpenContainer class methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:36:33'!
createWith: elementValue.

	^self new initialice: elementValue
	
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'FLM 11/4/2021 15:06:21'!
size
	^ (collection size) - 1.! !

!OOStack methodsFor: 'accessing' stamp: 'LEI 11/1/2021 20:41:40'!
top
	"^estado topElementAt: collection ."
	^(collection first) getValue.! !


!OOStack methodsFor: 'testing' stamp: 'LEI 11/1/2021 20:55:55'!
isEmpty
	^ self size = 0.! !


!OOStack methodsFor: 'adding' stamp: 'FLM 11/4/2021 15:02:41'!
push: anObject
	self subclassResponsibility.
	! !


!OOStack methodsFor: 'removing' stamp: 'LEI 11/2/2021 17:41:55'!
pop
	|NodeToPop|
	
	
	NodeToPop  := self top .
	collection removeFirst.
	^NodeToPop .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #DynamicStack category: 'Stack-Exercise'!
OOStack subclass: #DynamicStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!DynamicStack methodsFor: 'initialization' stamp: 'FLM 11/4/2021 15:11:17'!
initialize
	collection := OrderedCollection  new.
	collection addFirst: (NullContainer new).
! !


!DynamicStack methodsFor: 'adding' stamp: 'FLM 11/4/2021 15:10:33'!
push: anObject
	| newNode |
	newNode := OpenContainer createWith: anObject .
	collection addFirst: newNode.! !


!classDefinition: #StaticStack category: 'Stack-Exercise'!
OOStack subclass: #StaticStack
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StaticStack methodsFor: 'initialization' stamp: 'FLM 11/4/2021 15:11:17'!
initializeWith: aSize
	
	collection := OrderedCollection new.
	collection addFirst: NullContainer new.
	maxSize  := aSize.! !


!StaticStack methodsFor: 'adding' stamp: 'FLM 11/4/2021 15:10:33'!
push: anObject
	| newNode |
	(self size = maxSize ) ifTrue:[self error:(self class stackLimitReachedErrorDescription )].
	newNode := OpenContainer createWith: anObject .
	collection addFirst: newNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StaticStack class' category: 'Stack-Exercise'!
StaticStack class
	instanceVariableNames: ''!

!StaticStack class methodsFor: 'instance creation' stamp: 'FLM 11/4/2021 14:45:16'!
withMaxSize: aSize
	(aSize isInteger) ifFalse:[self error:(self invalidNumberForStackSizeErrorDescription)].
	(aSize <= 0) ifTrue:[self error:(self nonPositiveStackSizeErrorDescription) ].
	^ self new initializeWith: aSize .! !


!StaticStack class methodsFor: 'error descriptions' stamp: 'FLM 11/4/2021 14:44:51'!
invalidNumberForStackSizeErrorDescription
	^'Invalid number!! Only whole numbers are expected'! !

!StaticStack class methodsFor: 'error descriptions' stamp: 'FLM 11/4/2021 14:44:59'!
nonPositiveStackSizeErrorDescription
	^'Stack size must be greater than 0!!'.! !

!StaticStack class methodsFor: 'error descriptions' stamp: 'FLM 11/4/2021 14:45:07'!
stackLimitReachedErrorDescription
	^'The stack limit has been reached!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LEI 11/2/2021 17:07:51'!
addToCollection: aCollection ifPrefixMatches: prefix with: popElement 

(popElement findString: prefix) = 1 ifTrue:
				[
					aCollection add: popElement
				].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LEI 11/2/2021 17:19:34'!
emptyStack: stack andForEachElementDo: aBlock

[stack isEmpty] whileFalse:[ 
		| top |
	
		top:= stack pop.
		
		aBlock value: top.
	
		].

	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FLM 11/4/2021 15:09:14'!
forEachElementInStack: stack do: aBlock


|stackAux |

	
	stackAux := DynamicStack new.
	
	
	self emptyStack: stack andForEachElementDo: [:element| 
		aBlock value: element.
		stackAux push: element
		].
	
   
	self emptyStack: stackAux andForEachElementDo: [:element| 
		stack push: element
		].! !


!SentenceFinderByPrefix methodsFor: 'search In Stack' stamp: 'FLM 11/4/2021 14:11:03'!
sentencesWithPrefix: prefix inStack: stack
      | collectionAux|

	prefix size = 0 ifTrue: [^self error: self class ErrorPrefixIsEmpty ].
	(prefix findString: ' ') = 0 ifFalse:[^self error: self class ErrorPrefixHasSpace].
	
	
	
	collectionAux := OrderedCollection new.
	
	
	self forEachElementInStack: stack do:  [:popElement| 
		self addToCollection: collectionAux ifPrefixMatches: prefix  with: popElement.
		].
	
   

	
	
	
	^collectionAux.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LEI 10/31/2021 13:52:52'!
ErrorPrefixHasSpace
	^ 'prefix has space'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LEI 10/31/2021 02:04:23'!
ErrorPrefixIsEmpty
	^ 'prefix is empty'! !
