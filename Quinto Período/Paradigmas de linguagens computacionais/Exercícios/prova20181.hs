------ PROVA 2018.1 -------------------



-------------- QUESTAO 2 -----------------------------------

import Data.List (sort)
import Data.Char (intToDigit)

data CInt = Conjunto [Int] deriving (Show)

makeSet :: [Int] -> CInt
makeset [] = Conjunto []
makeset [x] = Conjunto [x]
makeSet n = Conjunto (dropDuplicates (sort n))

dropDuplicates :: [Int] -> [Int]
dropDuplicates [] = []
dropDuplicates n@(x:y:xs)
                            | x == y = dropDuplicates (drop 1 n)
                            | otherwise = x : dropDuplicates (y:xs)
dropDuplicates (x:xs) = [x]

union :: CInt -> CInt -> CInt
union (Conjunto n) (Conjunto m) = makeSet (n++m)

mapSet :: (Int -> Int) -> CInt -> CInt
mapSet f (Conjunto n) = Conjunto (map f n) 


----------------------------- QUESTAO 3--------------------------------------

type Texto = String
type Id = String
type DataHoraPub = Int

data Post = Post (Id, DataHoraPub) Texto deriving (Show, Eq)
data Thread = Nil | T Post (Thread) deriving (Show)

show :: Thread -> String
show (Nil) = []
show (T (Post x y) (t)) = "( " ++ (fst x) ++ " " ++ [(intToDigit(snd x))] ++ " " ++ y ++ " )" ++ Main.show  t 

inserirPost :: Post -> Thread -> Thread
inserirPost m Nil = T m Nil
inserirPost m@(Post (p1,p2) t1) n@(T (Post (x1, x2) y) (t)) = T m n

threadToList :: Thread -> [Post]
threadToList Nil = []
threadToList (T n@(Post (x1,x2) y) t) = n : threadToList t

listToThread :: [Post] -> Thread
listToThread [] = Nil
listToThread n@(x:xs) = T x (listToThread xs)

extractTuplesFromThread :: Thread -> [(Id, DataHoraPub)]
extractTuplesFromThread Nil = []
extractTuplesFromThread (T n@(Post (x1,x2) y) t) = (x1,x2) : extractTuplesFromThread t

makeList :: [(Id, DataHoraPub)] -> Thread -> [Post]
makeList _ Nil = []
makeList [] _ = []
makeList n@(x:xs) m@(T p@(Post (x1,x2) y) t)
                                            | fst x == x1 && snd x == x2 = p : makeList xs t
                                            | otherwise = makeList n t

removerPost :: (Id, DataHoraPub) -> Thread -> Thread
removerPost a@(x,y) n = listToThread(makeList( filter (/=a)  (extractTuplesFromThread n)) n)