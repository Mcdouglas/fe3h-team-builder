module JobEventListener exposing (..)

import CustomTypes exposing (Build, Job)
import GlobalMessage exposing (JobModal(..), Msg(..))
import GlobalModel exposing (..)


handle : JobModal -> Model -> Model
handle msg model =
    case msg of
        OpenJobModal value ->
            openModal (updateJobPicker model value)

        CloseJobModal ->
            closeModal model

        UpdateJobPicker value ->
            updateJobPicker model value

        UpdateBuild value ->
            closeModal (updateBuild model value)


updateJobPicker : Model -> ( Int, Maybe Job ) -> Model
updateJobPicker model picker =
    let
        oldView =
            model.view

        newView =
            { oldView | jobPicker = picker }
    in
    { model | view = newView }


updateBuild : Model -> ( Int, Job ) -> Model
updateBuild model shift =
    let
        newTeam =
            model.team
                |> List.map (\build -> updateBuildAndKeepOther build shift)
    in
    { model | team = newTeam }


updateBuildAndKeepOther : ( Int, Build ) -> ( Int, Job ) -> ( Int, Build )
updateBuildAndKeepOther ( idx, build ) ( buildIdx, job ) =
    if idx == buildIdx then
        ( idx, { build | jobId = job.id } )

    else
        ( idx, build )


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
