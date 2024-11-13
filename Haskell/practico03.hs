--a retorna el primer elemento de una lista.
hd :: [a] -> a
hd (x:xs) = x
hd [] = error "lista vacia"

--retorna toda la lista menos el primer elemento.
tl :: [a] -> [a]
tl (x:xs) = xs
tl [] = error "lista vacia"

--retorna el  ́ultimo elemento de la lista.
last' :: [a] -> a
last' [] = error "lista vacia"
last' [a] = a -- si la lista tiene un solo elemento, vuelve ese elemento
last' (x:xs) = last' xs

--retorna toda la lista menos el  ́ultimo elemento.
init':: [a] -> [a]
init' [] = error "lista vacia"
init' [a] = []
init' (x:xs) = x : init' xs

--2 Defina una funcion que dada una lista, retorne la reversa de la misma.
reverss :: [a]->[a]
reverss [] = []
reverss (x:xs) = reverss xs ++ [x]

--3 Defina una funcion que dadas dos listas, decida si las listas son iguales.
iigual :: Eq a => [a]->[a] -> Bool
iigual [] [] = True --1) primer caso si las listas son iguales esto es true
iigual (x:xs) [] = False
iigual [] (y:ys) = False
iigual (x:xs) (y:ys) = x == y && iigual xs ys

--4. Defina una funcion que dada una lista decida si es un pal ́ındromo o no.
pal :: Eq a => [a] -> Bool
pal [] = True --1) si la lista es vacia 
pal [a] = True--2) si la lista tiene un solo elem
pal (x:xs) = x == last' xs && pal (init' xs)

pal2 :: Eq a => [a] -> Bool
pal2 xs =
    xs == reverss xs

--5. Defina una funcion que dado un numero natural, decida si el mismo esprimo o no. 
esPrimo :: Int -> Bool
esPrimo a
    | a < 2 = False
    | otherwise = null [x | x <- [2..a-1], a `mod` x == 0 ]

primN :: Int -> Bool
primN n
    | n <= 1 = False
    | length [x | x <- [1..n], mod n x == 0] == 2 = True
    | otherwise = False


--6. (*) Defina una funcion que dado un numero natural n, retorne la lista de
--todos los numeros naturales primos menores que n.
primosMenores :: Int -> [Int]
primosMenores n = [x | x <- [2..n-1], esPrimo x]

--7. (*) Defina una funcion que dada una lista de numeros, devuelva la lista
--solo con los numeros primos.
listaPrimos :: [Int] -> [Int]
listaPrimos [] = []
listaPrimos xs = filter esPrimo xs

--listPrimN :: Int -> [Int]
--listPrimN n
--        | n <= 1 = []
--        | otherwise = [x | x <- [1..n], primN x]

-- 8
cortar :: Int -> Int -> [Char] -> [Char]
cortar i j w = take (j-i+1) (drop i w)

-- 9 Escriba una funcion que dado un numero retorne la lista de sus dıgitos.        
digitos :: Int -> [Int]
digitos n
    |n < 0 = digitos (- (1 * n))
    |n < 10 = [n]
    |otherwise = digitos (div n 10) ++ [mod n 10]

--10 
-- Para compilar un programa en Haskell usando GHC:
-- 1. Guardar este archivo como practico03.hs
-- 2. Abrir terminal en el directorio del archivo
-- 3. Ejecutar: ghc practico03.hs
-- 4. Se generará un ejecutable practico03
-- 5. Ejecutar: ./practico03

main :: IO ()
main = do
  putStrLn "Ingrese una lista para verificar si es palíndromo:"
  input <- getLine
  let resultado = pal (read input :: [Int])
  putStrLn $ "Es palíndromo: " ++ show resultado



-- 11. Generar una lista infinita de unos.

infi :: [Int]
infi = 1 : infi

infi2 :: [Int]
infi2  = [1,1..]

--12. Generar una lista infinita de naturales comenzando desde un numero dado.
infNat :: Int->[Int]
infNat n = [n,n+1..]

infNat2 :: Int -> [Int]
infNat2 n = n : infNat2 (n + 1)

-- 13. Generar una lista con los primeros n naturales.
naT :: Int -> [Int]
naT n
    |n < 0 = error "es negativo"
    |otherwise = [1..n]

--14. (*) Retornar los primeros 5 elementos de una lista infinita de enteros positivos.
cincoN :: Int->[Int]
cincoN n
    |n < 0 = cincoN (- (1 * n))
    |otherwise = [n..n+5]

--Utilizando funciones de alto orden resolver:
--15. Dada una lista de enteros, retornar sus cuadrados, es decir, dado [x0, x1, . . . , xn] deberia retornar [x0^2, x1^2, x2^2, x3^2 ]
listEnteros :: [Int]->[Int]
listEnteros [] = error "es vacio"
listEnteros xs = map (^2) xs

--16. Dado un entero positivo, retornar la lista de sus divisores.
listDeri :: Int -> [Int]
listDeri n = [x | x <- [1..n], foldl mod n [x] == 0]

