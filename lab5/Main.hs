
-- Лабораторна робота №5
    -- Студента групи КН-32 підгрупа 1
    -- Бредіхіна Дмитра
    -- Варіант №14

    -- Мета: Ознайомитись з модульною органiзацiєю програм та засобами введення-виведення.
    -- Набути досвiду компiляцiї Haskell-програм.

module Main where
    import Prelude
    import System.IO
    import Lab3

    ----------------------------
    -- 5.2.1. Реалiзувати та скомпiлювати одну з програм,
    -- розроблених у лабораторнiй роботi No 3 для Вашого варiанта з введенням даних:
    -- та виведенням результатiв:
    -- а) з клавiатури,
    -- б) з файлу,
    -- в) на екран,
    -- г) у файл.

    readInt :: String -> Int
    readInt = read
    
    main = do
        putStrLn "Input string to get prelast element: "
        -- з клавіатури
        str <- getLine
        -- на екран
        putStrLn ("Result is: " ++ show(preLast str))

        -- з файлу
        input <- openFile "input.txt" ReadMode
        list <- hGetLine input
        -- у файл
        withFile "output.txt" WriteMode (\handle -> do
            hPutStrLn handle $ show(shift 5 list)
            hClose handle
            )


    -- Тестування:
    -- ghc Main.hs 
    -- [1 of 2] Compiling Lab3             ( Lab3.hs, Lab3.o )
    -- [2 of 2] Compiling Main             ( Main.hs, Main.o )
    -- Linking Main ...
    -- Main.exe
    -- Input string to get prelast element: 
    -- sjdghajhdgahjdasdsaad
    -- Result is: 'a'


    -- Висновок:
    -- В результаті виконання лабораторної роботи було
    -- опрацьовано та набуто навичок по роботі з модульною структурою
    -- програм та засобами вводу виводу функціональної мови програмування Haskell.