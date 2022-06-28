#INCLUDE "rwmake.ch"     
#INCLUDE "RPTDEF.CH"   
#define TRUE    .T.
#define FALSE   .F.

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³IMPCT1ºAutor  TIAGO         º Data ³  15/03/2022      º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³  IMPORTA CT1 CLIENTES FORN                  º±±
±±º          ³                                                            º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß

*/
//SG_IMPCT1
//SG_IMPCVD

User Function SG_COD()

    Local cRelName   := "TSTMSPRINT"
    Local lAdjust    := .F.

    Local nPrintType := 6
    Local oFont5    := TFONT():New("ARIAL",7,7,,.F.,,,,,.F.,.F.) ///Fonte 10 Normal
	local oFontnegrito	:= TFont():New("ARIAL",17,17,,.T.,,,,.F.,.F.)	 //negrito
    Local oFont10     := TFONT():New("ARIAL",15,15,,.F.,,,,,.F.,.F.) ///Fonte 10 Normal

    Local oPrinter   := Nil


    oPrinter := FWMSPrinter():New(cRelName, nPrintType, lAdjust, /*cPathDest*/, .T., /*lTReport*/ ,/* oPrintSetup */,/*cPrinter*/, .t. )
    oPrinter:SetPortrait()
    oPrinter:SetPaperSize(DMPAPER_A4)
    oPrinter:setCopies(1)

    nCenterPg := Round(oPrinter:nHorzSize() / 2 ,0)

    oPrinter:StartPage() // Inicia uma nova pagina

    nLin := 25
	oPrinter:Box(1,1,840,594)  //LINHA/COLUNA/ALTURA/LARGURA
	oPrinter:Say(nLin,120,"ORDEM DE SERVIÇO DE MANUTENÇÃO",oFontnegrito)
	oPrinter:Say(8,520,"TJ_ORDEM", oFont5)
	oPrinter:Say( nlin,430,"N: 052993",oFontnegrito)
	oPrinter:Say( nlin,520,"Pagina: 1",oFont5)
	oPrinter:Say(60,70,"TJ_CODBEM + TJ_NOMBEM",oFont5)
	oPrinter:Say(60,390,"TJ_CCUSTO + TJ_NOMCUSTO",oFont5)
	oPrinter:Line(70,01,70,593)   		// horizontal
//linha 2
nlin2 := 79
	oPrinter:Say(nlin2,03,"BEM:",oFont5)
	oPrinter:Say(nlin2,50,"LA 01-LAMINADOR01",oFont5)
	oPrinter:Say(nlin2,220,"CRITICIDADE: A",oFont5)
	oPrinter:Say(nlin2,400,"C.CUSTO: ",oFont5)
	oPrinter:Say(nlin2,490,"2503-PREPARAÇÃO: ",oFont5)
	nlin3 := 102
	oPrinter:Say(nlin3,400,"Parada antes: ",oFont5)
	oPrinter:Say(nlin3,490,"_HORAS/DIAS: ",oFont5)
	oPrinter:Say(nlin3,03,"Data início: ",oFont5)
	oPrinter:Say(nlin3,50,"24/04/2022",oFont5)
    oPrinter:Say(nlin3,90,Time(),oFont5)
	oPrinter:Line(105,01,105,593)   	// horizontal



	oPrinter:Line(120,01,120,593) 	// horizontal
	nline4 := 130
	nline5 := 140
	nline6 := 150
    nline7 := 160
	oPrinter:Say(nline4,03,"TIPO:",oFont5)
	oPrinter:Say(nline4,50,"02-manutencao preventina:",oFont5)
	oPrinter:Say(nline4,220,"EMISSÃO:",oFont5)
	oPrinter:Say(nline4,270,Time(),oFont5)

	oPrinter:Say(nline5,03,"Serviço:",oFont5)
	oPrinter:Say(nline5,50,"Lubrificacao:",oFont5)
	oPrinter:Say(nline5,220,"Area:",oFont5)
	oPrinter:Say(nline5,250,"05- Lubrificacao:",oFont5)

	oPrinter:Say(nline6,03,"NOME MANUTENCAO:",oFont5)
	oPrinter:Say(nline6,90,"PL_01M_LA01",oFont5)
	oPrinter:Say(nline6,220,"SEQUENCIA:",oFont5)
    oPrinter:Say(nline6,250,"1",oFont5)

    oPrinter:Say(nline7,03,"Plano de manutençao",oFont5)
	oPrinter:Say(nline7,90,"00012",oFont5)
	oPrinter:Say(nline7,220,"DESCRICAO:",oFont5)
    oPrinter:Say(nline7,290,"PLANO E LUBRIFICAÇÃO MENSAL PARA O LAMINADOR",oFont5)
    oPrinter:Line(165,01,165,593) 	// horizontal



  	oPrinter:Line(185,01,185,593) 	// horizontal
	oPrinter:Say(195,03,"OBSERVAÇÃO:",oFont5)
	OBS := 195
	SPACE := 50
	oPrinter:Line(OBS,SPACE,OBS,593) 	// horizontal
  	oPrinter:Line(205,SPACE,205,593) 	// horizontal
  	oPrinter:Line(215,SPACE,215,593) 	// horizontal
  	oPrinter:Line(225,SPACE,225,593) 	// horizontal
  	oPrinter:Line(235,SPACE,235,593) 	// horizontal
	oPrinter:Line(255,01,255,593) 	// horizontal

	nlineprevistos := 275
	oPrinter:Say(nlineprevistos,03,"Insumos previstos:",oFont5)
	oPrinter:Say(nlineprevistos,03,"Tarefa:",oFont5)
	oPrinter:Say(nlineprevistos,03,"Tipo:",oFont5)
	oPrinter:Say(nlineprevistos,03,"Codigo:",oFont5)