--17.Dada una lista de naturales, obtener la lista que contenga solo los numeros primos de la lista original.
listNaturales :: [Int] -> [Int]
listNaturales [] = []
listNaturales xs = filter esPrimo xs
    
--18. Dada una lista de enteros, retornar la lista de los cuadrados de los numeros primos de la lista original.
cuadrados :: [Int] -> Int
cuadrados (x:xs) = sum (map (^2) (x:xs))

--19 Dada una lista de naturales, retornar la lista con sus sucesores.
listSucesores :: [Int] -> [Int]
listSucesores (x:xs) = map (+1) [n | n <- (x:xs)]

--20 Dada una lista de enteros, sumar todos sus elementos.
sumaEnteros :: [Int] -> Int
sumaEnteros [] = 0
sumaEnteros (x:xs) = x + sumaEnteros xs
--suma de enteros usando fold
sumaEnteros2 :: [Int] -> Int
sumaEnteros2 xs = foldl (+) 0 xs

--suma de enteros usando foldr
sumaEnteros3 :: [Int] -> Int
sumaEnteros3 xs = foldr (+) 0 xs    

--21 Definir el factorial usando fold.
factorial :: Int -> Int
factorial n = foldl (*) 1 [1..n]

--22 Redefinir la funci ́on and tal que and xs se verifica si todos los elementos de xs son verdaderos.
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

--vamor hacer and usando fold
and'2 :: [Bool] -> Bool
and'2 xs = foldr (&&) True xs   

--vamor hacer and usando foldl
and'3 :: [Bool] -> Bool
and'3 xs = foldl (&&) True xs   

--vamos a hacer and usando foldr
and'4 :: [Bool] -> Bool
and'4 xs = foldr (&&) True xs   

--23 Usando foldl o foldr definir una funci ́on tam::[a]->Int que devuelve
--la cantidad de elementos de una lista dada. Dar un ejemplo en los cuales
--foldr y foldl evaluen diferente con los mismos parametros.
tam :: [a] -> Int
tam xs = foldr (\_ n -> n + 1) 0 xs

tam2 :: [a] -> Int
tam2 xs = foldl (\n _ -> n + 1) 0 xs

--Utilizando listas por comprensi ́on resolver:

--24. Dada una lista de enteros, retornar sus sucesores.
retSucesores :: [Int] -> [Int]
retSucesores (x:xs) = [x+1 | x <- (x:xs)]

--25(*) Dada una lista de naturales, retornar sus cuadrados.
retCuadrados :: [Int] -> [Int]
retCuadrados (x:xs) = [x^2 | x <- (x:xs)]

--26 Dada una lista de enteros, retornar los elementos pares que sean mayores a 10.
retPares :: [Int] -> [Int]
retPares (x:xs) = [x | x <- (x:xs), x > 10, even x]

retPares2 :: [Int] -> [Int]
retPares2 (x:xs) = [n | n <- x:xs, mod n 2 == 0, n > 10]

--27 Dado un entero, retornar sus divisores.
retDivisores :: Int -> [Int]
retDivisores n = [x | x <- [1..n], mod n x == 0]

{-28
Definir la funci ́on todosOcurrenEn :: Eq a => [a] -> [a] -> Bool
tal que todosOcurrenEn xs ys se verifica si todos los elementos de xs son
elementos de ys. Por ejemplo: todosOcurrenEn [1,5,2,5] [5,1,2,4] = True,
todosOcurrenEn [1,5,2,5] [5,2,4] = False
-}
todosOcurrenEn :: Eq a => [a] -> [a] -> Bool
todosOcurrenEn xs ys = all (`elem` ys) xs

--29. Dado un natural n, retornar los n ́umeros primos comprendidos entre 2 y n.
retornarPrimos :: Int -> [Int]
retornarPrimos n = [x | x <- [2..n], esPrimo x]

--30 Definir la lista infinita de los n ́umeros pares.
infiPares :: [Int]
infiPares = [n | n <-[0..], mod n 2 == 0]

--31. Dadas dos listas de naturales, retornar su producto cartesiano.
productoCartesiano :: [Int] -> [Int] -> [(Int, Int)]
productoCartesiano xs ys = [(x, y) | x <- xs, y <- ys]

--33. (*) Dadas una lista y un elemento retornar el n ́umero de ocurrencias del elemento x en la lista ys.
ocurrencias :: Eq a => a -> [a] -> Int
ocurrencias x ys = length [y | y <- ys, y == x]

--34. Escribir la funci ́on split2 :: [a] - > [([a],[a])], que dada una lista
--xs, devuelve la lista con todas las formas de partir xs en dos.
split2 :: [a] -> [([a],[a])]
split2 xs = [(take n xs, drop n xs) | n <- [0..length xs]]

--35.Definir una funci ́on que, dada una lista de enteros, devuelva la suma
--de la suma de todos los segmentos iniciales.
sumaSegmentos :: [Int] -> [Int]
sumaSegmentos xs = [sum (take n xs) | n <- [1..length xs]]

