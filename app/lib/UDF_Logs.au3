#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

#include <File.au3>
#include <FileConstants.au3>

Global $sPath = @ScriptDir & "\app\logs\app"&@MDAY&@MON&@YEAR&".log"
Global $hFile

Func _Log_Write($sText)
	$hFile = FileOpen($sPath, $FO_APPEND)
	_FileWriteLog($hFile, $sText)
	FileClose($hFile)
EndFunc
