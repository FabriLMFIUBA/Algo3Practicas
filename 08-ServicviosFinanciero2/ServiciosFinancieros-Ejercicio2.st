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

!ReportTest methodsFor: 'setUp' stamp: 'LEI 12/5/2021 23:09:50'!
setUp
! !


!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:12:59'!
test01TNEmptyAccount
	|anAccount transferNet |
	
	anAccount := ReceptiveAccount new.
	transferNet := TransferNet of: anAccount .
	
	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 0 pesos'.
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:11:15'!
test02TNAccountWithOnlyTransferTransactions


| 	anAccount anotherAccount transferNet |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	transferNet := TransferNet of: anAccount ..
	
	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 10 pesos'.
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:11:48'!
test03TNAccountWithManyTransactions


| 	anAccount anotherAccount transferNet transferNetAnotherAccount |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount .
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	transferNet := TransferNet of: anAccount ..
	transferNetAnotherAccount := TransferNet of: anotherAccount .
	
	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 10 pesos'.
	
	self assert:(transferNetAnotherAccount size) equals: 1.
	self assert: (transferNetAnotherAccount at: 1) equals: 'Neto de transferencias = -10 pesos'.
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:12:44'!
test04TNEmptyPortfolio


| 	mainPortfolio  transferNet  |

	mainPortfolio := Portfolio new.


	transferNet := TransferNet of: mainPortfolio .

	
	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 0 pesos'.

	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:13:50'!
test05TNPortfolioWithAcountThatOnlyHasTransferTransactions


	|mainPortfolio anAccount anotherAccount  transferNet |
	
	mainPortfolio := Portfolio new.

	
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount .
	
	Transfer from: anAccount to: anotherAccount for: 10 * peso.
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	
	mainPortfolio registerAccount: anAccount.
	
	
	transferNet := TransferNet of: mainPortfolio.

	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 10 pesos'.
	
	
	
	
	
	! !

!ReportTest methodsFor: 'transfer net test' stamp: 'LEI 12/4/2021 16:21:52'!
test06TNPortfolioWithanAccountAndAportfolioWithAnAccount


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
	
	transferNet := TransferNet of: mainPortfolio.

	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 35 pesos'.
	
	
	
	
	
	! !


!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:43:03'!
test01SummaryOfAnEmptyAccount

| 	accountSumary anAccount |
	
	anAccount := ReceptiveAccount new.
	accountSumary:= AccountSummary of: anAccount .
	
	self assert: accountSumary size equals: 1.
	self assert: (accountSumary at: 1) equals: 'Balance = 0 pesos'.! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 15:16:49'!
test02SummaryOfAnAccountWithATransaction
	
	| accountSumary anAccount |
	anAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	
	accountSumary := AccountSummary of: anAccount.
	
	self assert: accountSumary size equals: 2.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Balance = 100 pesos'.
	
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:00:32'!
test03SummaryOfAnAccountWithManyTransaction
	
	| accountSumary anAccount anotherAccount |
	anAccount := ReceptiveAccount new.
	anotherAccount:= ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 25 * peso.
	Transfer from: anotherAccount to: anAccount for: 15 * peso.
	
	
	accountSumary := AccountSummary of: anAccount.
	
	self assert: accountSumary size equals: 5.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 50 pesos'.
	self assert: (accountSumary at: 3) equals: 'Salida por transferencia de 25 pesos'.
	self assert: (accountSumary at: 4) equals: 'Entrada por transferencia de 15 pesos'.
	self assert: (accountSumary at: 5) equals: 'Balance = 40 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:02:09'!
test04SummaryOfAnEmptyPortfolio
	
	| accountSumary mainPortfolio |
	mainPortfolio := Portfolio new.
	
	

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 1.
	self assert: (accountSumary at: 1) equals: 'Balance = 0 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:04:57'!
test05SummaryOfAportfolioWithAnAccontWithTrasactions
	
	| accountSumary mainPortfolio anAccount anotherAccount |
	mainPortfolio := Portfolio new.
	anAccount := ReceptiveAccount  new.
	anotherAccount  := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: anAccount .
	Withdraw register: 75* peso on: anotherAccount .
	
	mainPortfolio registerAccount: anAccount.
	mainPortfolio  registerAccount: anotherAccount .

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:06:12'!
test06SummaryOfAPortfolioWithAnAccountAndPortfolioWihAnAccount
	
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

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !

