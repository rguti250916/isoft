*!* CONGIGURACION SETS DEL SISTEMA
SET DEFAULT TO (SYS(5) + SYS(2003))
SET ESCAPE OFF
SET MULTILOCKS OFF
SET ENGINEBEHAVIOR 70
SET SAFETY OFF

*SET SYSMENU OFF
SET MEMOWIDTH TO 255
SET HEADINGS OFF

*!* ESPECIFICA SI LA CONFIGURACIÓN DEL SISTEMA DE VISUAL FOXPRO SE ACTUALIZA CON LA CONFIGURACIÓN DEL SISTEMA ACTUAL DE WINDOWS.
SET SYSFORMATS OFF
*!*

SET SEPARATOR TO ','
SET POINT TO '.'
SET CONSOLE OFF
SET CURRENCY LEFT

*!* NO VISUALIZAR EL NOMBRE DE LA TABLA O CURSOR CON SU RUTA
SET CPDIALOG OFF 
*!* 

SET CONFIRM ON
SET NOTIFY OFF
SET REFRESH TO 0.5
SET AUTOSAVE ON

*!* FIJAR LA PRESENTACIÓN DE DECIMALES
SET FIXED ON 
*!*

SET DECIMALS TO 5
SET ESCAPE OFF
SET SAFETY OFF
SET BELL OFF
SET DELETE ON
SET CENTURY ON
SET CENTURY TO 19 ROLLOVER 80
SET REPROCESS TO -1
SET MULTILOCKS ON
SET MARK TO [-]
SET DATE TO DMY
SET ECHO OFF
SET TALK OFF
SET SCOR OFF
SET STAT OFF
SET DELI OFF
SET STATUS BAR OFF
SET SYSMENU TO
SET EXAC ON
SET SYSM TO
SET FULLPATH ON 
SQLSETPROP(0,"DISPLOGIN",3)

*-- OBJETOS PUBLICOS DE LA APLICACION
PUBLIC objAplicacion AS OBJECT, objMyConexion AS OBJECT, objTema AS OBJECT

*IF _VFP.StartMode = 0 THEN
	SET PATH TO CLASES, IMAGENES, CONFIGURACION, CONFIGURACION\FORMAS, CONFIGURACION\INFORMES, CONFIGURACION\PROGRAMAS, ACTIVOS, ACTIVOS\FORMAS, ACTIVOS\INFORMES, ACTIVOS\PROGRAMAS, CONTABILIDAD, CONTABILIDAD\FORMAS, ;
			CONTABILIDAD\INFORMES, CONTABILIDAD\PROGRAMAS
*ENDIF

SET CLASSLIB TO claseskbs, clclock, clgeneral, clmariadb, clplantilla, clroles, cltercero, contabilidad, myribbon, vfpscrollbar, ;
				cldiseno  ADDITIVE
				
SET PROCEDURE TO funciones ADDITIVE


*!* ****************************************************************************************
*!* CONFIGURACION DEL OBJETO APLICACION
*!* ****************************************************************************************
STORE CREATEOBJECT("custom") TO objAplicacion
objAplicacion.ADDPROPERTY("nombreEmpresa",'')
objAplicacion.ADDPROPERTY("nombreEmpresalargo",SPACE(254))
objAplicacion.ADDPROPERTY("nitEmpresa",'')
objAplicacion.ADDPROPERTY("dirEmpresa",'')
objAplicacion.ADDPROPERTY("telEmpresa",'')
objAplicacion.ADDPROPERTY("tipoEmpresa",'')
objAplicacion.ADDPROPERTY("CodSucursal",'')
objAplicacion.ADDPROPERTY("NomSucursal",'')
objAplicacion.ADDPROPERTY("usuario",'')
objAplicacion.ADDPROPERTY("codUsuario",'')
objAplicacion.ADDPROPERTY("Principal",0)
objAplicacion.ADDPROPERTY("FechaServer",'')
objAplicacion.ADDPROPERTY("Meses(12,2)",'')
objAplicacion.ADDPROPERTY("basedatos",SPACE(0))
objAplicacion.ADDPROPERTY("ip",SPACE(0))
objAplicacion.ADDPROPERTY("TimeMsg",5000)
objAplicacion.ADDPROPERTY("curPermisos",CadenaAleatoria('OSU'))
objAplicacion.ADDPROPERTY("LogoEmpresa",SPACE(0))

objAplicacion.ADDPROPERTY("tabla1",'')
objAplicacion.ADDPROPERTY("titulo",'')
objAplicacion.ADDPROPERTY("padl",0)
objAplicacion.ADDPROPERTY("lencampo1",0)
objAplicacion.ADDPROPERTY("lencampo2",0)
objAplicacion.ADDPROPERTY("campo1",'')
objAplicacion.ADDPROPERTY("campo2",'')
objAplicacion.ADDPROPERTY("sqlcadena",'')
objAplicacion.ADDPROPERTY("orden",'')
objAplicacion.ADDPROPERTY("grupo",'')
objAplicacion.ADDPROPERTY("vlibre",0)
objAplicacion.ADDPROPERTY("lengthquery",500)
objAplicacion.ADDPROPERTY("rsgeneral",'')
objAplicacion.ADDPROPERTY("rutaFotos",'')
objAplicacion.ADDPROPERTY("RutaExporta",'')
objAplicacion.ADDPROPERTY("codCajero",'')
objAplicacion.ADDPROPERTY("TiempoMsg",5000) && Tiempo en que se muestra un mensajebox, para no bloquear transacciones.
objAplicacion.ADDPROPERTY("ExprCampo1",'')
objAplicacion.ADDPROPERTY("ExprCampo2",'')
*!* ****************************************************************************************

*!* ****************************************************************************************
*!* CREACION DEL OBJETO TEMA
*!* ****************************************************************************************
STORE CREATEOBJECT("clTema") TO objTema
*!* ****************************************************************************************

*!* ****************************************************************************************
*!* CONFIGURACION DEL OBJETO CONEXION
*!* ****************************************************************************************
STORE NEWOBJECT('mrdb','clmariadb') TO objMyConexion
IF VARTYPE(objMyConexion) <> 'O' THEN
	RETURN .F.
ENDIF
*!* ****************************************************************************************

*STORE .F. TO _SCREEN.VISIBLE

STORE "iSoft.ico" TO _SCREEN.ICON
DO FORM cfgprologin
READ EVENTS