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
	Local oFont3    := TFONT():New("ARIAL",6,6,,.F.,,,,,.F.,.F.) ///Fonte 10 Normal
	local oFontnegrito9	:= TFont():New("ARIAL",8,8,,.T.,,,,.F.,.F.)
	
	Local oFont5negrito    := TFONT():New("ARIAL",7,7,,.T.,,,,.F.,.F.) ///Fonte 10 Normal
	local oFontnegrito	:= TFont():New("ARIAL",17,17,,.T.,,,,.F.,.F.)	 //negrito
    Local oFont10     := TFONT():New("ARIAL",15,15,,.F.,,,,,.F.,.F.) ///Fonte 10 Normal

    Local oPrinter   := Nil
	Local ii := 1


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


//OBSERVACAO
  	oPrinter:Line(178,01,178,593) 	// horizontal
	oPrinter:Say(188,03,"OBSERVAÇÃO:",oFont5)
	OBS := 195
	SPACE := 55
  	oPrinter:Line(196,SPACE,196,593) 	// horizontal
  	oPrinter:Line(206,SPACE,206,593) 	// horizontal
  	oPrinter:Line(216,SPACE,216,593) 	// horizontal
  //	oPrinter:Line(226,SPACE,226,593) 	// horizontal
	oPrinter:Line(230,01,230,593) 	// horizontal


	//INSUMOS
	menos := 17
	oPrinter:Say(240,03,"INSUMOS PREVISTOS:",oFont5negrito)

	nlinhas := 258 //variavel das linhas
	nlineprevistos := 273
//cabeçalho!
	oPrinter:Line(247,01,247,593) 	// horizontal linha de cima  da box.
	oPrinter:Say(nlineprevistos -18,03,"Tarefa",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,45,"Tipo",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,95,"Codigo",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,140,"Descrição",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,270,"Qtd",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,320,"Consumo",oFont5negrito)
	oPrinter:say(nlineprevistos -18,370,"Unidade",oFont5negrito)
	oPrinter:say(nlineprevistos -18,420,"Data inicio",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,470,"Hora inicio",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,520,"Data fim",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,560,"Hora fim",oFont5negrito)

	oPrinter:Line(257,01,257,593)  //linha de baixo

	//linha de items fixo em 16.
	
	ncolunas := 0
	ncol := 03
	repetir := 8
	nlargura := 31
	line1 := 1
	
for ii := 1 to repetir
ncolunas  := ncolunas+50
nlinhas:= nlinhas + 10
	oPrinter:Say(nlinhas,03,"1011",oFont5) 
	// TAREFA
	ctipo := 'Mao de obra'
	IF(Len(AllTrim(ctipo)) > 20)
	oPrinter:Say(nlinhas-1,32,ctipo,oFont3)  //usa font3
	else
	oPrinter:Say(nlinhas-1,32,ctipo,oFont5) 
	ENDIF

	codigo = '30700310023'
	IF(Len(AllTrim(codigo)) > 11)// CODIGO
	oPrinter:Say(nlinhas-1,94,"30700310023",oFont3) 
	ELSE
	oPrinter:Say(nlinhas-1,94,codigo,oFont5) // CODIGO
	ENDIF// itensens
	cDescr = 'OLEO LUBRIFI'
	IF(Len(AllTrim(cDescr)) > 24)
		oPrinter:Say(nlinhas-1,140,SUBSTR(cDescr, 1, 35),oFont3) // DESCRICAO usa font3
	ELSE
		oPrinter:Say(nlinhas-1,140,cDescr,oFont5) // DESCRICAO
	ENDIF
	oPrinter:Say(nlinhas-1,270,"0,25",oFont5) // QTD
	oPrinter:Say(nlinhas-1,320,"24,5",oFont5) // CONSUMO
	oPrinter:Say(nlinhas-1,370,"KG",oFont5) // UND
	oPrinter:Say(nlinhas-1,420,"Dt inicio",oFont5) // DTINICIO
	oPrinter:Say(nlinhas-1,470,"Horas inicio",oFont5) // HORA INICIIOO
	oPrinter:Say(nlinhas-1,520,"datas fim",oFont5) // DATA FIM	
	oPrinter:Say(nlinhas-1,560,"horas fim",oFont5) // HORA FIM
	//ncol = ncol + 50
	//@nlLin,350 PSAY __PrtThinLine()
	oPrinter:Line(nlinhas+1,01,nlinhas+1,593) 	// horizontal linha parte de baixo da box.
					   //03	//400 altura//3
	/* if ii == 1
	oPrinter:Line(nlinhas+3,03,263,03)//linha vertical da direita
	else */
	/* naltura := 0
	naltura := naltura + 263 */
	oPrinter:Line(nlinhas+1,29,247,29)//linha vertical da direita 1
	oPrinter:Line(nlinhas+1,90,247,90)//linha vertical da direita 2 codigo
	oPrinter:Line(nlinhas+1,138,247,138)//linha vertical da direita 3 descricao
	oPrinter:Line(nlinhas+1,262,247,262)//linha vertical da direita 4 qtd
	oPrinter:Line(nlinhas+1,318,247,318)//linha vertical da direita 5 consumo
	oPrinter:Line(nlinhas+1,368,247,368)//linha vertical da direita 6 und
	oPrinter:Line(nlinhas+1,418,247,418)//linha vertical da direita 7 dtinicio
	oPrinter:Line(nlinhas+1,468,247,468)//linha vertical da direita 8 hora inicio
	oPrinter:Line(nlinhas+1,518,247,518)//linha vertical da direita 9 dt fim
	oPrinter:Line(nlinhas+1,558,247,558)//linha vertical da direita 10 hora fim
