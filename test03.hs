-- data Point = Point Float Float deriving (Show)
-- -- data Shape = Circle Float Float Float | Rectangle Float Float Float Float
-- data Shape = Circle Point Float | Rectangle Point Point deriving (Show)
-- 
-- baseCircle :: Float -> Shape
-- baseCircle r = Circle (Point 0 0) r
-- 
-- baseRect :: Float -> Float -> Shape
-- baseRect w h = Rectangle (Point 0 0) (Point w h)
-- 
-- surface :: Shape -> Float
-- surface (Circle _ r) = pi*r^2
-- surface (Rectangle (Point x1 y1) (Point x2 y2) ) = (abs $ x2-x1) * (abs $ y2-y1)
-- 
-- data Person = Person {
--   firstName :: String,
--   lastName :: String,
--   age :: Int,
--   height :: Float,
--   phoneNumber :: String,
--   flavor :: String
-- } deriving (Show)

-- data Car a b c = Car {
--   company :: a,
--   model :: b,
--   year :: c
-- } deriving (Show)
-- 
-- tellCar :: (Show a) => Car String String a -> String
-- tellCar (Car{company=c, model=m, year=y}) = "This "++ c ++" "++ m ++" was made in "++ show y
-- -- tellCar (Car "Ford" "Canny" 1987)
-- 
-- -- ## 3-dimensional vector data type
-- data Vector a = Vector a a a deriving (Show)
-- vplus :: (Num t) => Vector t -> Vector t -> Vector t
-- (Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)
-- vecMult :: (Num t) => Vector t -> t -> Vector t
-- (Vector i j k) `vecMult` m = Vector (i*m) (j*m) (k*m)
-- scalarMult :: (Num t) => Vector t -> Vector t -> Vector t
-- (Vector i j k) `scalarMult` (Vector l m n) = Vector (i*l) (j*m) (k*n)
-- 
-- data Day = Mon | Tue | Wed | Thur | Fri | Sat | Sun
--     deriving (Eq, Ord, Show, Read, Bounded, Enum)
-- show Wed
-- read "Sat" :: Day
-- Sat == Sun    -- False
-- Sat > Fri   -- True
-- Mon `compare` Wed   -- LT
-- minBound :: Day -- Mon
-- maxBound :: Day    -- Sun
-- succ Mon  -- Tue
-- pred Sat  -- Fri
-- [Thur .. Sun]

-- Left: error, Right: result
-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- import qualified Data.Map as Map
-- data LockerState = Taken | Free deriving (Show, Eq)
-- type Code = String
-- type LockerMap = Map.Map Int (LockerState, Code)
-- 
-- lockerLookup:: Int->LockerMap-> Either String Code
-- lockerLookup lockerNumber map =
--   case Map.lookup lockerNumber map of
--     Nothing -> Left $ "Locker numer "++ show lockerNumber++" does not exist"
--     Just (state, code) -> if state /= Taken
--                           then Right code -- success, get code
--                           else Left $"Locker "++ show lockerNumber++" already taken."
-- 
-- lockers :: LockerMap
-- lockers = Map.fromList
--   [(100,(Taken,"ZD39I")),
--     (101,(Free,"JAH3I")),
--     (103,(Free,"IQSA9")),
--     (105,(Free,"QOTSA")),
--     (109,(Taken,"893JJ")),
--     (110,(Taken,"99292"))
--   ]

-- infixr 5 :-:
-- data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

-- -- ### binary search tree
-- data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
-- 
-- singleton :: a->Tree a
-- singleton a = Node a EmptyTree EmptyTree
-- 
-- treeInsert :: (Ord a)=> a -> Tree a -> Tree a
-- treeInsert x EmptyTree = singleton x
-- treeInsert x (Node a left right)
--   | x==a = Node x left right
--   | x<a  = Node a (treeInsert x left) right
--   | x>a  = Node a left (treeInsert x right)
-- 
-- treeElem :: (Ord a)=> a -> Tree a -> Bool
-- treeElem x EmptyTree = False
-- treeElem x (Node a left right)
--   | x==a = True
--   | x<a  = treeElem x left
--   | x>a  = treeElem x right

-- -- ## add restriction that m must belongs to Eq
-- instance (Eq m) => Eq (Maybe m) where
--   Just x == Just y  =  x==y
--   Nothing == Nothing = True
--   _ == _ = False
-- 
-- -- ## example showing custom typeclass mimic javascript
-- class YesNo a where
--   yesno :: a -> Bool
-- 
-- instance YesNo Int where
--   yesno 0 = False
--   yesno _ = True
-- instance YesNo [a] where
--   yesno [] = False
--   yesno _ = True
-- instance YesNo Bool where
--   yesno = id
-- instance YesNo (Maybe a) where
--   yesno (Just _) = True
--   yesno Nothing = False
-- instance YesNo (Tree a) where
--   yesno EmptyTree = False
--   yesno _ = True
-- 
-- instance Functor Tree where
--   fmap f EmptyTree = EmptyTree
--   fmap f (Node x leftsub rightsub) =
--     Node (f x) (fmap f leftsub) (fmap f rightsub)

class Tofu t where
  tofu :: j a -> t a j
  
data Frank a b = Frank {frankField :: b a} deriving (Show)

instance Tofu Frank where
  tofu x = Frank x