!ReportTest methodsFor: 'summary test' stamp: 'LEI 12/4/2021 16:07:05'!
test07SummaryWithPortfoliosWithPorfoliosThatHaveAccounts
	
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
	

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 
	! !


!ReportTest methodsFor: 'portfolio tree printer test' stamp: 'LEI 12/4/2021 16:27:53'!
test01PTPEmptyPortfolio
	|aPortfolio report|
	aPortfolio := Portfolio named: 'Portfolio de la familia Villegas'.
	report := PortfolioTreePrinter of: aPortfolio.
	
	self assert: (report size) equals: 1.
	self assert: (report at:1)equals:'Portfolio de la familia Villegas'.! !

!ReportTest methodsFor: 'portfolio tree printer test' stamp: 'LEI 12/4/2021 16:29:21'!
test02PTPPortfolioWithAnAccount
	|aPortfolio anAccount report|
	aPortfolio := Portfolio named: 'Portfolio de la familia Villegas'.
	anAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	aPortfolio registerAccount: anAccount.
	report := PortfolioTreePrinter of: aPortfolio.
	
	self assert: (report size) equals: 2.
	self assert: (report at:1)equals:'Portfolio de la familia Villegas'.
	self assert:  (report at:2) equals: '   Cuenta de Maria'.! !

!ReportTest methodsFor: 'portfolio tree printer test' stamp: 'LEI 12/4/2021 16:30:36'!
test03PTPPortfolioWithAnAccountAndAnotherPortfolio
	|aPortfolio firstChildAccount childPortfolio report|
	aPortfolio := Portfolio named: 'Portfolio de la familia Villegas'.
	firstChildAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	aPortfolio registerAccount: firstChildAccount .
	childPortfolio := Portfolio named: 'Portfolio de hijos'.
	aPortfolio registerAccount: childPortfolio .
	report := PortfolioTreePrinter of: aPortfolio.
	
	self assert: (report size) equals: 3.
	self assert: (report at:1)equals:'Portfolio de la familia Villegas'.
	self assert:  (report at:2) equals: '   Cuenta de Maria'.
	self assert:  (report at:3) equals: '   Portfolio de hijos'.! !

!ReportTest methodsFor: 'portfolio tree printer test' stamp: 'LEI 12/4/2021 16:32:03'!
test04PTPPorfolioWihAnAccountAndAnotherPortfolioThatHasAccounts
	|mainPortfolio mariasAccount firstChildAccount  secondChildAccount childrenPortfolio report|
	mainPortfolio := Portfolio named: 'Portfolio de la familia Villegas'.
	mariasAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	mainPortfolio registerAccount: mariasAccount .
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	firstChildAccount  := ReceptiveAccount named: 'Cuenta de Juan'.
	secondChildAccount  := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio registerAccount: firstChildAccount.
	childrenPortfolio registerAccount: secondChildAccount.
	
	mainPortfolio registerAccount: childrenPortfolio .
	report := PortfolioTreePrinter of: mainPortfolio .
	
	self assert: (report size) equals: 5.
	self assert: (report at:1)equals:'Portfolio de la familia Villegas'.
	self assert:  (report at:2) equals: '   Cuenta de Maria'.
	self assert:  (report at:3) equals: '   Portfolio de hijos'.
	self assert:  (report at:4) equals: '      Cuenta de Juan'.
	self assert:  (report at:5) equals: '      Cuenta de Angeles'.! !


!ReportTest methodsFor: 'portfolio detailed tree printer test' stamp: 'LEI 12/4/2021 16:36:51'!
test01PDTPEmptyPortfolio
	|mainPortfolio report|
	
	mainPortfolio := Portfolio named: 'Portfolio familia Vallejos'.
	
	report := PortfolioDetailedTreePrinter of:mainPortfolio.
	
	self assert: report size equals: 2.
	
	self assert:(report at:1) equals: 'Portfolio familia Vallejos'.
	self assert:(report at:2) equals: '   Balance = 0 pesos'.! !

