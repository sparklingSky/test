SELECT DISTINCT
  K.model
FROM PC AS K

JOIN PC AS M
  ON K.speed = M.speed

JOIN Product AS P1
  ON M.model = P1.model

JOIN Laptop AS D
  ON K.hd = D.hd

JOIN Product AS P2
  ON D.model = P2.model
  AND P1.maker = P2.maker

JOIN Laptop AS O
  ON K.ram = O.ram
  AND O.screen = D.screen - 3

JOIN Printer AS V
  ON K.price = V.price
  AND LEN(O.model) > 2
  AND LEN(V.model) > 2
  AND SUBSTRING(O.model, 1, 2) = SUBSTRING(V.model, 1, 2)
  AND SUBSTRING(O.model, 3, 1) <> SUBSTRING(V.model, 3, 1)
  AND SUBSTRING(O.model, 4, LEN(O.model)) = SUBSTRING(V.model, 4, LEN(V.model))
  AND LEN(O.model) = LEN(V.model)

JOIN Printer AS T
  ON T.color = V.color
  AND T.type <> V.type
  AND T.price = M.price / 4
  
