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

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/8/2021 16:37:56'!
measureExecutionTime: codeBlock
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	codeBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ millisecondsAfterRunning - millisecondsBeforeRunning 
	
	! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/10/2021 07:35:34'!
measureExecutionTime: codeBlock lessThan: time
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	codeBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: millisecondsAfterRunning-millisecondsBeforeRunning  < (time * millisecond)
	
	! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/12/2021 13:49:11'!
operationToCustomer: customerName WantToAdd: boolAdd wantSuspend: boolSuspend wantToRemove: boolRemove
	|customerBook activeCustomers suspendedCustomers totalCustomers|
	
	customerBook := CustomerBook new.
	activeCustomers := 0.
	suspendedCustomers  := 0.
	totalCustomers := 0.
		
	boolAdd ifTrue:[	customerBook addCustomerNamed: customerName.
				activeCustomers := activeCustomers  + 1.
				totalCustomers := totalCustomers + 1.
				].
	
	boolSuspend ifTrue:[customerBook suspendCustomerNamed: customerName. 
					suspendedCustomers:= suspendedCustomers +1.
					activeCustomers := activeCustomers -1].
	
	boolRemove ifTrue:[customerBook removeCustomerNamed: customerName.
					totalCustomers := totalCustomers - 1.
					].
	
	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: customerBook numberOfCustomers.
	
	
	^customerBook
	
	
	
 ! !

!CustomerBookTest methodsFor: 'test-private' stamp: 'LEI 10/8/2021 17:37:11'!
try:thisCodeBlock catch: thatError do:	 manageError
	
	
[thisCodeBlock value.
	self fail]
	on: thatError
	do: [:anError|
		manageError value:anError]! !


!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/10/2021 07:58:01'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	
	
	self measureExecutionTime: [customerBook addCustomerNamed: 'John Lennon']  lessThan:50 .
	
	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/10/2021 08:00:22'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self measureExecutionTime:  [customerBook removeCustomerNamed: paulMcCartney] lessThan: 100.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/8/2021 18:16:58'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self try: [customerBook addCustomerNamed: ''] 
	      catch: Error  
	      do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ] 
	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/8/2021 18:17:13'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	

	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'.] 
	      catch: NotFound  
	      do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)] ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/12/2021 13:46:48'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	
	paulMcCartney := 'Paul McCartney'.
	
	
	
	customerBook := self operationToCustomer: 'Paul McCartney' WantToAdd:true  wantSuspend:true  wantToRemove: false.
		
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/8/2021 18:18:33'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	
		
	self try: [ customerBook suspendCustomerNamed: 'Ringo Starr'] 
	      catch: CantSuspend  
	      do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ] 
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LEI 10/8/2021 18:20:30'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
		
	self try: [ customerBook suspendCustomerNamed: johnLennon] 
	      catch: CantSuspend  
	      do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ] 
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

!CustomerBook methodsFor: 'customer management' stamp: 'LEI 10/10/2021 06:04:22'!
removeCustomerNamed: aName 
 	
	
	
	(self removeCustomer: aName fromCollection: active) | (self removeCustomer: aName fromCollection: suspended)  ifTrue:[^aName].	
	
	
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


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'private customer management' stamp: 'LEI 10/10/2021 06:03:20'!
removeCustomer: customer fromCollection: collection

|wasRemoved|

wasRemoved := false.

1 to: collection size do: 
	[ :index |
		customer = (collection at: index)
			ifTrue: [
				collection removeAt: index.
				wasRemoved := true.
				
			] 
	].

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
