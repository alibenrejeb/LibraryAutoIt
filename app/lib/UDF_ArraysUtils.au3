#cs ----------------------------------------------------------------------------

 Fonction du Script :
	Redimensionne et insère une donnée dans un tableau

#ce ----------------------------------------------------------------------------
Func _ArrayInsertAndRedim(ByRef $array, $value)
	$indexLastElement = UBound($array)
	ReDim $array[$indexLastElement+1]
	$array[$indexLastElement] = $value
EndFunc