next



//	oPrinter:Line(347,01,352,593) 	// horizontal
	oPrinter:Say(355,03,"TAREFA:",oFont5negrito)
//TAREFA DESCRICAO
	oPrinter:Line(359,01,359,593) 		// horizontal linha de cima  da box.
	oPrinter:Say(366,03,"Codigo",oFont5negrito)
	oPrinter:Say(366,45,"Descrição",oFont5negrito)
	oPrinter:Line(368,01,368,573) 		// horizontal linha de cima  da box.
	repetir2 := 8

nlinhas := 370
	for ii := 1 to repetir2
nlinhas:= nlinhas + 10
	oPrinter:Say(nlinhas-1,03,"1011",oFont5) // QTD
	oPrinter:Say(nlinhas-2,40,"BATEDOR ALIMENTADOR LA",oFont5) // CONSUMO
	oPrinter:Line(nlinhas,01,nlinhas,593) 	// horizontal linha parte de baixo da box.
	oPrinter:Line(nlinhas+1,29,359,29)//linha vertical da direita 1 
	NEXT
















	//oPrinter:Line(456,01,456,593) 	// horizontal
	oPrinter:Say(462,03,"TAREFA",oFont5negrito)
	oPrinter:Say(462,45,"ETAPA",oFont5negrito)
	oPrinter:Line(466,01,466,593) 
	oPrinter:Say(473,03,"CODIGO",oFont5negrito)
	oPrinter:Say(473,45,"codigo2",oFont5negrito)
	oPrinter:Say(473,90,"DESCRIÇÃO",oFont5negrito)
	oPrinter:Line(475,01,475,573) 		// horizontal linha de cima  da box.

	repetir3 := 8

nlinhas2 := 477
	for ii := 1 to repetir3
nlinhas2:= nlinhas2 + 10
	oPrinter:Say(nlinhas2,03,"1011",oFont5) // QTD
	oPrinter:Say(nlinhas2,40,"000001",oFont5) // CONSUMO
	oPrinter:Say(nlinhas2,85,"LUZ SOLAR 100 GRAUS",oFont5) // 
	oPrinter:Line(nlinhas2,01,nlinhas2,593) 	// horizontal linha parte de baixo da box.
	oPrinter:Line(nlinhas2+1,35,466,35)//linha vertical da direita 1 
	oPrinter:Line(nlinhas2+1,80,466,80)//linha vertical da direita 1 
	NEXT






//ocorrencias
	oPrinter:Line(567,01,567,593) 
	oPrinter:Say(577,03,"OCORRENCIAS:",oFont5)
	SPACE := 55
  	oPrinter:Line(587,SPACE,587,593) 	// horizontal
  	oPrinter:Line(597,SPACE,597,593) 	// horizontal
  	oPrinter:Line(607,SPACE,607,593) 	// horizontal
	oPrinter:Line(617,SPACE,617,593) 	
  //	oPrinter:Line(226,SPACE,226,593) 	// horizontal
	oPrinter:Line(633,01,633,593) 	// horizontal








// + 20

oPrinter:Say(653,03,"INSUMOS REPORTADOS:",oFont5negrito)

	nlinhas5 := 671 // + 18
	nlineprevistos := 686 // +33
