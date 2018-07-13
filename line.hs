
{-
A program to draw a line in Haskell Language

Logic: Make two points
       Get an equation on line that can show points along the two points,
	   Vary the paramter in the equation in steps
	   Ploting points along the imaginary line based on the point formular-- makes a line 
WRITTEN BY: Okokoh B. JSKing!
date: Wed, 11th/7/2018
	   -}

import Graphics.UI.GLUT -- 
myPoints :: [(GLfloat,GLfloat,GLfloat)]
-- we shuld know that mathematically, m = (y2-y1)/(x2-x1) [SLOPE]
-- let y1 and x1 =0 --- line start at the zero origin 
-- therefore; m = y2/x2 ==> yy/xx
 -- line = mx + b; b = y intercept
 
 -- we can vary the x and y point here.. 
yy = 90
xx = 999


 -- process makes several points from point A - B
myPoints = [ ( (yy/b), (xx/b), 0) | b <- [1..100000] ]
 
main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  _window <- createWindow "Draw Funny lines from Points"
  displayCallback $= display
  mainLoop -- draw up to 1000 points: drop points along by increating the heights gradualy

display :: DisplayCallback
display = do 
  clear [ColorBuffer]
  renderPrimitive Points $
     mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
  flush
  