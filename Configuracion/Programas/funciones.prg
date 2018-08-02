*!* *******************************************************************************
*-- NOMBRE	: CadenaAleatoria
*-- AUTOR	: RAFAEL GUTIERREZ C.
*-- FECHA	: DICIEMBRE 27 DE 2014
*-- DESCRIP	: Genera una cadena con caracteres aleatorios
*-- PARAMETROS	: lcPrefijo: Prefijo para el armado
*-- RETORNA	: String: Cadena aleatoria
*!* *******************************************************************************
FUNCTION CadenaAleatoria(lcPrefijo AS STRING) AS STRING 
LOCAL llsw as Logical, lcTempRandom AS STRING
STORE SPACE(0) TO lcTempRandom

IF VARTYPE(lcPrefijo)<>"C" THEN
	*!* NO APLICA PREFIJO
	lcPrefijo = "NA"
ENDIF 

STORE .T. TO llsw
STORE ALLTRIM(lcPrefijo) TO lcTempPrefijo

DO WHILE llsw
	lcTempRandom=lcPrefijo+SYS(2015)+ALLTRIM(STR(CEIL(RAND()*1000)))
	IF USED(lcTempRandom) THEN
		LOOP
 	ELSE
 		STORE .F. TO llsw
	ENDIF
ENDDO

RETURN lcTempRandom

ENDFUNC
*!* *******************************************************************************


******************************************************************
*-- Funcion.......: Elemento
*-- Descripcion...: devuelve un item de una cadena que contiene varios 
*-- datos separados por un caracter y referenciado por una posicion
*-- Parametros....: tcCadenaEjecucion as String: requerido: Cadena de texto
*-- con los datos ej. "UNO,DOS,TRES,CUATRO"
*-- tcSeparador as Character: requerido: Texto separador ej ","
*-- tnNumero as Integer: requerido: Posicion del elemento requerido ej: 3
*-- Devuelve......: string: Elemento extraido "" si no lo encuentra
*-- Fecha.........: 14-May-2010
*-- Autor.........: Salomon S. Cadena
*--***************************************************************
*-- Resumen de Modificaciones
******************************************************************

FUNCTION Elemento
LPARAMETERS tcCadenaEjecucion as String, tcSeparador as Character ,tnNumero as Integer
	LOCAL lnOcurrencias
	lnOcurrencias=OCCURS(tcSeparador,tcCadenaEjecucion)
	IF tnNumero=0 OR (tnNumero-1)>lnOcurrencias then
		RETURN ''
	ENDIF 
	IF tnNumero=1 then
		IF lnOcurrencias<tnNumero
			RETURN tcCadenaEjecucion
		ELSE 	
			RETURN LEFT(tcCadenaEjecucion,AT(tcSeparador,tcCadenaEjecucion)-1)
		ENDIF
	ELSE
		IF lnOcurrencias<tnNumero
			RETURN SUBSTR(tcCadenaEjecucion,AT(tcSeparador;
				,tcCadenaEjecucion,tnNumero-1)+1)
		ELSE 	
			RETURN SUBSTR(tcCadenaEjecucion,AT(tcSeparador;
			, tcCadenaEjecucion,tnNumero-1)+1,AT(tcSeparador;
			, tcCadenaEjecucion,tnNumero)-AT(tcSeparador,tcCadenaEjecucion,tnNumero-1)-1)
		ENDIF
	ENDIF
ENDFUNC 
