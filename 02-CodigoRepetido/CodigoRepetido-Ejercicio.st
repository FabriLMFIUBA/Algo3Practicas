!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:27:11'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook := CustomerBook new.
	self assert:  (self measureIfExecutionTimeOf: [customerBook addCustomerNamed: 'John Lennon']  isLessThan:50) .

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:30:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds


	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookAndAddCustomerNamed: paulMcCartney.

	self assert: ( self measureIfExecutionTimeOf:  [customerBook removeCustomerNamed: paulMcCartney] isLessThan: 100).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/13/2021 18:47:54'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self try: [customerBook addCustomerNamed: ''] 
	      catch: Error  
	      do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ] 
	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:30:00'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookAndAddCustomerNamed: johnLennon.
	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'.] 
	      catch: NotFound  
	      do: [ :anError | 				self verifyInCustomerBook: customerBook IncludesNameCustomer: johnLennon totalCustomersExpected:1 
			] ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:31:57'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	
	
	paulMcCartney := 'Paul McCartney'.
	customerBook:= self createCustomerBookAndAddCustomerNamed: paulMcCartney.
	customerBook operationToCustomer: paulMcCartney wantToSuspend: true  wantToRemove: false. 
	

	self verifyInCustomerBook: customerBook expectedNumberActiveCustomers: 0 expectedNumberSuspendedCustomers: 1  totalNumberCustomers: 1. 
	self verifyIfInCustomerBook: customerBook customerNamed: paulMcCartney  shouldBeIncluded: true.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:31:57'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	
	paulMcCartney := 'Paul McCartney'.	customerBook := self createCustomerBookAndAddCustomerNamed: paulMcCartney.
	
	customerBook operationToCustomer: paulMcCartney wantToSuspend: true  wantToRemove: true.
	
	
	self verifyInCustomerBook: customerBook expectedNumberActiveCustomers: 0 expectedNumberSuspendedCustomers: 0  totalNumberCustomers: 0. 

	self verifyIfInCustomerBook: customerBook customerNamed: paulMcCartney shouldBeIncluded: false .


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:30:00'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	
	johnLennon := 'John Lennon'.
	customerBook :=  self createCustomerBookAndAddCustomerNamed: johnLennon.

	self try: [ customerBook suspendCustomerNamed: 'Ringo Starr'] 
	      catch: CantSuspend  
	      do: [ :anError | 			
			self verifyInCustomerBook: customerBook IncludesNameCustomer: johnLennon totalCustomersExpected: 1.
		 ] 

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FLM 10/14/2021 15:30:00'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookAndAddCustomerNamed: johnLennon.
	
	customerBook suspendCustomerNamed: johnLennon.


	self try: [ customerBook suspendCustomerNamed: johnLennon] 
	      catch: CantSuspend  
	      do: [ :anError | 
			self verifyInCustomerBook: customerBook IncludesNameCustomer: johnLennon totalCustomersExpected: 1.
			] 
! !


!CustomerBookTest methodsFor: 'test-private' stamp: 'FLM 10/14/2021 15:30:00'!
createCustomerBookAndAddCustomerNamed: nameCustomerBook
	|customerBook|
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: nameCustomerBook.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'FLM 10/14/2021 15:27:11'!
measureIfExecutionTimeOf: codeBlock isLessThan: time
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	codeBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning-millisecondsBeforeRunning)  < (time * millisecond)
	
	! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/8/2021 17:37:11'!
try:thisCodeBlock catch: thatError do:	 manageError
	
	
[thisCodeBlock value.
	self fail]
	on: thatError
	do: [:anError|
		manageError value:anError]! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'FLM 10/14/2021 15:31:57'!
verifyIfInCustomerBook: customerBook customerNamed: customerName shouldBeIncluded: expectedToInclude. 

	expectedToInclude ifTrue:[self assert: (customerBook includesCustomerNamed: customerName)]
	ifFalse:[self deny: (customerBook includesCustomerNamed: customerName)].! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/14/2021 15:18:47'!
verifyInCustomerBook: customerBook IncludesNameCustomer: customerName totalCustomersExpected: totalExpect

			self assert: customerBook numberOfCustomers = totalExpect .
			self assert: (customerBook includesCustomerNamed: customerName)! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/14/2021 15:16:35'!
verifyInCustomerBook: customerBook expectedNumberActiveCustomers: expectedActive expectedNumberSuspendedCustomers: expectedSuspended totalNumberCustomers: expectedTotal.
	self assert: expectedActive equals: customerBook numberOfActiveCustomers.
	self assert: expectedSuspended  equals: customerBook numberOfSuspendedCustomers .
	self assert: expectedTotal equals: customerBook numberOfCustomers.

	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FLM 10/12/2021 14:23:58'!
removeCustomerNamed: aName 
 	
	
	
	(self removeCustomer: aName from: active) | (self removeCustomer: aName from: suspended)  ifTrue:[^aName].	
	
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'FLM 10/12/2021 15:50:59'!
operationToCustomer: customerName  WantToAdd: boolAdd  wantSuspend: boolSuspend  wantToRemove:  boolRemove
	boolAdd ifTrue:[self addCustomerNamed: customerName].
	
	boolSuspend ifTrue:[self suspendCustomerNamed: customerName.].
	
	boolRemove ifTrue:[self removeCustomerNamed: customerName].
! !

!CustomerBook methodsFor: 'testing' stamp: 'LEI 10/13/2021 18:28:48'!
operationToCustomer: customerName  wantToSuspend: boolSuspend  wantToRemove:  boolRemove
	
	boolSuspend ifTrue:[self suspendCustomerNamed: customerName.].
	
	boolRemove ifTrue:[self removeCustomerNamed: customerName].
! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'private customer management' stamp: 'FLM 10/12/2021 14:18:31'!
indexOfCustomer: customer from: customerStatusList
	1 to: customerStatusList size do: 
	[ :index |
		customer = (customerStatusList at: index)
			ifTrue: [
				^index.
				
			] 
	].
	^-1.
! !

!CustomerBook methodsFor: 'private customer management' stamp: 'FLM 10/12/2021 15:56:47'!
removeCustomer: customer from: customerStatusList

|wasRemoved customerIndex|

wasRemoved := false.
customerIndex := self indexOfCustomer: customer from: customerStatusList.

(customerIndex ~= -1)	ifTrue:[		customerStatusList removeAt: customerIndex.
		wasRemoved := true.		].


^wasRemoved! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