/* //for ii := 1 to 16
		    if ii > 1 .and. !(ii == 16 )
               ccolret := ccolret + "AllTrim(aRetorno[oBrowse:nAt,"+strzero(ii,2)+"]),"
			endif   
			if ii == 16 //o 16 esta chumbado temos que achao o numero
			   ccolret := ccolret + "AllTrim(aRetorno[oBrowse:nAt,"+strzero(ii,2)+"])}"
			endif
		next */



    oPrinter:EndPage()

    oPrinter:Preview()

Return 


Static Function OkLeTxt

aDados   := {}

If !File(cDirArq)
	Alert('Arquivo não encontrado!!!')
	Return
Endif

FT_FUSE(cDirArq) //arquivo
FT_FGOTOP()
nCountLn	:=	FT_FLASTREC() 
ProcRegua(nCountLn)
FT_FGOTOP()



Processa({|| RunCont() },"Processando...")
Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÝÝÝÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝËÝÝÝÝÝÝÑÝÝÝÝÝÝÝÝÝÝÝÝÝ»±±
±±ºPrograma  ³RECETXT1  ºAutor  ³Microsiga           º Data ³  21/10/2019 º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÊÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºDesc.     ³                                                            º±±
±±º          ³                                                            º±±
±±ÌÝÝÝÝÝÝÝÝÝÝØÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¹±±
±±ºUso       ³ AP                                                        º±±
±±ÈÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝÝ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

Static Function RunCont

Local nTamFile, nTamLin,  nBtLidos




FT_FSKIP()     //como a primeira linha [e CABECALHO O SISTEMA PULA A PRIMEIRA

