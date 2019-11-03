module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


updateBuild : Model -> ( Int, Character ) -> Model
updateBuild model ( position, character ) =
    let
        initNewBuild ( id, item ) =
            if id == position then
                ( id, Build character.id [] [] -1 False )

            else
                ( id, item )

        newTeam =
            model.team
                |> List.map (\e -> initNewBuild e)
    in
    { model | team = newTeam }


getSkillByType : ( Int, Int, SkillType ) -> Maybe Skill
getSkillByType ( id, idSkill, skillType ) =
    case skillType of
        Mastery ->
            getMasterySkill idSkill
                |> Maybe.andThen (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt True))

        Standard ->
            getStandardSkill idSkill
                |> Maybe.andThen (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt False))


getPassiveSkills : Build -> List (Maybe Skill)
getPassiveSkills build =
    build.listPassiveSkill
        |> List.map getSkillByType
        |> List.foldr (::) [ Nothing, Nothing, Nothing, Nothing, Nothing ]
        |> List.take 5


getActiveSkills : Build -> List (Maybe Skill)
getActiveSkills build =
    build.listActiveSkill
        |> List.map getSkillByType
        |> List.foldr (::) [ Nothing, Nothing, Nothing, Nothing, Nothing ]
        |> List.take 3