//cabeçalho!	// + 7
	oPrinter:Line(660,01,660,593)  //linha de baixo

	oPrinter:Say(nlineprevistos -18,03,"Tarefa",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,45,"Tipo",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,95,"Codigo",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,140,"Descrição",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,270,"Qtd",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,320,"Consumo",oFont5negrito)
	oPrinter:say(nlineprevistos -18,370,"Unidade",oFont5negrito)
	oPrinter:say(nlineprevistos -18,420,"Data inicio",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,470,"Hora inicio",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,520,"Data fim",oFont5negrito)
	oPrinter:Say(nlineprevistos -18,560,"Hora fim",oFont5negrito)
		oPrinter:Line(670,01,670,593)  //linha de baixo
				//+ 17   //+ 17

	//linha de items fixo em 16.
	
	ncolunas := 0
	ncol := 03
	repetir := 8
	nlargura := 31
	line1 := 1
	
for ii := 1 to repetir
ncolunas  := ncolunas+50
nlinhas5:= nlinhas5 + 10
	oPrinter:Say(nlinhas5,03,"1011",oFont5) 
	// TAREFA
	ctipo := 'Mao de obra'
	IF(Len(AllTrim(ctipo)) > 20)
	oPrinter:Say(nlinhas5-1,32,ctipo,oFont3)  //usa font3
	else
	oPrinter:Say(nlinhas5-1,32,ctipo,oFont5) 
	ENDIF

	codigo = '30700310023'
	IF(Len(AllTrim(codigo)) > 11)// CODIGO
	oPrinter:Say(nlinhas5-1,94,"30700310023",oFont3) 
	ELSE
	oPrinter:Say(nlinhas5-1,94,codigo,oFont5) // CODIGO
	ENDIF// itensens
	cDescr = 'OLEO LUBRIFI'
	IF(Len(AllTrim(cDescr)) > 24)
		oPrinter:Say(nlinhas5-1,140,SUBSTR(cDescr, 1, 35),oFont3) // DESCRICAO usa font3
	ELSE
		oPrinter:Say(nlinhas5-1,140,cDescr,oFont5) // DESCRICAO
	ENDIF
	oPrinter:Say(nlinhas5-1,270,"0,25",oFont5) // QTD
	oPrinter:Say(nlinhas5-1,320,"24,5",oFont5) // CONSUMO
	oPrinter:Say(nlinhas5-1,370,"KG",oFont5) // UND
	oPrinter:Say(nlinhas5-1,420,"Dt inicio",oFont5) // DTINICIO
	oPrinter:Say(nlinhas5-1,470,"Horas inicio",oFont5) // HORA INICIIOO
	oPrinter:Say(nlinhas5-1,520,"datas fim",oFont5) // DATA FIM	
	oPrinter:Say(nlinhas5-1,560,"horas fim",oFont5) // HORA FIM
	//ncol = ncol + 50
	//@nlLin,350 PSAY __PrtThinLine()
	oPrinter:Line(nlinhas5+1,01,nlinhas5+1,593) 	// horizontal linha parte de baixo da box.
					   //03	//400 altura//3
	/* if ii == 1
	oPrinter:Line(nlinhas5+3,03,263,03)//linha vertical da direita
	else */
	/* naltura := 0
	naltura := naltura + 263 */
	oPrinter:Line(nlinhas5+1,29,660,29)//linha vertical da direita 1
	oPrinter:Line(nlinhas5+1,90,660,90)//linha vertical da direita 2 codigo
	oPrinter:Line(nlinhas5+1,138,660,138)//linha vertical da direita 3 descricao
	oPrinter:Line(nlinhas5+1,262,660,262)//linha vertical da direita 4 qtd
	oPrinter:Line(nlinhas5+1,318,660,318)//linha vertical da direita 5 consumo
	oPrinter:Line(nlinhas5+1,368,660,368)//linha vertical da direita 6 und
	oPrinter:Line(nlinhas5+1,418,660,418)//linha vertical da direita 7 dtinicio
	oPrinter:Line(nlinhas5+1,468,660,468)//linha vertical da direita 8 hora inicio
	oPrinter:Line(nlinhas5+1,518,660,518)//linha vertical da direita 9 dt fim
	oPrinter:Line(nlinhas5+1,558,660,558)//linha vertical da direita 10 hora fim
next










    oPrinter:EndPage()

    oPrinter:Preview()

Return 
