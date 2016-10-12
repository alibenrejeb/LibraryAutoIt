#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.14.2
 Auteur:         a.benrejeb

 Fonction du Script :
	Implémentation du modèle "Livre".

#ce ----------------------------------------------------------------------------


; Dans cet exemple, nous stockerons les livres dans un fichier CSV.
Global $_model_book_CSV_file = @ScriptDir & "/app/db/database.csv"
Global $_model_book_delimiter = ";"

; Auto-increment id
Global $__model_book_ITERATION = 1

; Colonnes représentant le livre
Global Enum $__model_book_ID = 0, _
            $__model_book_TITLE, _
            $__model_book_AUTHOR, _
            $__model_book_SHORTDESCRIPTION

; Attributs de mon livre courant
Global $_model_book_current[4]

; Fonctions de liste

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les identifiants de tous les livres disponibles.

#ce ----------------------------------------------------------------------------
Func model_book_getAllBookIds()
    Local $file
    Local $bookIdsArray[1]

    $file = FileOpen($_model_book_CSV_file, 8)

    While True
        $line = FileReadLine($file)
        If @error = -1 Then ExitLoop

        Local $book = StringSplit($line, ";", 3)

        If IsArray($book) Then
            _ArrayInsertAndRedim($bookIdsArray, $book[$__model_book_ID])
        EndIf
    Wend

    FileClose($file)

    Return $bookIdsArray
EndFunc

; Fonctions de gestion d'un livre

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les informations d'un livre en fonction de son identifiant.

#ce ----------------------------------------------------------------------------
Func model_book_getBookById($id)
    Local $index

    $file = FileOpen($_model_book_CSV_file, 8)

    While True
        $line = FileReadLine($file)
        If @error = -1 Then ExitLoop

        Local $book = StringSplit($line, $_model_book_delimiter, 3)

        If $book[$__model_book_ID] = $id Then
            $_model_book_current[$__model_book_ID]                  = $id
            $_model_book_current[$__model_book_TITLE]               = $book[$__model_book_TITLE]
            $_model_book_current[$__model_book_AUTHOR]              = $book[$__model_book_AUTHOR]
            $_model_book_current[$__model_book_SHORTDESCRIPTION]    = $book[$__model_book_SHORTDESCRIPTION]
            ExitLoop
        EndIf
    Wend

    FileClose($file)

EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Récupère les informations d'un livre en fonction de son titre.

#ce ----------------------------------------------------------------------------
Func model_book_getBookByTitle($title)
    Local $index

    $file = FileOpen($_model_book_CSV_file, 8)

    While True
        $line = FileReadLine($file)
        If @error = -1 Then ExitLoop

        Local $book = StringSplit($line, $_model_book_delimiter, 3)

        If $book[$__model_book_TITLE] = $title Then
            $_model_book_current[$__model_book_ID]                  = $book[$__model_book_ID]
            $_model_book_current[$__model_book_TITLE]               = $book[$__model_book_TITLE]
            $_model_book_current[$__model_book_AUTHOR]              = $book[$__model_book_AUTHOR]
            $_model_book_current[$__model_book_SHORTDESCRIPTION]    = $book[$__model_book_SHORTDESCRIPTION]
            ExitLoop
        EndIf
    Wend

    FileClose($file)

EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Modifie ou crée le livre courant dans la base de données.

#ce ----------------------------------------------------------------------------
Func model_book_saveBook()
    Local $file
    Local $newFileContent = ""

    ; Lecture
    $file = FileOpen($_model_book_CSV_file, 8)

    While True
        Local $line = FileReadLine($file)
        If @error = -1 Then ExitLoop

        Local $book = StringSplit($line, $_model_book_delimiter, 3)

        If $book[$__model_book_ID] <> $_model_book_current[$__model_book_ID] Then
            $newFileContent &= $line & @CRLF
        EndIf
    WEnd

    $newFileContent &= _ArrayToString($_model_book_current, $_model_book_delimiter)

    FileClose($file)

    ; Ecriture
    $file = FileOpen($_model_book_CSV_file, 10)

    FileWrite($file, $newFileContent)

    FileClose($file)
EndFunc

#cs ----------------------------------------------------------------------------

 Fonction du Script :
    Crée un nouveau livre.

#ce ----------------------------------------------------------------------------
Func model_book_newBook()
    $_model_book_current[$__model_book_TITLE]               = "Nouveau livre"
    $_model_book_current[$__model_book_AUTHOR]              = "Nouvel auteur"
    $_model_book_current[$__model_book_SHORTDESCRIPTION]    = "Nouvelle description"

    $_model_book_current[$__model_book_ID]                  = $__model_book_ITERATION

    $__model_book_ITERATION += 1
EndFunc

; Getters et setters des attributs d'un livre

Func model_book_getId()
    Return $_model_book_current[$__model_book_ID]
EndFunc

Func model_book_setId($id)
    $_model_book_current[$__model_book_ID] = $id
EndFunc


Func model_book_getTitle()
    Return $_model_book_current[$__model_book_TITLE]
EndFunc

Func model_book_setTitle($title)
    $_model_book_current[$__model_book_TITLE] = $title
EndFunc


Func model_book_getAuthor()
    Return $_model_book_current[$__model_book_AUTHOR]
EndFunc

Func model_book_setAuthor($author)
    $_model_book_current[$__model_book_AUTHOR] = $author
EndFunc


Func model_book_getShortDescription()
    Return $_model_book_current[$__model_book_SHORTDESCRIPTION]
EndFunc

Func model_book_setShortDescription($shortdescription)
    $_model_book_current[$__model_book_SHORTDESCRIPTION] = $shortdescription
EndFunc
