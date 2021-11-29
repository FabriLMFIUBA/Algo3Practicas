!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/25/2021 20:49:37'!
test01PortfolioWithNoAccountsRegisteredHas0PesosInBalance
	|portfolio|
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/27/2021 23:21:39'!
test02PortfolioWithOneAccountCalculatesBalanceAccordingly
	|portfolio anAccount|
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: anAccount.
	portfolio registerAccount: anAccount. 
	
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/27/2021 23:22:48'!
test03PortfolioWithMultipleAccountsCalculatesBalanceAccordingly
	|portfolio firstAccount secondAccount|
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	secondAccount := ReceptiveAccount new.
	Deposit register: 150* peso on: secondAccount.
	portfolio registerAccount: firstAccount .
	portfolio registerAccount: secondAccount .
	
	self assert: portfolio balance equals: 250 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/27/2021 23:23:09'!
test04PortfolioBalanceUpdatesDinamically
	|portfolio firstAccount secondAccount|
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	secondAccount := ReceptiveAccount new.
	Deposit register: 150* peso on: secondAccount.
	portfolio registerAccount: firstAccount .
	portfolio registerAccount: secondAccount .
	
	self assert: portfolio balance equals: 250 * peso.
	
	Deposit register: 150* peso on: secondAccount.
	
	self assert: portfolio balance equals: 400 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:36:45'!
test05PortfolioWithAnotherPortfolioInsideCalculatesBalanceAccordingly
	|firstPortfolio secondPortfolio firstAccount secondAccount|
	firstPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	firstPortfolio registerAccount: firstAccount .
	
	secondPortfolio := Portfolio new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 150* peso on: secondAccount.
	secondPortfolio registerAccount: secondAccount .
	
	firstPortfolio registerAccount: secondPortfolio.
	
	self assert: firstPortfolio balance equals: 250 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:37:11'!
test06PortfolioWithMultiplePortfoliosInsideCalculatesBalanceAccordingly
	|firstPortfolio secondPortfolio thirdPortfolio fourthPortfolio firstAccount secondAccount thirdAccount|
	firstPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	firstPortfolio registerAccount: firstAccount .
	
	secondPortfolio := Portfolio new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 150* peso on: secondAccount.
	secondPortfolio registerAccount: secondAccount .
	
	thirdPortfolio := Portfolio new.
	thirdAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: thirdAccount.
	thirdPortfolio registerAccount: thirdAccount .
	
	fourthPortfolio := Portfolio new.
	
	firstPortfolio registerAccount: secondPortfolio.
	firstPortfolio registerAccount: thirdPortfolio.
	firstPortfolio registerAccount: fourthPortfolio .
	
	self assert: firstPortfolio balance equals: 350 * peso.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:38:06'!