ncount := 0
Do While !FT_FEOF()
   

	cLinha	:=	FT_FREADLN()

	IncProc()
   //	dbSelectArea(cString)
   //	dbSelectArea("SE5")
   //	dbSetOrder(1)        Fazer uma querie comparando tosos os campos para alertar de registro ja existente, pois nao existe um numero de documento para validar
	
	//DATA MOV.;NUMERÝRIO; VALOR MOVIMENTO ;NATUREZA; BANCO ;AGENCIA;CONTA;BENEFICIARIO;HISTÓRICO;C.CUSTO DÉBITO
	//E5_DATA     E5_MOEDA     E5_VALOR     E5_NATUREZ     E5_BANCO     E5_AGENCIA     E5_CONTA     E5_BENEF     E5_HISTOR     E5_CCD     

	cfilial		:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cconta	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cdesc  	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cclasse  	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cnormal      :=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cres	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	cbloq  	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ccusto	:=	SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
    cvd02  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvd03  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvd04  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvd05  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvc02  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvc03  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvc04  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    cvc05  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	CTASUP  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    acitem  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    accust  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
	acclvl  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    DTEXIS  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
	AGLSLD  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    CCOBRG  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    ITOBRG  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    CLOBRG  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    LALHIR  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    LALUR  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    NATCTA  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
    ACATIV  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha)) 
	ATOBRG  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACT05  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	 OBRG :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	SPEDST  :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	NTSPED :=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACAT01	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	AT01OB	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACAT02	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ATO2OB	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACATO3	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	AT03OB	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACAT04	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	ACAT04	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	AT04OB	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	INTP	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))
	PVARC	:=  SubStr(cLinha,1 ,AT(';', cLinha)-1); cLinha := SubStr(cLinha, AT(';',cLinha)+1, Len(cLinha))

		   NCOUNT++


	       dbSelectArea("CT1")  
		   DbSetOrder(1)
		   DBSEEK(XFILIAL("CT1")+CCONTA,.F.)
		   IF FOUND()
	            RecLock("CT1",.F.)
		   ELSE
		       RecLock("CT1",.T.)

		   ENDIF		

	       CT1->CT1_FILIAL   := cfilial
	       CT1->CT1_CONTA  := cconta	
		   CT1->CT1_DESC01 := cdesc
		   CT1->CT1_CLASSE  := cclasse	 
		   CT1->CT1_NORMAL  := cnormal
   	   
		   CT1->CT1_RES   := cres	   		   
		   CT1->CT1_BLOQ   :=  cbloq //  "P"		   
		   CT1->CT1_NCUSTO   := VAL(ccusto)/100		   	   		   
		   CT1->CT1_CVD02    := cvd02 
		   CT1->CT1_CVD03    := cvd03          
		   CT1->CT1_CVD04  := cvd04 
		   CT1->CT1_CVD05 	:= cvd05
           CT1->CT1_CVC02	:= cvc02
           CT1->CT1_CVC03  := cvc03
		   CT1->CT1_CVC04    := cvc04
		   CT1->CT1_CVC05    := cvc05 
		   CT1->CT1_CTASUP   := CTASUP            
		   CT1->CT1_ACITEM      := acitem
		   CT1->CT1_ACCUST := accust      
		   CT1->CT1_ACCLVL      := acclvl
		   CT1->CT1_DTEXIS      := CTOD(DTEXIS)  
		   CT1->CT1_AGLSLD      := AGLSLD  		   
		   CT1->CT1_CCOBRG      := CCOBRG 
		   CT1->CT1_ITOBRG      := ITOBRG  
		   CT1->CT1_CLOBRG      := CLOBRG  
		   CT1->CT1_LALHIR      := LALHIR  
    	   CT1->CT1_LALUR      := LALUR  
		   CT1->CT1_NATCTA      := NATCTA
		   CT1->CT1_ACATIV      := ACATIV   
		   CT1->CT1_ATOBRG      := ATOBRG   
		   CT1->CT1_ACET05      := ACT05
		   CT1->CT1_05OBRG      := OBRG
		   CT1->CT1_SPEDST      := SPEDST
		   CT1->CT1_NTSPED      := NTSPED
		   CT1->CT1_ACAT01      := ACAT01
	       CT1->CT1_AT01OB      := AT01OB
		   CT1->CT1_ACAT02    := ACAT02
		   CT1->CT1_AT02OB    := ATO2OB
		   CT1->CT1_ACAT03    := ACATO3
		   CT1->CT1_AT03OB    := AT03OB
		   CT1->CT1_ACAT04    := ACAT04
		   CT1->CT1_AT04OB    := AT04OB
		   CT1->CT1_INTP    := INTP
		   CT1->CT1_PVARC    := PVARC


		   
		   
		   
		   		   
		   MSUnLock()
		   
	    
       
	//nBtLidos := fRead(nHdl,@cBuffer,nTamLin) // Leitura da proxima linha do arquivo texto    
  	FT_FSKIP()

	IncProc()	
EndDo

fClose(cDirArq)
//Close(oLeTxt)    

msgstop(" Arquivo importado !!" +strzero(NCOUNT))

Return
