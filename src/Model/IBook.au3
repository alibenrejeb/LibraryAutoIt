#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Interface du modèle "Livre".

#ce ----------------------------------------------------------------------------

; Fonctions de liste

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les identifiants de tous les livres disponibles.

#ce ----------------------------------------------------------------------------
Func model_book_getAllBookIds()
EndFunc

; Fonctions de gestion d'un livre

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les informations d'un livre en fonction de son identifiant.

#ce ----------------------------------------------------------------------------
Func model_book_getBookById($id)
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les informations d'un livre en fonction de son titre.

#ce ----------------------------------------------------------------------------
Func model_book_getBookByTitle($title)
EndFunc

; Getters et setters des attributs d'un livre

Func model_book_getId()
EndFunc

Func model_book_setId($id)
EndFunc


Func model_book_getTitle()
EndFunc

Func model_book_setTitle($title)
EndFunc


Func model_book_getAuthor()
EndFunc

Func model_book_setAuthor($author)
EndFunc


Func model_book_getShortDescription()
EndFunc

Func model_book_setShortDescription($shortdescription)
EndFunc
