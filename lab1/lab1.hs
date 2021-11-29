module Lb1 where
-- Лабораторна робота №1
-- студента групи КН-32
-- підгрупи 2
-- Бредіхін Дмитро
-- Варіант №29
-- Завдання 1. Наведiть приклади виразiв вказаного типу. 
-- Кожен список має мiстити кiлька елементiв. 
-- Перегляньте тип прикладiв, як їх визначає ghci. Прокоментуйте.
-- [([Double],(Bool,Char),Integer)]

--1
h :: [(Double, (Bool, Char), Integer )] 
h = [(10.0, (3==3, 'a'), 13)]

--2
--Функцiя за довжиною чотирьох вiдрiзкiв визначає, чи можна на них
--побудувати прямокутник.

func1 :: (Double, Double, Double, Double) -> Bool

func1 (a,b,c,d) | (a==b) && (c==d) ||
                (a==c) && (b==d) ||
                (b==c) && (a==d) = True | otherwise = False

func2 :: Double -> Double -> Double -> Double -> Bool 

func2 a b c d | (a==b) && (c==d) ||
                (a==c) && (b==d) ||
                (b==c) && (a==d) = True | otherwise = False


