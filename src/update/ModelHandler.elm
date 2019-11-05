module ModelHandler exposing (..)

import Character exposing (..)
import CustomTypes exposing (..)
import GlobalModel exposing (..)
import Job exposing (..)
import MasterySkill exposing (..)
import Maybe.Extra exposing (..)
import StandardSkill exposing (..)


getSkillByType : Int -> SkillType -> Maybe Skill
getSkillByType idSkill skillType =
    case skillType of
        Mastery ->
            getMasterySkill idSkill
                |> Maybe.andThen (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt True))

        Standard ->
            getStandardSkill idSkill
                |> Maybe.andThen (\e -> Just (Skill e.id e.pictureId e.name e.description e.combatArt False))
