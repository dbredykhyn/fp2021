
-- Лабораторна робота №2
    -- Студента групи КН-32 підгрупа 1
    -- Бредіхіна Дмитра
    -- Варіант №14

    -- Мета: Набути досвiду визначення рекурсивних функцiй,
    -- використання механiзму зiставлення зi зразком i роботи з кортежами та списками.

module Lab2 where

    ----------------------------
    -- Завдання 1
    
    -- Замiнити кожен n-й елемент списку вказаним значенням, напр. при
    -- n=2 та значеннi ’z’: "1234590" ⇒ "1z3z5z0".

    -- З застосуванням вбудованих функцій:
    
    replaceNth :: Int -> k -> [k] -> [k]
    replaceNth n value str = 
        let zipped = zip [1..] str
        in map (\(idx, val) -> if rem idx 3 == 0 then value else val) zipped
    
    -- Без застосування вбудованих функцій:
    ownMap :: (a -> k) -> [a] -> [k]
    ownMap _ [] = []  
    ownMap f (x:xs) = f x : ownMap f xs

    replaceNth2 :: Int -> k -> [k] -> [k]
    replaceNth2 n value str = 
        let zipped = zip [1..] str
        in ownMap (\(idx, val) -> if rem idx 3 == 0 then value else val) zipped


    -- Тестування:
    -- Prelude> :load lab2/lab2.hs 
    -- [1 of 1] Compiling Lab2             ( lab2/lab2.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab2> replaceNth 3 'z' "abcdefghijklmnop"
    -- "abzdezghzjkzmnzp"
    -- *Lab2> replaceNth2 2 '0' "ajkwgawdawdawdawdawdaw"
    -- "aj0wg0wd0wd0wd0wd0wd0w"


    ----------------------------
    -- Завдання 2

    -- Знайти два простi числа, сума яких дорiвнює заданому парному
    -- N ≥ 2 (бiнарна проблема/гiпотеза Ґольдбаха).

    factors :: Int -> [Int]
    factors n = [x | x <- [1..n], mod n x == 0]

    isPrime :: Int -> Bool
    isPrime n = factors n == [1,n]

    primes :: [Int]
    primes = [x | x <- [2..], isPrime x]
    
    -- З застосуванням вбудованих функцій:
    goldbach :: Int -> (Int, Int)
    goldbach 2 = (1, 1)
    goldbach n = head [(x, y) | x <- primes, let y = n-x, isPrime y]

    -- Без застосування вбудованих функцій:
    ownHead :: [a] -> a
    ownHead (x:_) = x

    goldbach2 :: Int -> (Int, Int)
    goldbach2 2 = (1, 1)
    goldbach2 n = ownHead [(x, y) | x <- primes, let y = n-x, isPrime y]


    -- Тестування:
    -- Prelude> :load lab2/lab2.hs 
    -- [1 of 1] Compiling Lab2             ( lab2/lab2.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab2> goldbach 18
    -- (5,13)
    -- *Lab2> goldbach2 44
    -- (3,41)


    -- Висновок:
    -- В результаті виконання лабораторної роботи було створено два
    -- варіанти для двох функцій (з використанням вбудованих функцій, та без)
    -- відповідно з заданим варіантом роботи.
    -- Це дозволило закріпити знання та набути практичних навичок
    -- по використанню pattern matching, lambda functions та guards 
    -- функціональної мови програмування haskell.
