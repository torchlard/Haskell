data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

data Direction = L | R deriving (Show)
-- type Directions = [Direction]

-- type Breadcrumbs = [Direction]
type Breadcrumbs a = [Crumb a]
data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)


freeTree :: Tree Char  
freeTree =   
    Node 'P'  
        (Node 'O'  
            (Node 'L'  
                (Node 'N' Empty Empty)  
                (Node 'T' Empty Empty)  
            )  
            (Node 'Y'  
                (Node 'S' Empty Empty)  
                (Node 'A' Empty Empty)  
            )  
        )  
        (Node 'L'  
            (Node 'W'  
                (Node 'C' Empty Empty)  
                (Node 'R' Empty Empty)  
            )  
            (Node 'A'  
                (Node 'A' Empty Empty)  
                (Node 'C' Empty Empty)  
            )  
        )  

-- changeToP :: Directions-> Tree Char -> Tree Char  
-- changeToP (L:ds) (Node x l r) = Node x (changeToP ds l) r  
-- changeToP (R:ds) (Node x l r) = Node x l (changeToP ds r)  
-- changeToP [] (Node _ l r) = Node 'P' l r         


-- elemAt :: Directions -> Tree a -> a
-- elemAt (L:ds) (Node _ l _) = elemAt ds l
-- elemAt (R:ds) (Node _ _ r) = elemAt ds r
-- elemAt [] (Node x _ _) = x

-- ============
-- Record direction it moved to

goLeft :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goLeft (Node x l r, bs) = (l, LeftCrumb x r:bs)

goRight :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goRight (Node x l r, bs) = (r, RightCrumb x l:bs)

goUp :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goUp (t, LeftCrumb x r:bs) = (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = (Node x l t, bs)


x -: f = f x

type Zipper a = (Tree a, Breadcrumbs a)

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node x l r, bs) = (Node (f x) l r, bs)
modify f (Empty, bs) = (Empty, bs)

attach :: Tree a -> Zipper a -> Zipper a
attach t (_, bs) = (t, bs)

topMost :: Zipper a -> Zipper a
topMost (t, []) = (t, [])
topMost z = topMost (goUp z)

-- ======================
type ListZipper a = ([a],[a])  

goForward :: ListZipper a -> ListZipper a
goForward (x:xs, bs) = (xs, x:bs)

goBack :: ListZipper a -> ListZipper a
goBack (xs, b:bs) = (b:xs, bs)



main = do
    -- putStrLn $ show $ goLeft $ goLeft $ goRight (freeTree, [])
    -- putStrLn $ show $ (freeTree, []) -: goRight -: goLeft
    -- let newfocus = modify (\_ -> 'P') (goRight $ goLeft (freeTree, []))
    -- let farLeft = (freeTree, []) -: 
    -- putStrLn $ show $ modify (\_ -> 'X') (goUp $ goUp newfocus)
    let xs = [1,2,3,4]
    putStrLn $ show $ goBack $ goForward $ goForward (xs, [])

    







