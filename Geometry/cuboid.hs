module Geometry.Cuboid (
  volume,
  area
)

volume :: Float -> Float -> Float -> Float
volume a b c = rectangleArea a b*c

area :: Float -> Float -> Float -> Float
area a b c = rectangleArea a b*2 + rectangleArea b c*2 + rectangleArea c a*2

-- helper function, not exported
rectangleArea :: Float -> Float -> Float
rectangleArea a b = a*b
