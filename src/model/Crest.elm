module Crest exposing (getCrest, initCrests)

import CustomTypes exposing (Crest)


getCrest : Int -> Maybe Crest
getCrest val =
    initCrests
        |> List.filter (\e -> e.id == val)
        |> List.head


initCrests : List Crest
initCrests =
    [ Crest 1 0 "Flames" "Occasionally restores HP equal to 30% of damage dealt. Rarely raises Mt and stops counterattacks."
    , Crest 2 3 "Blaiddyd" "Occasionally doubles Atk and weapon uses for combat arts."
    , Crest 3 1 "Charon" "Occasionally raises Mt when using combat arts."
    , Crest 4 6 "Daphnel" "Sometimes raises Mt when using combat arts."
    , Crest 5 7 "Dominic" "Occasionally conserves uses of attack magic."
    , Crest 6 10 "Fraldarius" "Sometimes raises Mt when using a weapon."
    , Crest 7 5 "Gautier" "Occasionally raises Mt when using combat arts."
    , Crest 8 11 "Gloucester" "Occasionally raises Mt during magic attacks."
    , Crest 9 8 "Goneril" "Sometimes allows combat arts to prevent enemy counterattacks."
    , Crest 10 12 "Lamine" "Occasionally conserves uses of recovery magic."
    , Crest 11 4 "Riegan" "Sometimes restores HP equal to 30% of damage dealt when using combat arts."
    , Crest 12 13 "Cethleann" "Sometimes raises Mt when using recovery magic."
    , Crest 13 14 "Cichol" "Sometimes lets combat arts prevent enemy counterattacks."
    , Crest 14 15 "Indech" "Occasionally allows weapon attacks to strike twice."
    , Crest 15 16 "Macuil" "Occasionally raises Mt during magic attacks."
    , Crest 16 9 "Maurice" "Sometimes raises Mt when using a weapon."
    , Crest 17 2 "Seiros" "Occasionally raises Mt when using combat arts."
    ]
