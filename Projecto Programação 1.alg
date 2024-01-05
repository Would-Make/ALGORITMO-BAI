registo Pessoa
	inteiro codigo
	literal nome, nifOuBi,telefone
fimregisto
	
registo Conta
	inteiro numConta, codigoCliente
	real saldo
	logico estado <- verdadeiro
	inteiro tipoConta
fimregisto

//VARIAVEIS GOLBAIS
fficheiro file
literal dirCliente <- "/home/shy_/Documentos/PROJECTO PROGRAMAÇÃO 1/ClienteDB.txt"
literal dirConta <- "/home/shy_/Documentos/PROJECTO PROGRAMAÇÃO 1/ContaDB.txt"
literal dados
logico ficheiroexiste
inteiro contLinha
constante inteiro TAMANHO <-1000

funcao inteiro contaLinhas(fficheiro arquivo, literal diretorio)
	inteiro cont<-0
	fAbrir(arquivo, diretorio, FALSO)
	enquanto ftemlinha(arquivo) faca
		fLerLinha(arquivo)
		cont<- cont + 1
	fimenquanto
	fFechar(arquivo)
	retorne cont
fimfuncao

inteiro nLinhasP<-contaLinhas(file, dirCliente)
inteiro nLinhasC<-contaLinhas(file, dirConta)
Pessoa cliente[TAMANHO + nLinhasP]
Conta clienteConta[TAMANHO + nLinhasC]
//TERMINA

 procedimento iniciar()
   	mostre "\t\t===================== BAI - BANCO ANGOLANO DE INVESTIMENTO ========================\n\n"
	mostre "1 - CADASTRAR CLIENTE \t 2 - LISTAR CLIENTES\t 3 - ABERTURA DE CONTA\t 4 - DEPOSITAR DINHEIRO \t 5 - LEVANTAR DINHEIRO \n\n"
	mostre "6 - CONSULTAR SALDO \t 7 - TRANSFERIR DINHEIRO \t 8 - ACTUALIZAR DADOS DO CLIENTE \t 9 - LISTAR CONTAS \t 0 - ENCERRAR\n"
 fimprocedimento 


funcao logico cadastroCliente(Pessoa p)
	p.codigo<- nLinhasP
	cliente[nLinhasP].codigo<- p.codigo
	cliente[nLinhasP].nome<- p.nome
	cliente[nLinhasP].nifOuBi<- p.nifOuBi
	cliente[nLinhasP].telefone<- p.telefone
	nLinhasP<- nLinhasP + 1
	retorne verdadeiro
fimfuncao

procedimento escreverFicheiro(fficheiro f, literal diretorio, literal dados)
ficheiroexiste<- fexiste(diretorio)
	se nao ficheiroexiste entao
		se nao fcriar(diretorio) entao
		mostre "Não foi possível criar o arquivo"
		fimse
	fimse
	fAbrir(f, diretorio, FALSO)
    fescrever( f , dados)
    fNovaLinha(f)
    fFechar(f)
fimprocedimento

 funcao logico aberturaDeConta(Conta C)
 	C.numConta<-nLinhasC
 	clienteConta[nLinhasC].numConta<-C.numConta
 	clienteConta[nLinhasC].codigoCliente<-C.codigoCliente
 	clienteConta[nLinhasC].saldo<-C.saldo
 	clienteConta[nLinhasC].estado<-C.estado
 	clienteConta[nLinhasC].tipoConta<-C.tipoConta
 	nLinhasC<- nLinhasC + 1
 	retorne verdadeiro
 fimfuncao
 
 
 funcao  logico depositarDinheiro(inteiro numeroDaconta, real valor)
 	retorne verdadeiro
 	
 fimfuncao 

 funcao logico levantarDinheiro(inteiro numeroDaconta, real valor)
 	retorne verdadeiro
 
 fimfuncao

  funcao real consultarSaldo (inteiro numeroDaconta)
  	retorne 0
  	
  fimfuncao

   funcao logico transferirDinheiro(inteiro numeroDacontaEnviar, inteiro numeroDacontaReceber, real valor)
   	retorne verdadeiro
   	
   fimfuncao 
   funcao logico actualizarDados(Pessoa p,inteiro codigoCliente)
   	
   	retorne verdadeiro
   	
   fimfuncao 

   procedimento listar(fficheiro f, literal c)
    fAbrir(f, c, FALSO)
	mostre fLerTudo(f)
	fFechar(f)
		inteiro perg
		mostre "\n 1- Voltar ao menu ou 2- Encerrar : "
		leia(perg)
		se perg=1 entao 
			limpatela
			iniciar()
		senao 
			limpatela
			fimalgoritmo
		fimse
   fimprocedimento 