!ReportTest methodsFor: 'portfolio detailed tree printer test' stamp: 'LEI 12/4/2021 16:37:58'!
test02PDTPPortfolioWithAnEmptyAccount
	|mainPortfolio anAccount report|
	
	mainPortfolio := Portfolio named: 'Portfolio familia Vallejos'.
	anAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	mainPortfolio registerAccount: anAccount.
	report := PortfolioDetailedTreePrinter of:mainPortfolio.
	
	self assert: report size equals: 4.
	
	self assert:(report at:1) equals: 'Portfolio familia Vallejos'.
	self assert:(report at:2) equals: '   Cuenta de Maria'.
	self assert:(report at:3) equals: '      Balance = 0 pesos'.
	self assert:(report at:4) equals: '   Balance = 0 pesos'.! !

!ReportTest methodsFor: 'portfolio detailed tree printer test' stamp: 'LEI 12/4/2021 16:38:22'!
test03PDTPPortfolioWithAccountThatHasTransactions
	|mainPortfolio anAccount auxAccount report|
	
	mainPortfolio := Portfolio named: 'Portfolio familia Vallejos'.
	anAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	Deposit register: 100* peso on: anAccount.
	Withdraw register: 150* peso on: anAccount.
	mainPortfolio registerAccount: anAccount.
	
	auxAccount := ReceptiveAccount named: 'Cuenta auxiliar'.
	Transfer from: auxAccount to: anAccount for: 50*peso.
	 Transfer from: anAccount to: auxAccount for: 250*peso.
	
	report := PortfolioDetailedTreePrinter of:mainPortfolio.
	
	self assert: report size equals: 8.
	
	self assert:(report at:1) equals: 'Portfolio familia Vallejos'.
	self assert:(report at:2) equals: '   Cuenta de Maria'.
	self assert:(report at:3) equals: '      Deposito por 100 pesos'.
	self assert:(report at:4) equals: '      Extraccion por 150 pesos'.
	self assert:(report at:5) equals: '      Entrada por transferencia de 50 pesos'.
	self assert:(report at:6) equals: '      Salida por transferencia de 250 pesos'.
	self assert:(report at:7) equals: '      Balance = -250 pesos'.
	self assert:(report at:8) equals: '   Balance = -250 pesos'.! !

!ReportTest methodsFor: 'portfolio detailed tree printer test' stamp: 'LEI 12/5/2021 22:41:56'!
test04PDTP

	|mainPortfolio mariasAccount childrenPortfolio juansAccount josesAccount report|
	
	mainPortfolio := Portfolio named: 'Portfolio familia Vallejos'.
	mariasAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	Deposit register: 100* peso on: mariasAccount.
	Withdraw register: 150* peso on: mariasAccount.
	mainPortfolio registerAccount: mariasAccount.
	
	juansAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	Transfer from: juansAccount to: mariasAccount for: 50*peso.
	 Transfer from: mariasAccount to: juansAccount for: 250*peso.
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with:juansAccount .
	mainPortfolio registerAccount: childrenPortfolio.
	
	josesAccount := ReceptiveAccount named: 'Cuenta de Jose'.
	Withdraw register: 20*peso on: josesAccount.
	mainPortfolio registerAccount: josesAccount .
	
	
	report := PortfolioDetailedTreePrinter of:mainPortfolio.
	
	self assert: report size equals: 17.
	
	self assert:(report at:1) equals: 'Portfolio familia Vallejos'.
	self assert:(report at:2) equals: '   Cuenta de Maria'.
	self assert:(report at:3) equals: '      Deposito por 100 pesos'.
	self assert:(report at:4) equals: '      Extraccion por 150 pesos'.
	self assert:(report at:5) equals: '      Entrada por transferencia de 50 pesos'.
	self assert:(report at:6) equals: '      Salida por transferencia de 250 pesos'.
	self assert:(report at:7) equals: '      Balance = -250 pesos'.
	self assert:(report at:8) equals: '   Portfolio de hijos'.
	self assert:(report at:9) equals: '      Cuenta de Juan'.
	self assert:(report at:10) equals: '         Salida por transferencia de 50 pesos'.
	self assert:(report at:11) equals: '         Entrada por transferencia de 250 pesos'.
	self assert:(report at:12) equals: '         Balance = 200 pesos'.
	self assert:(report at:13) equals: '      Balance = 200 pesos'.
	self assert:(report at:14) equals: '   Cuenta de Jose'.
	self assert:(report at:15) equals: '      Extraccion por 20 pesos'.
	self assert:(report at:16) equals: '      Balance = -20 pesos'.
	self assert:(report at:17) equals: '   Balance = -70 pesos'.! !


