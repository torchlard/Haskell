validBraces :: String -> Bool
validBraces s = "" == foldr collapse [] s

collapse :: Char -> String -> String
-- either match left '(' or right ')' to eliminate close brackets
collapse '(' (')':xs) = xs  
collapse '{' ('}':xs) = xs
collapse '[' (']':xs) = xs
collapse x xs = x:xs  -- delay elimination, process until matching


findMissing :: Integral a => [a] -> a
findMissing lst@(x1:x2:x3:rest)
  | (x2-x1 == x3-x2) = findMissing $ tail lst
  | otherwise = x1 + x3 - x2

isValidWalk :: [Char] -> Bool
isValidWalk walk = length (take 11 walk) == 10 && count 'w' walk == count 'e' walk 
                                               && count 's' walk == count 'n' walk
count c = length . filter (==c)


import Data.Maybe 

gap :: (gap: Integer) -> (start: Integer) -> (end: Integer) -> Maybe (Integer, Integer)
gap g m n = listToMaybe . filter (\(x,y) -> y-x == g) $ zip primeListMN (tail primeListMN)
  where
    isPrime n = not . any (==0) . map (\x -> n `mod` x) $ [2 .. floor.sqrt.fromIntegral $ n]
    primeListMN = filter isPrime [m .. n]



main :: IO ()
main = do 
  putStrLn $ show $ validBraces "[{}]"
  putStrLn $ show $ findMissing [1,2,4,5]
  putStrLn $ show $ isValidWalk ['n','s','n','s','n','s','n','s','n','s']
  putStrLn $ show $ gap 2 10000000 11000000 




