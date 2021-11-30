!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

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

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/29/2021 18:39:44'!
test13CanObtainTransactionsFromPortfolioWithOneAccount
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

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/29/2021 18:39:35'!
test14CanObtainTransactionsFromPortfolioWithMultipleAccounts
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

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/29/2021 18:40:21'!
test15CanObtainTransactionsFromPortfolioWithAnotherPortfolioInside
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

!PortfolioTest methodsFor: 'test main protocol' stamp: 'FLM 11/29/2021 18:40:42'!
test16CanObtainTransactionsFromPortfolioWithMultiplePortfoliosInside
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

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 18:06:49'!
test01bErrorDuplicateAccountsInChildPortfolio
	|portfolio anotherPortfolio anAccount|
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	portfolio registerAccount: anotherPortfolio .	anotherPortfolio registerAccount: anAccount.
	self should:[anotherPortfolio registerAccount: anAccount..] 
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

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 18:41:32'!
test04ErrorCannotRegisterAccountIfItHasAlreadyBeenRegisteredInParentPortfolio
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

!PortfolioTest methodsFor: 'test errors' stamp: 'FLM 11/29/2021 18:34:20'!
test06CannotRegisterDuplicatePortfolios
	|portfolio anotherPortfolio |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	portfolio registerAccount: anotherPortfolio .
	self should:[portfolio registerAccount: anotherPortfolio .] 
	raise: Error 
	withExceptionDo:[:anError|
		self assert: anError messageText equals: Portfolio cannotRegisterDuplicatePortfoliosErrorMessage ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Ejercicio2'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:03:20'!
test01tn
	|anAccount transferNet |
	
	anAccount := ReceptiveAccount new.
	transferNet := anAccount transferNetTransaction.
	
	self assert: transferNet equals: 0 * peso.
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:08:56'!
test02tn


| 	anAccount anotherAccount transferNet |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	transferNet := anAccount  transferNetTransaction.
	
	self assert: transferNet equals: 10 * peso.
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:33:25'!
test03tn


| 	anAccount anotherAccount transferNet transferNetAnotherAccount |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount .
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	transferNet := anAccount  transferNetTransaction.
	transferNetAnotherAccount := anotherAccount transferNetTransaction .
	
	self assert: transferNet equals: 10 * peso.
	self assert: transferNetAnotherAccount equals: -10*peso
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:35:00'!
test04tn


| 	mainPortfolio  transferNet  |

	mainPortfolio := Portfolio new.


	transferNet := mainPortfolio  transferNetTransaction.

	
	self assert: transferNet equals: 0 * peso.

	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:46:29'!
test05tn


	|mainPortfolio anAccount anotherAccount  transferNet |
	
	mainPortfolio := Portfolio new.

	
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount .
	
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	
	mainPortfolio registerAccount: anAccount.
	
	
	transferNet := mainPortfolio  transferNetTransaction.

	self assert: transferNet equals: 10 * peso.
	
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 11/30/2021 16:45:41'!
test06tn


	|mainPortfolio aPortfolio anAccount anotherAccount auxAccount transferNet |
	
	mainPortfolio := Portfolio new.
	aPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	auxAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount .
	
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	Transfer from: anotherAccount  to: auxAccount  for: 25*peso.
	
	mainPortfolio registerAccount: anAccount.
	aPortfolio registerAccount: auxAccount.
	mainPortfolio registerAccount: aPortfolio.
	
	transferNet := mainPortfolio  transferNetTransaction.

	self assert: transferNet equals: 35 * peso.
	
	
	
	
	
	! !


!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:56:20'!
test01

| 	accountSumary anAccount |
	anAccount := ReceptiveAccount new.
	
	accountSumary:= anAccount summary.
	
	self assert: accountSumary size equals: 1.
	self assert: (accountSumary at: 1) equals: 'Balance = 0 pesos'.! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 14:59:41'!
test02
	
	| accountSumary anAccount |
	anAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	
	accountSumary := anAccount summary.
	
	self assert: accountSumary size equals: 2.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Balance = 100 pesos'.
	
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:24:56'!
test03
	
	| accountSumary anAccount anotherAccount |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 25 * peso.
	Transfer from: anotherAccount to: anAccount for: 15 * peso.
	
	
	accountSumary := anAccount summary .
	
	self assert: accountSumary size equals: 5.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 50 pesos'.
	self assert: (accountSumary at: 3) equals: 'Salida por transferencia de 25 pesos'.
	self assert: (accountSumary at: 4) equals: 'Entrada por transferencia de 15 pesos'.
	self assert: (accountSumary at: 5) equals: 'Balance = 40 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:34:37'!
test04
	
	| accountSumary mainPortfolio |
	mainPortfolio := Portfolio new.
	
	

	
	accountSumary := mainPortfolio summary .
	
	self assert: accountSumary size equals: 1.
	self assert: (accountSumary at: 1) equals: 'Balance = 0 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:43:39'!
test05
	
	| accountSumary mainPortfolio anAccount anotherAccount |
	mainPortfolio := Portfolio new.
	anAccount := ReceptiveAccount  new.
	anotherAccount  := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount .
	Withdraw register: 75* peso on: anotherAccount .
	
	mainPortfolio registerAccount: anAccount.
	mainPortfolio  registerAccount: anotherAccount .

	
	accountSumary := mainPortfolio summary .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:51:23'!
test06
	
	| accountSumary mainPortfolio aPortfolio anAccount anotherAccount |
	mainPortfolio := Portfolio new.
	aPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount  new.
	anotherAccount  := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount .
	Withdraw register: 75* peso on: anotherAccount .
	
	mainPortfolio registerAccount: anAccount.
	aPortfolio  registerAccount: anotherAccount .
	mainPortfolio registerAccount: aPortfolio .

	
	accountSumary := mainPortfolio summary .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 11/30/2021 15:54:12'!
test07
	
	| accountSumary mainPortfolio aPortfolio anotherPortfolio anAccount anotherAccount |
	mainPortfolio := Portfolio new.
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount  new.
	anotherAccount  := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount .
	Withdraw register: 75* peso on: anotherAccount .
	
	anotherPortfolio registerAccount: anAccount.
	aPortfolio  registerAccount: anotherAccount .
	mainPortfolio registerAccount: anotherPortfolio. 
	mainPortfolio registerAccount: aPortfolio .
	

	
	accountSumary := mainPortfolio summary .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportTest class' category: 'ServiciosFinancieros-Ejercicio2'!
ReportTest class
	instanceVariableNames: ''!

!ReportTest class methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 14:51:37'!
test01

	| anAccount  accountSummary |
	
	anAccount:= ReceptiveAccount  new.
	
	
! !

!ReportTest class methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 14:51:49'!
test02

	| anAccount  accountSummary |
	
	anAccount:= ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: anAccount .
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Account methodsFor: 'reports' stamp: 'LEI 11/30/2021 15:47:05'!
summary
	|accountSummary |
	
	accountSummary := OrderedCollection new.
	
	
	self transactions do:[: aTranstaction | 
		
			accountSummary add: aTranstaction infoAsString.
			
		].

	accountSummary add: ('Balance = ' , (self balance) asString ).
	
	^accountSummary ! !

!Account methodsFor: 'reports' stamp: 'LEI 11/30/2021 16:54:42'!
transferNetTransaction
	
	^(self transactions) sum:[:aTrasaction|
		((aTrasaction isKindOf: TransferDeposit) or: [aTrasaction isKindOf: TransferWithdraw]) ifTrue:[ aTrasaction balanceValue ]ifFalse:[0*peso].
		
		]ifEmpty: [0 * peso]! !


!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:47:26'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:48:18'!
hasRegistered: aTransaction
	self subclassResponsibility .! !

!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:47:21'!
transactions
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'registeredAccounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Portfolio methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:01:50'!
balance
	^registeredAccounts sum: [ :anAccount | anAccount balance.		] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/27/2021 23:43:11'!
hasRegistered: aTransaction
	|i registrado|
	i := 1.
	registrado := false.
	[(i<= (registeredAccounts size)) & (registrado = false)] whileTrue:[
		registrado := ((registeredAccounts at: i) hasRegistered: aTransaction).
		i := i+1].
	^registrado .! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/29/2021 18:24:06'!
registerAccount: anAccount
	
	(anAccount canBeIncludedIn: self) ifTrue:[
		
		anAccount hasBeenRegisteredInPortfolio: self.
		registeredAccounts add: anAccount.
		].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/28/2021 14:54:05'!
transactions
	|transactions|
	transactions  := OrderedCollection new.
	registeredAccounts do:[:element| transactions addAllLast: (element transactions)].
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'LEI 11/29/2021 21:02:02'!
initialize

	registeredAccounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:35:45'!
canBeIncludedIn: aPortfolio
	(aPortfolio = self)ifTrue: [self error: self class portfolioCannotRegisterItselfErrorMessage ].

	(aPortfolio includesAccount: self) ifTrue:[self error: self class cannotRegisterDuplicatePortfoliosErrorMessage ].
	
	registeredAccounts do:[:element|  element canBeIncludedIn: aPortfolio]. 	
	
	^true.
	! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:23:54'!
hasBeenRegisteredInPortfolio: aPortofolio
	parents add: aPortofolio.! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:31:38'!
includesAccount: anAccount
		(anAccount  = self) ifTrue:[^true].
	registeredAccounts do:[:element| (element includesAccount: anAccount)ifTrue: [^true]].
	^false.
	! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:23:09'!
includesAccountInParents: anAccount
	parents do:[:element| (element includesAccount: anAccount) ifTrue:[^true] ].
	^false.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 16:51:02'!
cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage
	^ 'Cannot register a portfolio if it contains an existing account in parent porfolio!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 15:09:46'!
cannotRegisterDuplicateAccountsErrorMessage
	^ 'Cannot register this account!! It already exists in this portfolio!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/29/2021 18:34:49'!
cannotRegisterDuplicatePortfoliosErrorMessage
	^'Cannot register duplicated portfolios!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FLM 11/28/2021 15:53:21'!
portfolioCannotRegisterItselfErrorMessage
	^ 'A portfolio cannot register itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:01:38'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue.		] ifEmpty: [ 0 * peso ]! !

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


