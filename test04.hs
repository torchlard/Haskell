-- main = do
--   putStrLn "hello world"
--   name <- getLine
--   putStrLn ("Hey "++name)

-- main = do
--   return ()
--   -- a <- return "hahaha"
--   -- line <- getLine
--   return "blah"
--   return 4
--   putStrLn $ "def" ++ " " ++ "no"

-- instance Functor IO where
--   fmap f action = do
--     result < -action
--     return (f result)

-- import Data.Char
-- import Data.List
-- main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
--   putStrLn line
-- 
-- data CMaybe a = CNothing | CJust Int a deriving (Show)
-- 
-- instance Functor CMaybe where
--   fmap f CNothing = CNothing
--   fmap f (CJust counter x) = CJust (counter+1) (f x)
-- 
-- 
-- class (Functor f)=> Applicative f where
--   pure :: a -> f a
--   (<*>) :: f (a->b) -> f a -> f b
-- 
-- instance Applicative Maybe where
--   pure = Just
--   Nothing <*> _ = Nothing
--   (Just f) <*> something = fmap f something
-- 
-- (++) <$> Just "johntra" <*> Just "volta"

type KnightPos = (Int,Int)
moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = filter onBoard
  [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1),
  (c-1,r+2),(c-1,r-2),(c+1,r+2),(c+1,r-2)]
  where onBoard (c,r) = c `elem` [1..8] && r `elem` [1..8] -- within board

in3 :: KnightPos -> [KnightPos]
in3 start = do
  first <- moveKnight start
  second <- moveKnight first
  moveKnight second
-- in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight

-- canReackIn3 :: KnightPos -> KnightPos -> [KnightPos]
-- canReackIn3 start end = in3 start





