-- Interroga la tabella dei prodotti DimProduct ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag.
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag
FROM dimproduct;

-- Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag
FROM dimproduct
where FinishedGoodsFlag = 1;

-- Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello ProductAlternateKey comincia con FR oppure BK. Il result set deve contenere il codice prodotto ProductKey, il modello, il nome del prodotto, il costo standard StandardCost e il prezzo di listino ListPrice.
select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice
FROM dimproduct
where ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

-- Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda (ListPrice - StandardCost)
select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as Markup
FROM dimproduct
where ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

-- Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.
Select ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, FinishedGoodsFlag, ListPrice - StandardCost AS MARKUP
from dimproduct 
where FinishedGoodsFlag = 1 and ListPrice between 1000 and 2000;

-- Esplora la tabella degli impiegati aziendali DimEmployee
select *
from dimemployee;

-- Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.
select *
from dimemployee
where SalesPersonFlag = 1;

-- Interroga la tabella delle vendite (FactResellerSales). Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).
select *, SalesAmount - TotalProductCost as Profit
from factresellersales
WHERE OrderDate >= '2020-01-01'
AND ProductKey IN (597, 598, 477, 214);