#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Fenêtre des informations d'un livre.

#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $_view_book_show_window
Global $_view_book_show_authorLabel
Global $_view_book_show_titleLabel
Global $_view_book_show_descriptionEdit

; Affichage d'une fenêtre unique pour l'application.
view_book_show_prepare()

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Préparation de la fenêtre.

#ce ----------------------------------------------------------------------------
Func view_book_show_prepare()
    $_view_book_show_window = GUICreate("Informations sur le livre", 300, 250)
    GUISetOnEvent($GUI_EVENT_CLOSE, "view_book_show_close", $_view_book_show_window)

    GUICtrlCreateLabel("Auteur :", 16, 8, 41, 17)
    GUICtrlCreateLabel("Titre :", 16, 32, 31, 17)
    GUICtrlCreateLabel("Description :", 16, 56, 63, 17)

    $_view_book_show_authorLabel            = GUICtrlCreateLabel("", 112, 8, 281, 17)
    $_view_book_show_titleLabel             = GUICtrlCreateLabel("", 112, 32, 281, 17)
    $_view_book_show_descriptionEdit        = GUICtrlCreateEdit("", 16, 80, 281, 129, $ES_MULTILINE)
    GUICtrlSetState($_view_book_show_descriptionEdit, $GUI_DISABLE)

    GUICtrlCreateButton("Fermer", 224, 224, 73, 25, $WS_GROUP)
    GUICtrlSetOnEvent(-1, "view_book_show_close")
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Définition des données à afficher dans la fenêtre.

#ce ----------------------------------------------------------------------------
Func view_book_show_setData($title, $author, $shortDescription)
    GUICtrlSetData($_view_book_show_titleLabel, $title)
    GUICtrlSetData($_view_book_show_authorLabel, $author)
    GUICtrlSetData($_view_book_show_descriptionEdit, $shortDescription)
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Affichage de la fenêtre.

#ce ----------------------------------------------------------------------------
Func view_book_show_show()
    GUISetState(@SW_SHOW, $_view_book_show_window)
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Fermeture de la fenêtre.

#ce ----------------------------------------------------------------------------
Func view_book_show_close()
    GUISetState(@SW_HIDE, $_view_book_show_window)
EndFunc