!classDefinition: #ReportTestRevenge category: 'ServiciosFinancieros-Ejercicio2'!
TestCase subclass: #ReportTestRevenge
	instanceVariableNames: 'mainPortfolio mariasAccount juansAccount childrenPortfolio josesAccount cousinPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!ReportTestRevenge methodsFor: 'setUp' stamp: 'LEI 12/5/2021 23:24:52'!
setUp


	mainPortfolio := Portfolio named: 'Portfolio familia Vallejos'.
	mariasAccount := ReceptiveAccount named: 'Cuenta de Maria'.
	juansAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	josesAccount := ReceptiveAccount named: 'Cuenta de Jose'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	cousinPortfolio := Portfolio named: 'Portfolio de primos'.
	
	
	.! !


!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:38:46'!
test01SummaryOfAnEmptyAccount

| 	accountSumary  |
	
	
	accountSumary:= AccountSummary of: mariasAccount .
	
	self assert: accountSumary totalNumberOfTextLinesEquals: 1.
	self assert: accountSumary atLine: 1  equals: 'Balance = 0 pesos'.
! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:15:42'!
test02SummaryOfAnAccountWithATransaction
	
	| accountSumary |

	
	Deposit register: 100 * peso on: mariasAccount .
	
	accountSumary := AccountSummary of: mariasAccount .
	
	self assert: accountSumary size equals: 2.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Balance = 100 pesos'.! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:16:50'!
test03SummaryOfAnAccountWithManyTransaction
	
	| accountSumary |
.
	
	Deposit register: 100 * peso on: mariasAccount .
	Withdraw register: 50 * peso on: mariasAccount .
	Transfer from: mariasAccount to: juansAccount for: 25 * peso.
	Transfer from: juansAccount to: mariasAccount for: 15 * peso.
	
	
	accountSumary := AccountSummary of: mariasAccount .
	
	self assert: accountSumary size equals: 5.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 50 pesos'.
	self assert: (accountSumary at: 3) equals: 'Salida por transferencia de 25 pesos'.
	self assert: (accountSumary at: 4) equals: 'Entrada por transferencia de 15 pesos'.
	self assert: (accountSumary at: 5) equals: 'Balance = 40 pesos'.! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:17:23'!
test04SummaryOfAnEmptyPortfolio
	
	| accountSumary |
	
	
	

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 1.
	self assert: (accountSumary at: 1) equals: 'Balance = 0 pesos'.! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:21:08'!
test05SummaryOfAportfolioWithManyAccontsWithTrasactions
	
	| accountSumary  |
.
	
	Deposit register: 100 * peso on: mariasAccount .
	Withdraw register: 75* peso on: josesAccount .
	
	mainPortfolio registerAccount: mariasAccount .
	mainPortfolio  registerAccount: josesAccount .

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 ! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:19:07'!
test06SummaryOfAPortfolioWithAnAccountAndPortfolioWihAnAccount
	
	| accountSumary |


	
	Deposit register: 100 * peso on: mariasAccount .
	Withdraw register: 75* peso on: juansAccount .
	
	mainPortfolio registerAccount: mariasAccount .
	childrenPortfolio  registerAccount: juansAccount .
	mainPortfolio registerAccount: childrenPortfolio .

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.
	 ! !

!ReportTestRevenge methodsFor: 'Summary Test' stamp: 'LEI 12/5/2021 23:29:33'!
test07SummaryWithPortfoliosWithPorfoliosThatHaveAccounts
	
	| accountSumary |


	
	Deposit register: 100 * peso on: mariasAccount .
	Withdraw register: 75* peso on: juansAccount .
	
	childrenPortfolio registerAccount: mariasAccount .
	cousinPortfolio  registerAccount: juansAccount .
	
	
	mainPortfolio registerAccount: childrenPortfolio. 
	mainPortfolio registerAccount: cousinPortfolio .
	

	
	accountSumary := AccountSummary of: mainPortfolio .
	
	self assert: accountSumary size equals: 3.
	self assert: (accountSumary at: 1) equals: 'Deposito por 100 pesos'.
	self assert: (accountSumary at: 2) equals: 'Extraccion por 75 pesos'.
	self assert: (accountSumary at: 3) equals: 'Balance = 25 pesos'.! !


