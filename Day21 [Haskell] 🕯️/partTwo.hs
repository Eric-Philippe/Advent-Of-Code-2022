import qualified Data.Vector as V

data Monkey = Operation String String String String | Number String Int deriving (Eq, Show)

line2Monkey :: String -> Monkey
    line2Monkey str
    | length seperated == 2 = Number (take 4 $ seperated!!0) (read $ seperated!!1)
    | otherwise = Operation (take 4 $ seperated!!0) (seperated!!1) (seperated!!2) (seperated!!3)
        where
            seperated = words str

    str2func :: String -> (Int -> Int -> Int)
    str2func "*" = (*)
    str2func "-" = (-)
    str2func "+" = (+)
    str2func "/" = div

    puzzleInput :: IO (V.Vector Monkey)
    puzzleInput = V.fromList . (fmap line2Monkey) . lines <$> readFile "input.txt"

    findMonkey :: V.Vector Monkey -> String -> Monkey
    findMonkey monkeys monkeyName = monkeys V.! m
        where
            checkMonkeyName n (Operation a _ _ _) = n == a
            checkMonkeyName n (Number a _) = n == a
            Just m = V.findIndex (checkMonkeyName monkeyName) monkeys

    evalWithHumnCheck :: V.Vector Monkey -> Monkey -> (Int, Bool)
    evalWithHumnCheck _ (Number n a) = (a, n=="human")
    evalWithHumnCheck monkeys (Operation monkeyc monkey1 op monkey2) = (fun m1Val m2Val, hmn1 || hmn2)
        where
            (m1Val, hmn1) = evalWithHumnCheck monkeys (findMonkey monkeys monkey1)
            (m2Val, hmn2) = evalWithHumnCheck monkeys (findMonkey monkeys monkey2)
            fun = str2func op

    reverseOp :: Bool -> String -> Int -> Int -> Int -> Int
    reverseOp True "*" a b assertedValue = div assertedValue b
    reverseOp False "*" a b assertedValue = div assertedValue a
    reverseOp True "+" a b assertedValue = assertedValue - b
    reverseOp False "+" a b assertedValue = assertedValue - a
    reverseOp True "-" a b assertedValue = assertedValue + b
    reverseOp False "-" a b assertedValue = a - assertedValue
    reverseOp True "/" a b assertedValue = assertedValue * b 
    reverseOp False "/" a b assertedValue = div a assertedValue 

    backTrack' :: V.Vector Monkey -> Int -> Monkey -> Int
    backTrack' _ assertedValue (Number "human" _) = assertedValue
    backTrack' monkeys assertedValue (Operation mn monkey1 op monkey2)
        | humnPath1 = backTrack' monkeys (reverseOp True op m1Val m2Val assertedValue) m1
        | humnPath2 = backTrack' monkeys (reverseOp False op m1Val m2Val assertedValue) m2
        where
            m1 = findMonkey monkeys monkey1
            m2 = findMonkey monkeys monkey2
            (m1Val, humnPath1) = evalWithHumnCheck monkeys m1
            (m2Val, humnPath2) = evalWithHumnCheck monkeys m2

    backTrackRoot :: V.Vector Monkey -> Int
    backTrackRoot monkeys
        | humnPath1 = backTrack' monkeys m2Val m1
        | humnPath2 = backTrack' monkeys m1Val m2
        where
            (Operation _ monkey1 _ monkey2) = findMonkey monkeys "root"
            m1 = findMonkey monkeys monkey1
            m2 = findMonkey monkeys monkey2
            (m1Val, humnPath1) = evalWithHumnCheck monkeys m1
            (m2Val, humnPath2) = evalWithHumnCheck monkeys m2

    evalRoot:: V.Vector Monkey -> Int
    evalRoot monkeys = fst (evalWithHumnCheck monkeys (findMonkey monkeys "root"))

    runPartTwo :: IO Int
    runPartTwo = backTrackRoot <$> puzzleInput