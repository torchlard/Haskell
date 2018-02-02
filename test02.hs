-- doubleMe x = x+x+x
-- doubleUs x y = doubleMe x + doubleMe y
-- doubleSmallNumber x = (if x>100 then x else x*2)+1

-- [x*2 | x<-[1..10], x*2<=12 ]
-- zip [1..] ["a","b","c"]
-- read "(5,'a')" :: (Int,Char)
-- 
-- circum :: Float -> Float
-- circum r = 2*pi*r

-- lucky :: (Integral a) => a -> String
-- lucky 7 = "LUCKY NUMBER SEVEN"
-- lucky x = "sorry, out of luck!"

-- factorial :: (Integral a)=> a->a
-- factorial 0 = 1
-- factorial n = n*factorial(n-1)
-- 
-- addVector :: (Num a)=> (a,a)->(a,a)->(a,a)
-- addVector (x1,y1) (x2,y2) = (x1+y1, x2+y2)

-- head' :: [a]->a
-- head' [] = error "cannnot handle"
-- head' (x:_) = x
-- 
-- tell :: (Show a) => [a]->String
-- tell [] = "empty"
-- tell (x:[]) = "list has 1 element "++ show x
-- tell (x:y:[]) = "list has 2 elements "++ show x++","++ show y
-- tell (x:y:_:[]) = "all others"
-- 
-- bmiTell :: (RealFloat a)=> a->a->String
-- bmiTell weight height
--   | bmi <= skinny = "underweight"
--   | bmi <= normal = "normal"
--   | bmi <= fat = "fat!"
--   | otherwise = "whale"
--   where bmi = weight/height^2
--         (skinny, normal, fat) = (18.5,25.0,30.0)

-- 4 * ( let a=0 in a+1 ) + 3

-- replicate' :: (Num i, Ord i)=> i->a->[a]
-- replicate' a b 
--   | a<=0  = []
--   | otherwise = b:replicate' (a-1) b
-- 
-- -- (Num a, Ord a): interface to a, give extra functionality
-- take' :: (Num a, Ord a)=> a->[b]->[b]
-- take' n _
--   | n<=0 = []
-- take' _ [] = []
-- take' n (x:xs) = x:take' (n-1) xs
-- 
-- reverse' :: [a]->[a]
-- reverse' [] = []
-- reverse' (x:xs) = reverse' xs ++ [x]
-- 
-- zip' :: [a]->[b]->[(a,b)]
-- zip' _ [] = []
-- zip' [] _ = []
-- zip' (x:xs) (y:ys) = (x,y):zip' xs ys
-- 
-- quicksort :: (Ord a)=> [a]->[a]
-- quicksort [] = []
-- quicksort (x:xs) =
--     let smallerSorted = quicksort [a | a<-xs, a<=x]
--         biggerSorted = quicksort [a | a<-xs, a>x]
--     in smallerSorted ++ [x] ++ biggerSorted

-- multThree :: (Num a)=> a->a->a->a
-- multThree x y z = x*y*z
-- let multWithNine = multThree 9
-- multWithNine 2 3    -- 2x3x9

-- divideByTen :: (Floating a) => a->a
-- divideByTen = (/10)
-- 
-- applyTwice :: (a->a) ->a->a
-- applyTwice f x = f (f x)
-- 
-- zipWith' :: (a->b->c) -> [a]->[b]->[c]
-- zipWith' _ [] _ = []
-- zipWith' _ _ [] = []
-- zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- zipWith' (zipWith'(*)) [[1,2,3],[3,5,6]] [[3,2,2],[3,4,
-- 5]]

-- largestDivisible :: (Integral a) => a
-- largestDivisible = head (filter p [100000, 99999..])
--     where p x = x `mod` 3829 == 0
-- 
-- chain :: (Integral a) => a -> [a]
-- chain 1 = [1]
-- chain n
--   | odd n = n:chain (n*3+1)
--   | even n = n:chain (n `div` 2)
-- 
-- largerThan15 :: Int
-- largerThan15 = length(filter (\xs -> length xs > 15) (map chain [1..100] ))

sum' :: (Num a) => [a]->a
sum' xs = foldl (\acc x-> acc + x) 0 xs

elem' :: (Eq a) => a->[a]-> Bool
elem' y ys = foldl (\acc x -> if x==y then True else acc) False ys

product' :: (Num a)=> [a]->a
product' = foldr1 (*)

scanl1 (\acc	x	->	if	x	>	acc	then	x	else	acc)	[3,4,5,3,7,9,2,1]	

findKey:: (Eq k)=> k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc-> if key==k then v else acc) Nothing