!ReportTestRevenge methodsFor: 'private' stamp: 'LEI 12/5/2021 23:36:35'!
assert: aReport atLine: aLine equals: aString
	self assert:(aReport at: aLine) equals:aString.! !

!ReportTestRevenge methodsFor: 'private' stamp: 'LEI 12/5/2021 23:38:04'!
assert: aReport totalNumberOfTextLinesEquals: anAmount
	self assert: aReport size equals: anAmount.! !


!ReportTestRevenge methodsFor: 'Transfer Net test' stamp: 'LEI 12/5/2021 23:39:46'!
test01TNEmptyAccount
	|transferNet |
	

	transferNet := TransferNet of: mariasAccount .
	
	self assert: transferNet   totalNumberOfTextLinesEquals: 1.
	self assert: transferNet atLine: 1  equals: 'Neto de transferencias = 0 pesos'.! !

!ReportTestRevenge methodsFor: 'Transfer Net test' stamp: 'LEI 12/5/2021 23:33:58'!
test02TNAccountWithOnlyTransferTransactions


| 	transferNet |

	
	
	Transfer from: mariasAccount to: juansAccount for: 10 * peso.
	Transfer from: juansAccount to: mariasAccount for: 20 * peso.
	
	transferNet := TransferNet of: mariasAccount .
	
	self assert:(transferNet size) equals: 1.
	self assert: (transferNet at: 1) equals: 'Neto de transferencias = 10 pesos'.
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:47:26'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'FLM 12/2/2021 21:22:02'!
forEachTransactionDo: aBlock
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:48:18'!
hasRegistered: aTransaction
	self subclassResponsibility .! !

!Account methodsFor: 'main protocol' stamp: 'FLM 12/3/2021 15:34:04'!
name
	self  subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:47:21'!
transactions
	self subclassResponsibility.! !


!Account methodsFor: 'as yet unclassified' stamp: 'LEI 12/3/2021 21:53:04'!
visitedByReport: aReport

	self subclassResponsibility .! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'registeredAccounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Portfolio methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:01:50'!
balance
	^registeredAccounts sum: [ :anAccount | anAccount balance.		] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 12/2/2021 21:24:55'!
forEachTransactionDo: aBlock
	registeredAccounts do:[:anAccount| anAccount forEachTransactionDo: aBlock].! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 11/27/2021 23:43:11'!
hasRegistered: aTransaction
	|i registrado|
	i := 1.
	registrado := false.
	[(i<= (registeredAccounts size)) & (registrado = false)] whileTrue:[
		registrado := ((registeredAccounts at: i) hasRegistered: aTransaction).
		i := i+1].
	^registrado .! !

!Portfolio methodsFor: 'main protocol' stamp: 'FLM 12/3/2021 15:34:08'!
name
	^name.! !

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

!Portfolio methodsFor: 'initialization' stamp: 'FLM 12/3/2021 15:15:11'!
initializeWithName: accountName.

	registeredAccounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := accountName.! !

!Portfolio methodsFor: 'initialization' stamp: 'FLM 12/3/2021 15:16:45'!
initializeWithName: accountName with: childAccount

	registeredAccounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := accountName.
	self registerAccount: childAccount.! !

!Portfolio methodsFor: 'initialization' stamp: 'FLM 12/3/2021 15:17:24'!
initializeWithName: accountName with: childAccount with: anotherChildAccount

	registeredAccounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := accountName.
	self registerAccount: childAccount.
	self registerAccount: anotherChildAccount.! !


!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:35:45'!
canBeIncludedIn: aPortfolio
	(aPortfolio = self)ifTrue: [self error: self class portfolioCannotRegisterItselfErrorMessage ].

	(aPortfolio includesAccount: self) ifTrue:[self error: self class cannotRegisterDuplicatePortfoliosErrorMessage ].
	
	registeredAccounts do:[:element|  element canBeIncludedIn: aPortfolio]. 	
	
	^true.
	! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 12/3/2021 16:01:11'!
