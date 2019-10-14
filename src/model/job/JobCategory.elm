module JobCategory exposing (..)

import CustomTypes exposing (..)


getJobCategoryById : Int -> Maybe JobCategory
getJobCategoryById val =
    initJobCategories
        |> List.filter (\x -> x.id == val)
        |> List.head


initJobCategories : List JobCategory
initJobCategories =
    [ JobCategory 0 Starting (Just 20) (Just 0)
    , JobCategory 1 Beginner (Just 60) (Just 5)
    , JobCategory 2 Intermediate (Just 100) (Just 10)
    , JobCategory 3 Advanced (Just 150) (Just 20)
    , JobCategory 4 Master (Just 200) (Just 30)
    , JobCategory 5 Unique Nothing Nothing
    ]