!ReceptiveAccount methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:17:50'!
canBeIncludedIn: aPortfolio	(aPortfolio includesAccount: self) ifTrue: [self error: Portfolio cannotRegisterDuplicateAccountsErrorMessage].
	(aPortfolio includesAccountInParents: self) ifTrue:[self error: Portfolio cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage]	 ifFalse: [^true].	
	
	! !

!ReceptiveAccount methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:24:16'!
hasBeenRegisteredInPortfolio: aPortfolio
	! !

!ReceptiveAccount methodsFor: 'for portfolio' stamp: 'FLM 11/28/2021 16:00:35'!
includesAccount: anAccount
	^anAccount  = self.! !



!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio2'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!AccountTransaction methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:04'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:28:40'!
infoAsString

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:15'!
balanceValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:30:09'!
infoAsString

	^('Deposito por ', (self value) asString).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:09'!
balanceValue
	^value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:32:27'!
counterpart
	^ transfer withdrawLeg .! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:31:20'!
infoAsString

	^('Entrada por transferencia de ', (self value) asString).
		! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:31:56'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:23:31'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio2'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:42:14'!
register: aValue on: anAccount fromTransfer: aTransfer
	|transferDeposit|
	transferDeposit := self new initializeWithValue: aValue fromTransfer: aTransfer.
	anAccount register: transferDeposit .
	^transferDeposit .! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/23/2021 12:44:20'!
balanceValue
	^ value negated! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:33:25'!
counterpart
	^ transfer depositLeg .! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:32:03'!
infoAsString


	
		^('Salida por transferencia de ', (self value) asString).
		! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:33:13'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:23:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio2'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'FLM 11/25/2021 20:42:37'!
register: aValue on: anAccount fromTransfer: aTransfer
	|transferWithdraw|
	transferWithdraw := self new initializeWithValue: aValue fromTransfer: aTransfer.
	anAccount register: transferWithdraw .
	^transferWithdraw .! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'FLM 11/23/2021 11:47:28'!
balanceValue

	^ value negated! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'LEI 11/30/2021 15:30:50'!
infoAsString

		^ ('Extraccion por ', (self value) asString).
		
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio2'!
Object subclass: #Transfer
	instanceVariableNames: 'depositLeg withdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

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

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio2'!
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