forEachChildAccountDo: aBlock
	registeredAccounts do:[:anAccount|
		aBlock value: anAccount.
		(anAccount isKindOf: Portfolio) ifTrue:[anAccount forEachChildAccountDo: aBlock]].! !

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 12/3/2021 16:26:47'!
forEachDirectChildAccountDo: aBlock
	registeredAccounts do:[:anAccount|		aBlock value: anAccount.].! !

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

!Portfolio methodsFor: 'for portfolio' stamp: 'FLM 11/29/2021 18:24:06'!
registerAccount: anAccount
	
	(anAccount canBeIncludedIn: self) ifTrue:[
		
		anAccount hasBeenRegisteredInPortfolio: self.
		registeredAccounts add: anAccount.
		].
	! !


!Portfolio methodsFor: 'process' stamp: 'LEI 12/3/2021 21:59:22'!
visitedByReport: aReport
	aReport processPortfolio: self.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'FLM 11/28/2021 16:51:02'!
cannotRegisterAPortfolioIfItContainsAnExistingAccountInParentPorfolioErrorMessage
	^ 'Cannot register a portfolio if it contains an existing account in parent porfolio!!'.! !

!Portfolio class methodsFor: 'error messages' stamp: 'FLM 11/28/2021 15:09:46'!
cannotRegisterDuplicateAccountsErrorMessage
	^ 'Cannot register this account!! It already exists in this portfolio!!'.! !

!Portfolio class methodsFor: 'error messages' stamp: 'FLM 11/29/2021 18:34:49'!
cannotRegisterDuplicatePortfoliosErrorMessage
	^'Cannot register duplicated portfolios!!'.! !

!Portfolio class methodsFor: 'error messages' stamp: 'FLM 11/28/2021 15:53:21'!
portfolioCannotRegisterItselfErrorMessage
	^ 'A portfolio cannot register itself'.! !


!Portfolio class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 15:14:48'!
named: accountName
	^self new initializeWithName: accountName.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 15:16:09'!
named: accountName with: childAccount
	^self new initializeWithName: accountName with: childAccount .! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 15:17:39'!
named: accountName with: childAccount with: anotherChildAccount
	^self new initializeWithName: accountName with: childAccount with: anotherChildAccount .! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FLM 12/3/2021 15:19:25'!
initializeWithName: accountName
	transactions := OrderedCollection new.
	name := accountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LEI 11/30/2021 15:01:38'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue.		] ifEmpty: [ 0 * peso ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FLM 12/2/2021 21:21:41'!
