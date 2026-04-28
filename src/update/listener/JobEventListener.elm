module JobEventListener exposing (handle)

import CustomTypes exposing (Job)
import Dict exposing (Dict(..))
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (Model)


handle : JobModal -> Model -> Model
handle msg model =
    case msg of
        OpenJobModal value ->
            openModal (updateJobPicker model value)

        UpdateJobPicker value ->
            updateJobPicker model value

        UpdateBuild value ->
            closeModal (updateBuild model value)

        UpdateCategory value ->
            updateCategory model value

        DeleteCategory ->
            deleteCategory model

        CloseJobModal ->
            closeModal model


updateCategory : Model -> Int -> Model
updateCategory model value =
    let
        oldView =
            model.view

        newView =
            { oldView | categorySelected = Just value }
    in
    { model | view = newView }


deleteCategory : Model -> Model
deleteCategory model =
    let
        oldView =
            model.view

        newView =
            { oldView | categorySelected = Nothing }
    in
    { model | view = newView }


updateJobPicker : Model -> ( Int, Job ) -> Model
updateJobPicker model picker =
    let
        oldView =
            model.view

        newView =
            { oldView | jobPicker = picker }
    in
    { model | view = newView }


updateBuild : Model -> ( Int, Job ) -> Model
updateBuild model ( buildIdx, job ) =
    let
        updateIf maybeBuild =
            maybeBuild |> Maybe.andThen (\b -> Just { b | jobId = job.id })

        newTeam =
            model.team
                |> Dict.update buildIdx updateIf
    in
    { model | team = newTeam }


openModal : Model -> Model
openModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | jobModalIsOpen = True }
    in
    { model | view = newView }


closeModal : Model -> Model
closeModal model =
    let
        oldView =
            model.view

        newView =
            { oldView | jobModalIsOpen = False }
    in
    { model | view = newView }