inicio
    inteiro opcao
	iniciar()

faca
	mostre "DIGITE A OPCAO: "
	leia opcao
	limpatela
	escolha opcao
	caso 1:
		
			limpatela
			Pessoa a
			mostre "Nome do Cliente: "
			leia a.nome
			mostre "Numero BI/NIF: "
			leia a.nifOuBi
			mostre "Numero de Telefone: "
			leia a.telefone
			cadastroCliente(a)
			Dados <- "Código Cliente: "+ strintparastr(a.codigo)+ "/" +"Nome: "+ a.nome +"/"+"NIF/BI: "+ a.nIfOuBi+ "/" + "Telefone: "+a.telefone
			escreverFicheiro(file, dirCliente, Dados)
			mostre "Cadastro realizado com sucesso"
			iniciar()
	caso 2:
		limpatela
		mostre "**** \t\t\t ### LISTA DE CLIENTES ###\n\n"
		listar(file,dirCliente)
	caso 3:
		limpatela
		Conta a
		mostre "Código do Cliente: "
		leia a.codigoCliente
		mostre "Saldo Inicial: "
		leia a.saldo
		mostre "Tipo de Conta 0 - Particular; 1 - Empresa  : "
		leia a.tipoConta
		mostre "Estado da Conta  Verdadeiro(Activo); Falso(Inactivo) : "
		leia a.estado
		aberturaDeConta(a)
		se a.estado=verdadeiro e a.tipoConta=0 entao
			Dados <- "Número da Conta: "+ strintparastr(a.numConta) + "/" +"Código do Cliente: "+ strintparastr(a.codigoCliente) +"/"+"Saldo: "+ strrealparastr(a.Saldo)+ "/" + "Tipo de Conta: Particular" + "/"+ "Estado: Activa"
		senao
		se a.estado=verdadeiro e a.tipoConta=1 entao
				 Dados <- "Número da Conta: "+ strintparastr(a.numConta) + "/" +"Código do Cliente: "+ strintparastr(a.codigoCliente) +"/"+"Saldo: "+ strrealparastr(a.Saldo)+ "/" + "Tipo de Conta: Empresa" + "/"+ "Estado: Activa"
		fimse
		se a.estado=falso e a.tipoConta=0 entao
			Dados <- "Número da Conta: "+ strintparastr(a.numConta) + "/" +"Código do Cliente: "+ strintparastr(a.codigoCliente) +"/"+"Saldo: "+ strrealparastr(a.Saldo)+ "/" + "Tipo de Conta: Particular" + "/"+ "Estado: Inactiva"
		fimse
		se a.estado=falso e a.tipoConta=1 entao
			Dados <- "Número da Conta: "+ strintparastr(a.numConta) + "/" +"Código do Cliente: "+ strintparastr(a.codigoCliente) + "/"+"Saldo: "+ strrealparastr(a.Saldo)+ "/" + "Tipo de Conta: Empresa" + "/"+ "Estado: Inactiva"
		fimse
       fimse
		escreverFicheiro(file, dirConta, Dados)
		mostre "Abertura de Conta realizada com sucesso"
		listar(file, dirConta)
		iniciar()
	caso 4:
		limpatela
		mostre " voce escolheu 4"
	caso 5:
		limpatela
		mostre " voce escolheu 5"
	caso 6:
		limpatela
		mostre " voce escolheu 6"
	caso 7:
		limpatela
		mostre " voce escolheu 7"
	caso 8:
		limpatela
		mostre " voce escolheu 8"
	caso 9:
		limpatela
		mostre "**** \t\t\t ### LISTA DE CONTAS ###\n\n"
		listar(file, dirConta)
	defeito: 
	iniciar()
    fimescolha
	
enquanto (opcao<>0)
limpatela 
fimalgoritmo