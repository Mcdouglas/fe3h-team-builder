module DataBuilder exposing (..)

import CustomTypes exposing (..)


type Msg
    = InitStaticData


getJobCategories : List JobCategory
getJobCategories =
    [ JobCategory 0 Starting 20 0
    , JobCategory 1 Beginner 60 5
    , JobCategory 2 Intermediate 100 10
    , JobCategory 3 Advanced 150 20
    , JobCategory 4 Master 200 30
    , JobCategory 5 Unique 0 0
    ]


getJobs : List Job
getJobs =
    [ Job 0 "Commoner" 0 [] [] [] None (Just "Can use some magic")
    , Job 1 "Noble" 0 [] [] [] None (Just "Can use some magic")
    , Job 2 "Myrmidon" 0 [] [] [] None Nothing
    , Job 42 "Mortal Savant" 4 [] [] [] None (Just "Can use magic")
    ]