test07EmptyPortfolioDoesntIncludeASpecificTransaction
	|portfolio anAccount deposit|
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: anAccount.
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:38:46'!
test08PortfolioWithOneAccountHasRegisteredADepositAccordingly
	|portfolio anAccount deposit|
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: anAccount.
	portfolio registerAccount: anAccount. 
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:39:21'!
test09PortfolioWithMultipleAccountsRegisteredADepositAccrodingly
	|portfolio firstAccount secondAccount deposit|
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	secondAccount := ReceptiveAccount new.
	deposit := Deposit register: 150* peso on: secondAccount.
	portfolio registerAccount: firstAccount .
	portfolio registerAccount: secondAccount .
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:40:05'!
test10PortfolioWithAnotherPortfolioInsideRegistersADepositAccordingly
	|firstPortfolio secondPortfolio firstAccount secondAccount deposit|
	firstPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	firstPortfolio registerAccount: firstAccount .
	
	secondPortfolio := Portfolio new.
	secondAccount := ReceptiveAccount new.
	deposit := Deposit register: 150* peso on: secondAccount.
	secondPortfolio registerAccount: secondAccount .
	
	firstPortfolio registerAccount: secondPortfolio.
	
	self assert: (firstPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 00:40:29'!
test11PortfolioWithMultiplePortfoliosInsideRegiteredADepositAccordingly
	|firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount thirdAccount deposit|
	firstPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100* peso on: firstAccount.
	firstPortfolio registerAccount: firstAccount .
	
	secondPortfolio := Portfolio new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 150* peso on: secondAccount.
	secondPortfolio registerAccount: secondAccount .
	
	thirdPortfolio := Portfolio new.
	thirdAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: thirdAccount.
	thirdPortfolio registerAccount: thirdAccount .
	
	
	firstPortfolio registerAccount: secondPortfolio.
	firstPortfolio registerAccount: thirdPortfolio.
	
	self assert: (firstPortfolio hasRegistered: deposit ).! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 14:17:49'!
test12EmptyPortfolioDoesntIncludeTransactions
	|portfolio |
	portfolio := Portfolio new.
	
	self assert: (portfolio transactions) size = 0.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 14:22:31'!
test13TransactionsFromPortfolioWithOneAccountAre
	|portfolio anAccount deposit withdraw transactions|
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: anAccount.
	withdraw := Withdraw register: 50*peso on: anAccount .
	portfolio registerAccount: anAccount. 
	
	
	transactions := portfolio transactions.
	self assert: (transactions at: 1) = deposit.
	self assert: (transactions at: 2) = withdraw.
	self assert:(transactions size) = 2.! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 14:55:49'!
test14
	|portfolio anAccount anotherAccount deposit withdraw transactions|
	portfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 50*peso on: anotherAccount .
	
	portfolio registerAccount: anAccount. 
	portfolio registerAccount:  anotherAccount.
	
	
	transactions := portfolio transactions.
	self assert:(transactions size) = 2.
	self assert: (transactions at: 1) = deposit.
	self assert: (transactions at: 2) = withdraw.
	! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 14:56:34'!
test15
	|portfolio anotherPortfolio anAccount anotherAccount deposit withdraw transactions|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.	
	
	anAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: anAccount.
	
	anotherAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 50*peso on: anotherAccount .
	
	portfolio registerAccount: anAccount. 
	anotherPortfolio registerAccount: anotherAccount.
	portfolio registerAccount: anotherPortfolio .
	
	
	transactions := portfolio transactions.
	self assert:(transactions size) = 2.
	self assert: (transactions at: 1) = deposit.
	self assert: (transactions at: 2) = withdraw.
	! !

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/28/2021 15:03:58'!
test16
	|mainPortfolio firstAuxPortfolio secondAuxPortfolio firstAccount secondAccount  thirdAccount deposit withdraw  transfer transactions|
	
	mainPortfolio := Portfolio new.
	firstAuxPortfolio := Portfolio new.	
	secondAuxPortfolio := Portfolio new.	
	
	firstAccount := ReceptiveAccount new.
	deposit := Deposit register: 100* peso on: firstAccount .
	mainPortfolio registerAccount: firstAccount.
	
	secondAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 50*peso on: secondAccount .
	firstAuxPortfolio registerAccount: secondAccount.
	mainPortfolio registerAccount: firstAuxPortfolio.
	
	thirdAccount := ReceptiveAccount new.
	transfer := Transfer from: thirdAccount to: secondAccount  for: 10*peso. 
	secondAuxPortfolio registerAccount: thirdAccount.
	mainPortfolio registerAccount: secondAuxPortfolio.

	
	
	transactions := mainPortfolio transactions.
	self assert:(transactions size) = 4.
	self assert: (transactions at: 1) = deposit.
	self assert: (transactions at: 2) = withdraw.
	self assert: (transactions at: 3) = transfer depositLeg.
	self assert: (transactions at: 4) = transfer withdrawLeg .
	! !


!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 12:24:58'!
test01ErrorDuplicateAccounts
	|portfolio anAccount|
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	portfolio registerAccount: anAccount.
	self should:[portfolio registerAccount: anAccount.] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio cannotRegisterDuplicateAccountsErrorMessage ].! !

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 12:30:26'!
test02ErrorAccountAlreadyRegisteredInAnotherPortfolioInsideTheDesiredOne
	|portfolio anotherPortfolio anAccount|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherPortfolio registerAccount: anAccount.
	portfolio registerAccount: anotherPortfolio .
	self should:[portfolio registerAccount: anAccount.] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio cannotRegisterDuplicateAccountsErrorMessage ].! !

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 12:30:54'!
test03ErrorPortfolioCannotRegisterItself
	|portfolio |
	
	portfolio := Portfolio new..
	self should:[portfolio registerAccount: portfolio .] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio portfolioCannotRegisterItselfErrorMessage ].! !

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 12:31:19'!
test03bErrorPortfolioCannotRegisterAPortfolioThatContainsItself
	|mainPortfolio anotherPortfolio|
	
	mainPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anotherPortfolio registerAccount: mainPortfolio.
	self should:[mainPortfolio registerAccount: anotherPortfolio .] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio portfolioCannotRegisterItselfErrorMessage ].! !

