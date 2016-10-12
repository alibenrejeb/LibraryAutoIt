#cs ----------------------------------------------------------------------------

	AutoIt Version : 3.3.14.2
	Auteur:         a.benrejeb

	Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

Func _InitDictionary()
	return ObjCreate("Scripting.Dictionary")
EndFunc   ;==>_InitDictionary

; Adds a key and item pair to a Dictionary object.
Func _AddItem($v_key, $v_item, $Obj)
	$Obj.ADD($v_key, $v_item)
	If @error Then Return SetError(1, 1, -1)
EndFunc   ;==>_AddItem

; Returns true if a specified key exists in the Dictionary object, false if it does not.
Func _ItemExists($v_key, $Obj)
	Return $Obj.Exists($v_key)
EndFunc   ;==>_ItemExists

; Returns an item for a specified key in a Dictionary object
Func _Item($v_key, $Obj)
	Return $Obj.Item($v_key)
EndFunc   ;==>_Item

; Sets an item for a specified key in a Dictionary object
Func _ChangeItem($v_key, $v_item, $Obj)
	$Obj.Item($v_key) = $v_item
EndFunc   ;==>_ChangeItem

; Sets a key in a Dictionary object.
Func _ChangeKey($v_key, $v_newKey, $Obj)
	$Obj.Key($v_key) = $v_newKey
EndFunc   ;==>_ChangeKey

; Removes a key, item pair from a Dictionary object.
Func _ItemRemove($v_key, $Obj)
	$Obj.Remove($v_key)
	If @error Then Return SetError(1, 1, -1)
EndFunc   ;==>_ItemRemove

; Returns the number of items in a collection or Dictionary object.
Func _ItemCount($Obj)
	Return $Obj.Count
EndFunc   ;==>_ItemCount

; Returns an array containing all the items in a Dictionary object
Func _GetItems($Obj)
	Return $Obj.Items
EndFunc   ;==>_GetItems

