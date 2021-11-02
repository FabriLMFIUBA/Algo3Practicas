!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
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

!SentenceFinderByPrefixTest methodsFor: 'private-test' stamp: 'LEI 11/2/2021 16:02:55'!
fillStack: aStack with: first with: second with: third with: fourth


aStack push: first.
aStack push: second.
aStack push: third.
aStack push: fourth.
! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:25:41'!
test01SFBPdoesntMatchWithAnySentenceInEmptyStack
	
	|sentencesFounded|
	
	sentencesFounded := sentenceFinderTest prefixToSearch: Wint inStack: stackTest.
	
	self assert: sentencesFounded size = 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:42:01'!
test02SFBPdoesntFindAnySentencesWithAmatchingPrefixInStackWithOnlyOneSentence
	
	|sentencesFounded|
	
	
	stackTest push: WinterIsHere.
	sentencesFounded := sentenceFinderTest prefixToSearch: Wont inStack: stackTest.
	
	
	self assert: sentencesFounded size = 0
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:42:19'!
test03SFBPgotOnlyOneMatchWithCorrectPrefixInStackWithOnlyOneSentence
	
	|sentencesFounded|
	
	
	stackTest push: WinterIsHere.
	sentencesFounded := sentenceFinderTest prefixToSearch: Wint inStack: stackTest.
	
	
	self assertThatCollection: sentencesFounded onlyContains: WinterIsHere.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:39:05'!
test04SFBSdoesntFindAnySentencesWithAMatchingPrefixInStackWithMultipleSentences
	
 	|sentencesFounded|
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest prefixToSearch: Wont inStack: stackTest.
	
	self assert: sentencesFounded size = 0.

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:43:23'!
test05SFBPgotOnlyOneMatchWithCorrectPrefixInStackWithMultipleSentences
	

	|sentencesFounded|
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest prefixToSearch: Wint inStack: stackTest.
	
	self assertThatCollection: sentencesFounded  onlyContains: WinterIsHere 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:46:11'!
test06SFBSfoundedMultipleSentencesWithMatchingPrefixInStackWithMultipleSentences
	
 	|sentencesFounded|
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	sentencesFounded := sentenceFinderTest prefixToSearch: win inStack: stackTest.
	
	self assert: sentencesFounded size = 2.
	self assertThatCollection: sentencesFounded FirstElementIs: winningIsEverything  andSecondElementIs: winterIsComing 
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:05:03'!
test07CanNotFindWithPrefixWithSpace
	
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	
	self
		should: [ sentenceFinderTest prefixToSearch: prefixWithSpace inStack: stackTest ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix ErrorPrefixHasSpace ]
	
	 .
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LEI 11/2/2021 16:45:06'!
test08CanNotFindWithEmptyPrefix
	
	
	
	self fillStack: stackTest with: winterIsComing  with: winningIsEverything  with: TheWindsOfWinter  with: WinterIsHere.
	
	
	self
		should: [ sentenceFinderTest prefixToSearch: EmptyPrefix  inStack: stackTest ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix ErrorPrefixIsEmpty ]
	! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'LEI 11/2/2021 15:58:50'!
setUp

	
	stackTest := OOStack new.
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


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:26:19'!
getValue
	self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:31:32'!
setValue:elementValue
	self subclassResponsibility ! !


!classDefinition: #NodoAveilable category: 'Stack-Exercise'!
Node subclass: #NodoAveilable
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodoAveilable methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:29:41'!
getValue
	^value! !

!NodoAveilable methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:35:29'!
initialice: valueElement.
	self setValue: valueElement.! !

!NodoAveilable methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:32:24'!
setValue: valueElement
	value := valueElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodoAveilable class' category: 'Stack-Exercise'!
NodoAveilable class
	instanceVariableNames: ''!

!NodoAveilable class methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:36:33'!
createWith: elementValue.

	^self new initialice: elementValue
	
	
	! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:28:57'!
getValue

	self error: (OOStack stackEmptyErrorDescription).! !

!NullNode methodsFor: 'as yet unclassified' stamp: 'LEI 11/1/2021 20:31:45'!
setValue:elementValue

	self error: (OOStack stackEmptyErrorDescription).! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'LEI 11/1/2021 20:43:49'!
initialize
	collection := OrderedCollection  new.
	collection addFirst: (NullNode new).

	! !


!OOStack methodsFor: 'accessing' stamp: 'LEI 11/2/2021 01:17:35'!
size
	^ collection  size - 1.! !

!OOStack methodsFor: 'accessing' stamp: 'LEI 11/1/2021 20:41:40'!
top
	"^estado topElementAt: collection ."
	^(collection first) getValue.! !


!OOStack methodsFor: 'testing' stamp: 'LEI 11/1/2021 20:55:55'!
isEmpty
	^ self size = 0.! !


!OOStack methodsFor: 'adding' stamp: 'LEI 11/1/2021 20:43:23'!
push: anObject
	| newNode |
	newNode := NodoAveilable createWith: anObject .
	collection addFirst: newNode.
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


!OOStack class methodsFor: 'as yet unclassified' stamp: 'LEI 10/31/2021 21:34:29'!
withSizeLimit: amountElements
! !


!classDefinition: #Dinamyc category: 'Stack-Exercise'!
OOStack subclass: #Dinamyc
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Dinamyc methodsFor: 'as yet unclassified' stamp: 'LEI 11/2/2021 17:50:20'!
inizialate
	collection := OrderedCollection new.
	collection addFirst: NullNode new.! !


!classDefinition: #Static category: 'Stack-Exercise'!
OOStack subclass: #Static
	instanceVariableNames: 'maxSizeLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Static methodsFor: 'as yet unclassified' stamp: 'LEI 11/2/2021 17:49:27'!
initialize:limit

	collection := OrderedCollection new.
	collection addFirst: (NullNode new).
	maxSizeLimit := limit
! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'LEI 11/2/2021 17:32:09'!
prefixToSearch: prefix inStack: stack
      | collectionAux|

	prefix size = 0 ifTrue: [^self error: self class ErrorPrefixIsEmpty ].
	(prefix findString: ' ') = 0 ifFalse:[^self error: self class ErrorPrefixHasSpace].
	
	
	
	collectionAux := OrderedCollection new.
	
	
	self forEachElementInStack: stack do:  [:popElement| 
		self addToCollection: collectionAux ifPrefixMatches: prefix  with: popElement.
		].
	
   

	
	
	
	^collectionAux.! !


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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LEI 11/2/2021 17:32:09'!
forEachElementInStack: stack do: aBlock


|stackAux |

	
	stackAux := OOStack new.
	
	
	self emptyStack: stack andForEachElementDo: [:popElement| 
		aBlock value: popElement.
		stackAux push: popElement
		].
	
   
	self emptyStack: stackAux andForEachElementDo: [:popElement| 
		stack push: popElement
		].! !

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
