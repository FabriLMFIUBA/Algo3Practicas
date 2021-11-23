!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FLM 11/23/2021 11:57:09'!
test08TransferBetweenTwoAccountsModifiesTheirBalanceAccordingly
	|destinationAccount originAccount|
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: originAccount balance equals: -100 * peso.
	self assert: destinationAccount balance equals: 100 * peso.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FLM 11/23/2021 13:07:15'!
test09BothAccountsRegisterTransfer
	|destinationAccount originAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: 1 equals: originAccount transactions size.
	self assert: (self isTransfer:(originAccount transactions at: 1)).
	
	self assert: 1 equals: destinationAccount transactions size.
	self assert: (self isTransfer:(destinationAccount transactions at: 1)).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FLM 11/23/2021 13:19:19'!
test10TransfersKnowTheirCounterpart
	|destinationAccount originAccount |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.

	self assert: ((originAccount transactions at: 1) counterpart) equals: (destinationAccount transactions at: 1).
	
	self assert: ((destinationAccount transactions at: 1) counterpart) equals: (originAccount transactions at: 1).! !


!ReceptiveAccountTest methodsFor: 'private' stamp: 'FLM 11/23/2021 13:00:19'!
isTransfer: aTransaction
	^ aTransaction isKindOf: Transfer.
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:04'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:15'!
balanceValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:29:06'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!


!Transfer class methodsFor: 'instance creation' stamp: 'FLM 11/23/2021 13:22:50'!
from: originAccount to: destinationAccount for: ammountInPesos

	|transferDeposit transferWithdraw |
	
	transferDeposit := TransferDeposit for: ammountInPesos withCounterpart: transferWithdraw.
	transferWithdraw := TransferWithdraw for:  ammountInPesos withCounterpart: transferDeposit. 
	
	originAccount register: transferWithdraw .
	destinationAccount register: transferDeposit .
	
	
	! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:09'!
balanceValue
	^value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 13:12:21'!
counterpart
	^ counterpart! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:55:21'!
initializeFor: aValue

	value := aValue ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 13:11:45'!
initializeFor: aValue withCounterpart: aCounterpart

	value := aValue .
	counterpart := aCounterpart .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:55:07'!
for: aValue

	^ self new initializeFor: aValue! !

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:53:52'!
for: aValue withCounterpart: aCounterpart

	^ self new initializeFor: aValue withCounterpart: aCounterpart.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:20'!
balanceValue
	^ value negated! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 13:12:26'!
counterpart
	^ counterpart! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:45:21'!
initializeFor: aValue

	value := aValue ! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 13:11:51'!
initializeFor: aValue withCounterpart: aCounterpart

	value := aValue .
	counterpart := aCounterpart .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:45:07'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 13:11:59'!
for: aValue withCounterpart: aCounterpart

	^ self new initializeFor: aValue withCounterpart: aCounterpart.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:28'!
balanceValue

	^ value negated! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FLM 11/23/2021 11:47:41'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
