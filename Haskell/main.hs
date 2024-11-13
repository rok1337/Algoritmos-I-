--7 Defina una funcion abs: Int -> Int que calcula el valor absoluto de unnumero. Realice una definici ́on por casos.
abs :: Int -> Int
abs x
    | x >= 0 = x
    | otherwise = -x


{- 8 Defina una funcion que dada una lista de numeros, retorne la suma de sus
 elementos. Realice una definicion por casos utilizando pattern matching.-}

suma :: [Int]->[Int] -> Int
suma [] []         = 0
suma [] (y:ys)     = y + suma [] ys
suma (x:xs) []     = x + suma xs []
suma (x:xs) (y:ys) = x + y + suma xs ys

{-9. Escriba una funcion currificada que dado dos numeros x e y ,
 calcule x^y Escriba el perfil de la funcion.-}

dosNum :: Int -> Int ->  Int
dosNum x y = x ^ y

{-10. Defina una funcion que calcule la potencia de 2 usando la funcion curri-
ficada definida en 9. Es decir dado el n ́umero x, la funci ́on debe calcular 2^x-}

potDos :: Int -> Int 
potDos x = 2 ^ x

{-11. Escriba, usando currificacion, una funcion que sume tres numeros. Escriba
el perfil de la funcion.-}

sumaTres :: Int -> Int -> Int -> Int
sumaTres x y z = x + y + z


{-12. Defina una funci ́on que suma 4 a otros dos n ́umeros, utilizando la funci ́on
definida en 11 . Luego aplique la funci ́on a los siguientes valores y analice
la salida.
> addFour 5 8-}

addFour :: Int -> Int -> Int -> Int 
addFour y x z = y + x + z

{-13. Analice el siguiente programa que dado un arreglo y la cantidad de elementos a explorar,
 retorna True si todos los elementos del mismo son 0, Falso en caso contrario.-}
 
zeros :: (Eq a, Num a) => [a] -> Int -> Bool
zeros a 0 = True
zeros a n = zeros a (n -1) && ( a !!( n -1) == 0)
--Eq : soporta comparacion por igualdad. se puede usar == y /=
-- => : separa las restricciones de tipo de la funcion
-- Ord : cubre todas las funciones de comparacion, <, >, >=, <=
--show : perimite representar sus elementos como cadenas
-- num: es la clase de tipo numericos, Sus miembros tienen la propiedad de poder comportarse como números. 
--(Int, Integer, Float, Double) Para unirse a Num, un tipo debe ser amigo de Show y eq

--resultado de:
--zeros [0,2,0] 3 false 
--zeros [0,0,3] 2 true
--zeros [0,0,0,0] 4 true

{-El siguiente codigo implementa la misma funcionalidad, es decir retorna 
True si todos los elementos del mismo son 0.-}

zeroes :: (Eq a, Num a) => [a] -> Bool
zeroes [] = True
zeroes ( a : as ) = zeroes as && ( a == 0)

{-14. (*)Dada la siguiente funci ́on que calcula el factorial de un n ́umero dado.-}
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial ( n - 1)
--factorial 1 es 1
--factorial 3 es 6
--facotiral 5 es 120


{-15. Determine que realiza la siguiente funcion.-}
belongs :: Eq a => a -> [a] -> Bool
belongs e [] = False
belongs e ( a : as ) = belongs e as || ( a == e )


{-16. Escriba un programa que calcule el n-esimo valor en la sucessi ́on de fibonacci. 
La sucesi ́on de Fibonacci se trata de una serie infinita de numeros
naturales que empieza con un 0 y un 1 y continua a ̃nadiendo numeros que
son la suma de los dos anteriores:-}
fibo :: Int -> Int 
fibo n 
    |n == 0 = 0
    |n == 1 = 1
 --   |otherwise n = n(n-1) + n(n+2)
