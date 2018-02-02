-- main = do
--   putStrLn "hello world"
--   name <- getLine
--   putStrLn ("Hey "++name)

-- main = do
--   return ()
--   a <- return "hahaha"
--   line <- getLine
--   return "blah"
--   return 4
--   putStrLn $ line ++ " " ++ a

-- instance Functor IO where
--   fmap f action = do
--     result < -action
--     return (f result)

-- import Data.Char
-- import Data.List
-- main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
--   putStrLn line

data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter+1) (f x)

class (Functor f)=> Applicative f where
  pure :: a -> f a
  (<*>) :: f (a->b) -> f a -> f b

instance Applicative Maybe where
  pure = Just
  Nothing <*> _ = Nothing
  (Just f) <*> something = fmap f something