!PortfolioTest methodsFor: 'test errors' stamp: 'LEI 11/29/2021 15:28:49'!
test04ErrorRegistrarCuentaExistenteEnPadreEnPortfolioHijo
	|mainPortfolio anotherPortfolio anAccount|
	
	mainPortfolio := Portfolio new.
	anotherPortfolio  := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	mainPortfolio registerAccount: anAccount.
	mainPortfolio registerAccount: anotherPortfolio.
	
	self should:[anotherPortfolio registerAccount: anAccount .] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage ].! !

!PortfolioTest methodsFor: 'test errors' stamp: 'LEI 11/29/2021 15:00:20'!
test05ErrorPortfolioCannotRegisterAPortfolioThatAlreadyIncludesAPreviouslyRegisteredAccount
	|portfolio anotherPortfolio anAccount|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherPortfolio registerAccount: anAccount.
	portfolio registerAccount: anAccount .
	self should:[portfolio registerAccount: anotherPortfolio .] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio cannotRegisterDuplicateAccountsErrorMessage ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FLM 11/25/2021 20:45:00'!
test09BothAccountsRegisterTransfer
	|destinationAccount originAccount transfer |
	
	originAccount  := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: (originAccount hasRegistered: (transfer withdrawLeg)).
	self assert: (destinationAccount hasRegistered: (transfer depositLeg )).	! !

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


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!AccountTransaction methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:04'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

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

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:09'!
balanceValue
	^value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:32:27'!
counterpart
	^ transfer withdrawLeg .! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:31:56'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:42:14'!
register: aValue on: anAccount fromTransfer: aTransfer
	|transferDeposit|
	transferDeposit := self new initializeWithValue: aValue fromTransfer: aTransfer.
	anAccount register: transferDeposit .
	^transferDeposit .! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:20'!
balanceValue
	^ value negated! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:33:25'!
counterpart
	^ transfer depositLeg .! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:33:13'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:42:37'!
register: aValue on: anAccount fromTransfer: aTransfer
	|transferWithdraw|
	transferWithdraw := self new initializeWithValue: aValue fromTransfer: aTransfer.
	anAccount register: transferWithdraw .
	^transferWithdraw .! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

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

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Object subclass: #Portfolio
	instanceVariableNames: 'registeredAccounts parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/25/2021 21:13:52'!
balance
	^registeredAccounts sum: [ :anAccount | anAccount balance.		] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/27/2021 23:43:11'!
hasRegistered: aTransaction
	|i registrado|
	i := 1.
	registrado := false.
	[(i<= (registeredAccounts size)) & (registrado = false)] whileTrue:[
		registrado := ((registeredAccounts at: i) hasRegistered: aTransaction).
		i := i+1].
	^registrado .! !

