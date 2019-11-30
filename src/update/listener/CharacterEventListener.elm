module CharacterEventListener exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import DataHandler exposing (initBuild)
import GlobalMessage exposing (CharacterModal(..))
import GlobalModel exposing (..)


handle : CharacterModal -> Model -> Model
handle msg model =
    case msg of
        OpenCharacterModal id ->
            openModal model id

        UpdateCharacterPicker value ->
            updateCurrent model value

        UpdateBuildWithCharacter value ->
            updateOrCreateBuild model value

        CloseCharacterModal ->
            handleDoubleClosure model

        IgnoreCloseCharacterModal ->
            ignoreClosureInModal model


ignoreClosureInModal : Model -> Model
ignoreClosureInModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | skipNextClosure = True }
    in
    { model | view = newView }


handleDoubleClosure : Model -> Model
handleDoubleClosure model =
    let
        oldView =
            model.view

        dontCloseModal =
            model.view.skipNextClosure
    in
    if dontCloseModal then
        { model | view = { oldView | skipNextClosure = False } }

    else
        closeModal model


openModal : Model -> Int -> Model
openModal model idx =
    let
        maybeCharacter =
            model.team
                |> List.filter (\( id, e ) -> id == idx)
                |> List.head
                |> Maybe.map (\( id, e ) -> getCharacterById e.idCharacter)

        oldView =
            model.view

        newView =
            case maybeCharacter of
                Just character ->
                    { oldView | characterModalIsOpen = True, characterPicker = ( idx, character ) }

                Nothing ->
                    { oldView | characterModalIsOpen = True }
    in
    { model | view = newView }


closeModal : Model -> Model
closeModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | characterModalIsOpen = False }
    in
    { model | view = newView }


updateCurrent : Model -> ( Int, Maybe Character ) -> Model
updateCurrent model element =
    let
        oldView =
            model.view

        newView =
            { oldView | characterPicker = element }
    in
    { model | view = newView }


updateOrCreateBuild : Model -> ( Int, Character ) -> Model
updateOrCreateBuild model ( position, character ) =
    let
        notAlreadySelected =
            model.team
                |> List.filter (\( idx, build ) -> build.idCharacter == character.id)
                |> List.isEmpty
    in
    if notAlreadySelected then
        if model.view.isCreatingBuild == True then
            closeModal (createBuild model character)

        else
            closeModal (updateBuild model ( position, character ))

    else
        model


createBuild : Model -> Character -> Model
createBuild model character =
    let
        newBuild =
            ( List.length model.team, initBuild character.id )

        newTeam =
            newBuild :: model.team

        oldView =
            model.view

        newView =
            { oldView | isCreatingBuild = False }
    in
    { model | team = newTeam, view = newView }


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( position, character ) =
    let
        initNewBuild ( id, item ) =
            if id == position then
                ( id, initBuild character.id )

            else
                ( id, item )

        newTeam =
            model.team
                |> List.map (\e -> initNewBuild e)
    in
    { model | team = newTeam }
