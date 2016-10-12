#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

Global $oDictionary

Func _InitDictionary()
	Return ObjCreate("Scripting.Dictionary")
EndFunc   ;==>_InitDictionary

; Adds a key and item pair to a Dictionary object.
Func _AddItem($v_key, $v_item)
	$oDictionary.ADD($v_key, $v_item)
	If @error Then Return SetError(1, 1, -1)
EndFunc   ;==>_AddItem

; Returns true if a specified key exists in the Dictionary object, false if it does not.
Func _ItemExists($v_key)
	Return $oDictionary.Exists($v_key)
EndFunc   ;==>_ItemExists

; Returns an item for a specified key in a Dictionary object
Func _Item($v_key)
	Return $oDictionary.Item($v_key)
EndFunc   ;==>_Item

; Sets an item for a specified key in a Dictionary object
Func _ChangeItem($v_key, $v_item)
	$oDictionary.Item($v_key) = $v_item
EndFunc   ;==>_ChangeItem

; Sets a key in a Dictionary object.
Func _ChangeKey($v_key, $v_newKey)
	$oDictionary.Key($v_key) = $v_newKey
EndFunc   ;==>_ChangeKey

; Removes a key, item pair from a Dictionary object.
Func _ItemRemove($v_key)
	$oDictionary.Remove($v_key)
	If @error Then Return SetError(1, 1, -1)
EndFunc   ;==>_ItemRemove

; Returns the number of items in a collection or Dictionary object.
Func _ItemCount()
	Return $oDictionary.Count
EndFunc   ;==>_ItemCount

; Returns an array containing all the items in a Dictionary object
Func _GetItems()
	Return $oDictionary.Items
EndFunc   ;==>_GetItems

; This is my custom defined error handler
Func MyErrFunc()
	Local $err = $oMyError.number
	If $err = 0 Then $err = -1
	SetError($err) ; to check for after this function returns
EndFunc   ;==>MyErrFunc

