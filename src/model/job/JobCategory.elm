module JobCategory exposing (getJobCategoryById, initJobCategories)

import CustomTypes exposing (CategoryUnionType(..), JobCategory)


getJobCategoryById : Int -> Maybe JobCategory
getJobCategoryById val =
    initJobCategories
        |> List.filter (\x -> x.id == val)
        |> List.head


initJobCategories : List JobCategory
initJobCategories =
    [ JobCategory 0 Unique Nothing Nothing
    , JobCategory 1 Beginner (Just 60) (Just 5)
    , JobCategory 2 Intermediate (Just 100) (Just 10)
    , JobCategory 3 Advanced (Just 150) (Just 20)
    , JobCategory 4 Master (Just 200) (Just 30)
    ]
