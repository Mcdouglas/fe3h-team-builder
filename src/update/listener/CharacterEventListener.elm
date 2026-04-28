module CharacterEventListener exposing (handle)

import Character exposing (getCharacterById)
import CustomTypes exposing (Character)
import DataHandler exposing (initBuild)
import Dict exposing (Dict(..))
import GlobalMessage exposing (CharacterModal(..))
import GlobalModel exposing (Model)


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
            closeModal model


openModal : Model -> Int -> Model
openModal model buildIdx =
    let
        maybeCharacter =
            model.team
                |> Dict.get buildIdx
                |> Maybe.map (\build -> getCharacterById build.idCharacter)

        oldView =
            model.view

        newView =
            case maybeCharacter of
                Just character ->
                    { oldView | characterModalIsOpen = True, characterPicker = ( buildIdx, character ) }

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
    if model.team |> Dict.filter (\_ v -> v.idCharacter == character.id) |> Dict.isEmpty then
        if model.view.isCreatingBuild == True then
            closeModal (createBuild model character)

        else
            closeModal (updateBuild model ( position, character ))

    else
        model


createBuild : Model -> Character -> Model
createBuild model character =
    let
        newTeam =
            model.team
                |> Dict.insert (Dict.size model.team) (initBuild character.id)

        oldView =
            model.view

        newView =
            { oldView | isCreatingBuild = False }
    in
    { model | team = newTeam, view = newView }


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( buildIdx, character ) =
    let
        build =
            initBuild character.id
    in
    { model | team = model.team |> Dict.insert buildIdx build }