forEachTransactionDo: aBlock
	transactions do:[:aTransaction| aBlock value: aTransaction ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FLM 12/3/2021 15:34:11'!
name
	^name.! !

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


!ReceptiveAccount methodsFor: 'receptive account' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !


!ReceptiveAccount methodsFor: 'process' stamp: 'LEI 12/3/2021 22:01:46'!
visitedByReport: aReport
	aReport processReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 15:24:04'!
named: accountName
	^self new initializeWithName: accountName.! !


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


!AccountTransaction methodsFor: 'for reports' stamp: 'FLM 12/3/2021 14:54:17'!
visitedByReport: aReport
	self subclassResponsibility.! !

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


!Deposit methodsFor: 'for reports' stamp: 'FLM 12/3/2021 14:55:02'!
visitedByReport: aReport
	aReport processDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferLeg methodsFor: 'transfer' stamp: 'FLM 12/3/2021 15:04:23'!
counterpart
	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio2'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferDeposit methodsFor: 'for reports' stamp: 'FLM 12/3/2021 14:55:25'!
visitedByReport: aReport
	aReport processTransferDeposit: self.! !


!TransferDeposit methodsFor: 'transfer' stamp: 'FLM 11/25/2021 20:32:27'!
counterpart
	^ transfer withdrawLeg .! !


!TransferDeposit methodsFor: 'value' stamp: 'FLM 11/23/2021 12:44:09'!
balanceValue
	^value.! !

!TransferDeposit methodsFor: 'value' stamp: 'LEI 11/30/2021 15:23:31'!
value

	^ value! !


!TransferDeposit methodsFor: 'initialization' stamp: 'FLM 11/25/2021 20:31:56'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

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
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferWithdraw methodsFor: 'for reports' stamp: 'FLM 12/3/2021 14:55:49'!
visitedByReport: aReport
	aReport processTransferWithdraw: self.! !


!TransferWithdraw methodsFor: 'transfer' stamp: 'FLM 11/25/2021 20:33:25'!
counterpart
	^ transfer depositLeg .! !


!TransferWithdraw methodsFor: 'value' stamp: 'FLM 11/23/2021 12:44:20'!
balanceValue
	^ value negated! !

!TransferWithdraw methodsFor: 'value' stamp: 'LEI 11/30/2021 15:23:38'!
value

	^ value! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'FLM 11/25/2021 20:33:13'!
initializeWithValue: aValue fromTransfer: aTransfer
	value := aValue.
	transfer := aTransfer.! !

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


!Withdraw methodsFor: 'for reports' stamp: 'FLM 12/3/2021 14:56:04'!
visitedByReport: aReport
	aReport processWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'ServiciosFinancieros-Ejercicio2'!
Object subclass: #Report
	instanceVariableNames: 'report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!Report methodsFor: 'processing accounts' stamp: 'LEI 12/5/2021 22:45:13'!
processPortfolio: aPortfolio
	self subclassResponsibility! !

!Report methodsFor: 'processing accounts' stamp: 'LEI 12/5/2021 22:45:45'!
processReceptiveAccount: aRepectiveAccount
	self subclassResponsibility! !


!Report methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:39:33'!
processDeposit: aDeposit
	^self subclassResponsibility.! !

!Report methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:40:15'!
processTransferDeposit: aTransferDeposit
	^self subclassResponsibility.! !

!Report methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:40:24'!
processTransferWithdraw: aTransferWithdraw
	^self subclassResponsibility.! !

!Report methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:39:46'!
processWithdraw: aWithdraw
	^self subclassResponsibility.! !


!Report methodsFor: 'text' stamp: 'LEI 12/5/2021 22:58:55'!
addTextLine: aText
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Ejercicio2'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'FLM 12/2/2021 21:05:23'!
of: anAccount
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Ejercicio2'!
Report subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!AccountSummary methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:49:22'!
processDeposit: aDeposit
	report add: ('Deposito por ', (aDeposit value) asString).
	! !

!AccountSummary methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:51:06'!
processTransferDeposit: aTransferDeposit
	report add: ('Entrada por transferencia de ', (aTransferDeposit value) asString).
	! !

!AccountSummary methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:51:31'!
processTransferWithdraw: aTransferWithdraw
	report add: ('Salida por transferencia de ', (aTransferWithdraw value) asString).
	! !

!AccountSummary methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:50:11'!
processWithdraw: aWithdraw
	report add: ('Extraccion por ', (aWithdraw value) asString).
	! !


!AccountSummary methodsFor: 'initialization' stamp: 'FLM 12/3/2021 14:56:49'!
initializeFor: anAccount
	
	report := OrderedCollection new.
	
	anAccount forEachTransactionDo: [:aTransaction| aTransaction visitedByReport: self].

	report add: ('Balance = ' , (anAccount balance) asString ).
	
	^report! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Ejercicio2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 14:46:30'!
of: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Ejercicio2'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'numberOfTabs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!PortfolioDetailedTreePrinter methodsFor: 'initialization' stamp: 'FLM 12/3/2021 17:41:26'!
initializeWith: aPortfolio
	report := OrderedCollection new.
	numberOfTabs := 0.
	self addAccountsDataFromPortfolio: aPortfolio.
	^report.! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'LEI 12/5/2021 22:54:49'!
addAccountsDataFromPortfolio: aPortfolio
	
	self addTextLine: aPortfolio name.
	self increaseIndentation .
	
	aPortfolio forEachDirectChildAccountDo: [:childAccount| childAccount visitedByReport: self	].
	
	
	self addTextLine: ('Balance = ',aPortfolio balance asString).
	self decreaseIndentation.! !


!PortfolioDetailedTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 22:50:47'!
addTextLine: aText
	
	report add: (self tabs,aText).! !

!PortfolioDetailedTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 22:53:44'!
decreaseIndentation
	numberOfTabs := numberOfTabs - 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 22:53:53'!
increaseIndentation
	numberOfTabs := numberOfTabs + 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'text' stamp: 'FLM 12/3/2021 17:34:19'!
tabs
	|tabs|
	tabs:=''.
	(1 to: numberOfTabs ) do:[:i| tabs := ('   ',tabs)].
	^tabs.! !


!PortfolioDetailedTreePrinter methodsFor: 'processing transactions' stamp: 'LEI 12/4/2021 01:36:18'!
processPortfolio: aPortfolio
	self addAccountsDataFromPortfolio: aPortfolio! !

!PortfolioDetailedTreePrinter methodsFor: 'processing transactions' stamp: 'LEI 12/5/2021 22:40:02'!
processReceptiveAccount: anAccount
	report add: (self tabs,anAccount name).
	numberOfTabs := numberOfTabs +1.
	
	
	(AccountSummary of: anAccount) do:[:aSummaryReport| report add: (self tabs,aSummaryReport)].
	numberOfTabs := numberOfTabs -1.
			
			
			.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Ejercicio2'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 17:26:17'!
of: aPortfolio
	^self new initializeWith: aPortfolio .! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Ejercicio2'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'numberOfTabs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'FLM 12/3/2021 16:50:09'!
initializeWith: aPortfolio
	report := OrderedCollection new.
	numberOfTabs  := 0.
	self addAccountsNameFromPortfolio: aPortfolio.
	^report.! !


!PortfolioTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 22:59:30'!
addTextLine: aText
	report add: (self tabs, aText).! !

!PortfolioTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 23:01:41'!
decreaseIndentation
	numberOfTabs := numberOfTabs - 1.! !

!PortfolioTreePrinter methodsFor: 'text' stamp: 'LEI 12/5/2021 23:01:23'!
increaseIndentation
	numberOfTabs := numberOfTabs + 1.! !

!PortfolioTreePrinter methodsFor: 'text' stamp: 'FLM 12/3/2021 16:38:33'!
tabs
	|tabs|
	tabs:=''.
	(1 to: numberOfTabs ) do:[:i| tabs := ('   ',tabs)].
	^tabs.! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'LEI 12/5/2021 23:02:43'!
addAccountsNameFromPortfolio: aPortfolio
	self addTextLine: (self tabs,aPortfolio name).
	self increaseIndentation .
	aPortfolio forEachDirectChildAccountDo: [:childAccount| childAccount visitedByReport: self.].
	self decreaseIndentation.! !


!PortfolioTreePrinter methodsFor: 'processing accounts' stamp: 'LEI 12/3/2021 21:58:58'!
processPortfolio: aPortfolio
	self addAccountsNameFromPortfolio: aPortfolio
	
	! !

!PortfolioTreePrinter methodsFor: 'processing accounts' stamp: 'LEI 12/3/2021 22:02:42'!
processReceptiveAccount: anAccount
	report add: (self tabs,anAccount name)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Ejercicio2'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 15:42:19'!
of: anAccount
	^self new initializeWith: anAccount.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Ejercicio2'!
Report subclass: #TransferNet
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio2'!

!TransferNet methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:59:20'!
processDeposit: aDeposit
	! !

!TransferNet methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 15:00:06'!
processTransferDeposit: aTransferDeposit
	net := net + aTransferDeposit balanceValue.
	! !

!TransferNet methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 15:00:22'!
processTransferWithdraw: aTransferWithdraw
	net := net + aTransferWithdraw balanceValue.
	! !

!TransferNet methodsFor: 'processing transactions' stamp: 'FLM 12/3/2021 14:59:28'!
processWithdraw: aWithdraw
	! !


!TransferNet methodsFor: 'initialization' stamp: 'FLM 12/3/2021 15:00:51'!
initializeFor: anAccount
	net := 0 * peso.
	anAccount forEachTransactionDo: [:aTransaction| aTransaction visitedByReport: self].
	^ report := OrderedCollection with: ('Neto de transferencias = ', net asString ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Ejercicio2'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'FLM 12/3/2021 14:58:08'!
of: anAccount
	^self new initializeFor: anAccount.! !


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
