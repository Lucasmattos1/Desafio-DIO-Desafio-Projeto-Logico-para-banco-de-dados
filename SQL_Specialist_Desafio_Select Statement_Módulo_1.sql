-- Perguntas sobre Clientes e Pedidos
-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idClient, concat(Fname,' ', Lname) as Nome, COUNT(o.idOrder) AS total_pedidos
FROM Clients c
INNER JOIN Orders o ON c.idClient = o.idOrder
GROUP BY c.idClient, Nome;

-- Quais são os pedidos (com detalhes) de um cliente específico?
SELECT o.idOrder, o.OrderDescription, o.SendValue, p.Pname AS produto, po.PoQuantity
FROM Orders o
INNER JOIN ProductOrder po ON o.idOrder = po.idPOproduct
INNER JOIN Product p ON po.idPOproduct = p.idProduct
WHERE o.idOrderClient = 1; 


-- Perguntas sobre Produtos
-- Quais produtos estão associados a cada pedido?
SELECT o.idOrder, p.Pname AS Nome_do_produto, po.PoQuantity as Quantidade
FROM Orders o
INNER JOIN ProductOrder po ON o.idOrder = po.idPOproduct
INNER JOIN Product p ON po.idPOproduct = p.idProduct;


-- Quais são os detalhes dos produtos em estoque em cada local de armazenamento?
SELECT p.Pname AS Produto, ps.Quantity, ps.StorageLocation
FROM Product p
INNER JOIN ProductStorage ps ON p.idProduct = ps.idProdStorage;

desc ProductOrder;
desc Orders;
desc Product;
desc ProductStorage;

-- Quais produtos são fornecidos por cada fornecedor?
SELECT s.SocialName AS Fornecedor, p.Pname AS Produto
FROM Supplier s
INNER JOIN ProductSupplier ps ON s.idSupplier = ps.idPsSupplier
INNER JOIN Product p ON ps.idPsProduct = p.idProduct;

-- Perguntas sobre Vendedores
-- Quais produtos são vendidos por cada vendedor?
SELECT s.SocialName AS fornecedor, p.Pname AS produto
FROM Supplier s
INNER JOIN ProductSupplier ps ON s.idSupplier = ps.idPsSupplier
INNER JOIN Product p ON ps.idPsProduct = p.idProduct;

-- Quantos produtos cada vendedor vendeu?
SELECT se.idSeller, se.SocialName, SUM(po.PoQuantity) AS Total_de_Produtos
FROM Seller se
INNER JOIN ProductSeller ps ON se.idSeller = ps.idPseller
INNER JOIN ProductOrder po ON ps.idPseller = po.idPOorder
JOIN Product p ON po.idPOproduct = p.idProduct
GROUP BY se.idSeller, se.SocialName;


-- Quais são os detalhes das vendas de um vendedor específico?
SELECT se.SocialName AS vendedor, o.idOrder, p.Pname AS Produto, po.PoQuantity as Quantidade
FROM Seller se
INNER JOIN ProductSeller ps ON se.idSeller = ps.idPseller
INNER JOIN ProductOrder po ON ps.idPseller = po.idPOproduct
INNER JOIN Orders o ON po.idPOproduct = o.idOrder
INNER JOIN Product p ON po.idPOproduct = p.idProduct
WHERE se.idSeller = 1;  -- Id do vendedor desejado


-- Perguntas sobre Pagamentos
-- Quais são os métodos de pagamento usados em cada pedido?
SELECT o.idOrder, p.TypePaymment as Forma_de_Pagamento
FROM Orders o
INNER JOIN Payments p ON o.idOrder = p.idPayOrder;


-- Quais pedidos foram pagos com um método de pagamento específico?
SELECT o.idOrder, c.Fname, p.TypePaymment
FROM Orders o
INNER JOIN Payments p ON o.idOrder = p.idPayOrder
INNER JOIN Clients c ON o.idOrderClient = c.idClient
WHERE p.TypePaymment = 'Cartão';  -- método desejado de pagamento

-- Perguntas sobre Fornecedores e Localização de Armazenamento
-- Quais fornecedores fornecem produtos para um determinado local de armazenamento?
SELECT sl.Location, s.SocialName AS fornecedor, p.Pname AS produto
FROM StorageLocation sl
INNER JOIN ProductStorage ps ON sl.idLstorage = ps.idProdStorage
INNER JOIN Product p ON ps.idProdStorage = p.idProduct
INNER JOIN ProductSupplier psup ON p.idProduct = psup.idPsProduct
INNER JOIN Supplier s ON psup.idPsSupplier = s.idSupplier
WHERE sl.Location = 'RJ'; 

-- Qual é a quantidade total de cada produto em todos os locais de armazenamento?
SELECT p.Pname AS produto, SUM(ps.quantidade) AS quantidade_total
FROM Product p
INNER JOIN productstorage ps ON p.id_produto = ps.id_produto
GROUP BY p.nome;

-- Quais são os pedidos que contêm um determinado produto?
SELECT o.idOrder, c.Fname AS Cliente, p.Pname AS Produto, po.PoQuantity
FROM Orders o
INNER JOIN Clients c ON o.idOrderClient = c.idClient
INNER JOIN ProductOrder po ON o.idOrder = po.idPOorder
INNER JOIN Product p ON po.idPOproduct = p.idProduct
WHERE p.Pname = 'Fone de Ouvido';  -- nome do produto desejado

-- Qual é a quantidade total fornecida por cada fornecedor para um determinado produto?
SELECT s.SocialName AS Fornecedor, p.Pname AS Produto, SUM(ps.Quantity) AS Quantidade_total
FROM Supplier s
INNER JOIN ProductSupplier psup ON s.idSupplier = psup.idPsSupplier
INNER JOIN Product p ON psup.idPsProduct = p.idProduct
INNER JOIN ProductStorage ps ON p.idProduct = ps.idProdStorage
WHERE p.Pname = 'Fone de Ouvido'  -- nome do produto desejado
GROUP BY s.SocialName, p.Pname;

-- Quais são os fornecedores de cada produto e onde esses produtos estão armazenados?
SELECT p.Pname AS Produto, s.SocialName AS Fornecedor, sl.Location, ps.Quantity
FROM Product p
INNER JOIN ProductSupplier psup ON p.idProduct = psup.idPsSupplier
INNER JOIN Supplier s ON psup.idPsSupplier = s.idSupplier
INNER JOIN ProductStorage ps ON p.idProduct = ps.idProdStorage
INNER JOIN StorageLocation sl ON ps.idProdStorage = sl.idLproduct;

-- Quais clientes fizeram mais de um pedido?
SELECT c.idClient, c.Fname as Nome_Cliente, COUNT(o.idOrder) AS total_pedidos
FROM Clients c
JOIN Orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname
HAVING COUNT(o.idOrder) > 1;

-- Quais produtos têm uma quantidade total em estoque abaixo de 50 unidades
SELECT p.idProduct, p.Pname as Produto, SUM(ps.Quantity) AS Total_Estoque
FROM Product p
JOIN ProductStorage ps ON p.idProduct = ps.idProdStorage
GROUP BY p.idProduct, p.Pname
HAVING SUM(ps.Quantity) < 50;