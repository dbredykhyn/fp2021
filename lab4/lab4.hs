
-- Лабораторна робота №4
    -- Студента групи КН-32 підгрупа 1
    -- Бредіхіна Дмитра
    -- Варіант №14

    -- Мета: Ознайомитись з системою типiв та класiв типiв.
    -- Набути досвiду визначення нових типiв та класiв типiв i їх використання.

module Lab4 where
    ----------------------------
    -- У записнику зберiгається iнформацiя про знайомих:
    -- телефон (iм’я, телефон — один, або кiлька),
    -- нагадування про день народження (iм’я, дата — день та мiсяць),
    -- зустрiчi (дата та час, мiсце, опис — тема зустрiчi, зауваження про зустрiч — чи вiдбулась та iнше).

    type Name = String
    type PhoneNumber = Int

    type Day = Int
    type Month = Int
    type Year = Int
    type Date = (Year, Month, Day)

    type Time = String
    type Description = String
    type Note = String


    data Record =
        PhoneRecord         Name [PhoneNumber]          |
        BirthdayReminder    Name Date                   |
        Meeting             Date Time Description Note
        deriving (Show, Eq)


    notebook = [
            PhoneRecord "Someone" [380960001212],
            Meeting (2018, 8, 14) "12:00" "No descr" "No note",
            BirthdayReminder "Someone2" (1998, 7, 24),
            PhoneRecord "Someone3" [380960001212, 380960002222],
            BirthdayReminder "Not Someone" (2002, 8, 12),
            PhoneRecord "Someone" [380960001212],
            Meeting (2021, 12, 1) "12:00" "No descr" "No note"
        ]



    -- Визначне функцiї для:
    -- зустрiчi на певний день
    meetingsAtDate :: Date -> [Record] -> [Record]
    meetingsAtDate d [] = []
    meetingsAtDate d (PhoneRecord _ _ : records) = meetingsAtDate d records
    meetingsAtDate d (BirthdayReminder _ _ : records) = meetingsAtDate d records
    meetingsAtDate d (m@(Meeting date _ _ _) : records)
        | d == date             = m : meetingsAtDate d records
        | otherwise             = meetingsAtDate d records

    -- або перiод;
    isInRange :: Date -> Date -> Date -> Bool
    isInRange lo hi d =
        lo <= d && d <= hi

    meetingsInRange :: Date -> Date -> [Record] -> [Record]
    meetingsInRange lo hi [] = []
    meetingsInRange lo hi (PhoneRecord _ _ : records) = meetingsInRange lo hi records
    meetingsInRange lo hi (BirthdayReminder _ _ : records) = meetingsInRange lo hi records
    
    meetingsInRange lo hi [m@(Meeting date _ _ _)]
        | isInRange lo hi date  = [m]
        | otherwise             = []
    meetingsInRange lo hi (m@(Meeting date _ _ _) : records)
        | isInRange lo hi date  = m : meetingsInRange lo hi (tail records)
        | otherwise             = meetingsInRange lo hi (tail records)



    -- Тестування:
    -- Prelude> :load lab4.hs 
    -- [1 of 1] Compiling Lab4             ( lab4.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab4> meetingsInRange (2020, 12, 12) (2040, 12, 12) notebook 
    -- [Meeting (2021,12,1) "12:00" "No descr" "No note"]
    -- *Lab4> meetingsAtDate (2018, 8, 14) notebook 
    -- [Meeting (2018,8,14) "12:00" "No descr" "No note"]


    -- Висновок:
    -- В результаті виконання лабораторної роботи було
    -- опрацьовано та набуто навичок по роботі та використанню
    -- системи типів функціональної мови програмування Haskell.
