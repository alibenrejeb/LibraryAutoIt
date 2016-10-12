#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Contrôleur relié à la gestion des livres.

#ce ----------------------------------------------------------------------------

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Action pour lister les livres.

#ce ----------------------------------------------------------------------------
Func book_list_controller()
    Local $dataList
    Local $index
    Local $lastIndex
    Local $bookIds

    ; Récupération de la liste des identifiants des livres.
    $bookIds = model_book_getAllBookIds()

    $lastIndex = UBound($bookIds) - 1
    For $index = 0 To $lastIndex
        ; Récupération du livre.
        model_book_getBookById($bookIds[$index])

        ; Transformation de la liste des identifiants en chaîne de caractères
        ; pour le contrôle "List", sous la forme "1|2|3|4|5".
        $bookTitle = model_book_getTitle()
        $dataList &= $bookTitle
        If $index <> $lastIndex Then
            $dataList &= "|"
        EndIf
    Next

    ; Définition des données.
    view_book_list_setData($dataList)

    ; Affichage de la fenêtre de la liste des livres.
    view_book_list_show()
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Action pour afficher le livre sélectionné.

#ce ----------------------------------------------------------------------------
Func book_show_controller($bookTitle)
    Local $index
    Local $lastIndex

    ; Récupération du livre en fonction du titre passé en paramètre.
    $book = model_book_getBookByTitle($bookTitle)

    ; Définition des données.
    view_book_show_setData(model_book_getTitle(), model_book_getAuthor(), model_book_getShortDescription())

    ; Affichage de la fenêtre d'informations d'un livre.
    view_book_show_show()
EndFunc

