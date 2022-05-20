-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
select Name
from Client join Package P on Client.AccountNumber = P.Recipient
where P.Weight = 1.5;
-- 7.2 What is the total weight of all the packages that he sent?
select sum(P.Weight)
from Client join Package P on Client.AccountNumber = P.Recipient
where Client.Name = 'Al Gore''s Head';