!Portfolio methodsFor: 'main protocol' stamp: 'LEI 11/29/2021 17:11:54'!
registerAccount: anAccount
	
	(anAccount canBeIncludedIn: self) ifTrue:[
		
		(anAccount isKindOf: Portfolio) ifTrue:[anAccount setPortfolioParent: self.].
		registeredAccounts add: anAccount.
		].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/28/2021 14:54:05'!
transactions
	|transactions|
	transactions  := OrderedCollection new.
	registeredAccounts do:[:element| transactions addAllLast: (element transactions)].
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'LEI 11/29/2021 15:23:17'!
initialize
	registeredAccounts := OrderedCollection new.
	parent := nil.! !


!Portfolio methodsFor: 'for portfolio' stamp: 'LEI 11/29/2021 16:44:26'!
canBeIncludedIn: aPortfolio
	(aPortfolio = self)ifTrue: [self error: self class portfolioCannotRegisterItselfErrorMessage ].

	
	
	registeredAccounts do:[:element|  element canBeIncludedIn: aPortfolio]. 	
	
	^true.
	! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/28/2021 16:45:25'!
includesAccount: anAccount
	
	registeredAccounts do:[:element| (element includesAccount: anAccount)ifTrue: [^true]].
	^false.
	! !

!Portfolio methodsFor: 'for portfolio' stamp: 'LEI 11/29/2021 16:42:19'!
includesAccountMyParent:anAccount.
	(parent ~= nil) ifTrue:[. 
	 ^(parent includesAccount: anAccount).
	].
	^false! !

!Portfolio methodsFor: 'for portfolio' stamp: 'LEI 11/29/2021 16:41:05'!
setPortfolioParent: aPortofolio
	parent := aPortofolio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 16:51:02'!
cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage
	^ 'Cannot register a portfolio if it contains an existing account in parent porfolio!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 15:09:46'!
cannotRegisterDuplicateAccountsErrorMessage
	^ 'Cannot register this account!! It already exists in this portfolio!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 15:53:21'!
portfolioCannotRegisterItselfErrorMessage
	^ 'A portfolio cannot register itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FLM 11/25/2021 20:39:07'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue.		] ifEmpty: [ 0 ]! !

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


!ReceptiveAccount methodsFor: 'for portfolio' stamp: 'LEI 11/29/2021 16:42:19'!
canBeIncludedIn: aPortfolio
	(aPortfolio includesAccountMyParent: self) ifTrue:[self error: Portfolio cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage].
	(aPortfolio includesAccount: self) ifTrue: [self error: Portfolio cannotRegisterDuplicateAccountsErrorMessage] ifFalse: [^true].	
	
	! !

!ReceptiveAccount methodsFor: 'for portfolio' stamp: 'FLM 11/28/2021 16:00:35'!
includesAccount: anAccount
	^anAccount  = self.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Object subclass: #Transfer
	instanceVariableNames: 'depositLeg withdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Alternativo'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:08:29'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:38:12'!
initializeWithValue: ammountInPesos withDepositLeg: 	aDepositLeg withWithdrawLeg: aWithdrawLeg .
	value := ammountInPesos.
	depositLeg  := aDepositLeg.
	withdrawLeg  := aWithdrawLeg.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:29:06'!
value
	^value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:08:39'!
withdrawLeg
	^withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio-Alternativo'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'FLM 11/25/2021 20:37:25'!
from: originAccount to: destinationAccount for: ammountInPesos

	
	|transfer depositLeg withdrawLeg|
	transfer  := self new.
	depositLeg := TransferDeposit register: ammountInPesos on: destinationAccount fromTransfer: transfer.
	withdrawLeg := TransferWithdraw register: ammountInPesos on: originAccount fromTransfer: transfer.
	transfer initializeWithValue: ammountInPesos withDepositLeg: 	depositLeg withWithdrawLeg: withdrawLeg .
	^transfer .
	
	
	! !
