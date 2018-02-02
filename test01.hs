isPrime :: Int -> Bool
isPrime n
    | n <= 1    = False
    | otherwise = not $ any (\x -> n `mod` x == 0) [2,3..(n-1)]

main = do
    print $ isPrime 10 -- False
    print $ isPrime 1  -- False
    print $ isPrime 2  -- True
    print $ isPrime 3  -- True
    print $ isPrime 13 -- True


-- kk = [4,8,15,16,23,42] ++ [9,10]
-- 
-- main = print kk
    
