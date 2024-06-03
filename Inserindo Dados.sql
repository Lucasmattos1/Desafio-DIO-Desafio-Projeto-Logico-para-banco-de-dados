-- Inserindo dados na tabela
-- idClient, Fname, Lname, CPF, Address
use ecommerce;
desc Clients;
insert into Clients (Fname, Lname, CPF, Address) 
		values ('Maria', 'Oliveira', 34609812367, 'Rua Silva Prata 29, Santa Júlia - Embu das Artes'),
				('Adriano', 'Souza', 14587509801, 'Rua Moreira Peixoto 268, Freguesia do Ó - São Paulo'),
                ('Paula', 'Nascimento', 13798400998, 'Rua Barbacena Neto 24, Copabana - Rio de Janeiro'),
                ('Nathan', 'Silvestri', 45923897099, 'Rua Almirantes Nigro 2457, Itabira - Minas Gerais'),
                ('Ricardo', 'Pereira', 45387590896, 'Rua dos Cavalcantis 204, Manaus - Amazonas');


-- Tabela Produto
-- idProduct, Pname, Classification_Kids, Category, Avaliação
insert into Product (Pname, Classification_Kids, Category, Avaliação) 
		values ('Fone de Ouvido', false, 'Eletrõnico', '4'),
				('Barbie', true, 'Brinquedos', '3'),
                ('Microfone Vedo', false, 'Eletrõnico', '4'),
                ('Farinha de Arroz', false, 'Alimentos', '2'),
                ('Fire Stick Amazon', false, 'Eletrõnico', '3'),
                ('Body Carters', true, 'Vestimenta', '5'),
                ('Sofá retrátil', false, 'Móveis', '3');

-- Tabela Pedido
-- idOrder, idOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash
insert into Orders (idOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash) 
		values (1, default, 'Compra via Aplicativo', null, 1),
				(2, default, 'Compra via Aplicativo', 50, 1),
                (3, 'Confirmado', null, null, 1),
                (4, default, 'Compra via Web site', 150, 1);
        


-- tabela ProductOrder
-- idPOproduct, idPOorder, PoQuantity, PoStatus
insert into ProductOrder (idPOproduct, idPOorder, PoQuantity, PoStatus) 
					values (1,1,2,null),
							(2,1,1,null),
                            (3,2,1,null);

-- tabela Estoque
-- idProdStorage, StorageLocation, Quantity
insert into ProductStorage (StorageLocation, Quantity) 
					values ('Rio de Janeiro', 1000),
							('Rio de Janeiro', 50),
                            ('São Paulo', 10),
                            ('São Paulo', 100),
                            ('São Paulo', 10),
                            ('São Paulo', 10),
                            ('Brasília', 60);
        
-- tabela StorageLocation
-- idLproduct, idLstorage, Location
insert into StorageLocation (idLproduct, idLstorage, Location)
					 values (1,2,'RJ'),
							(2,6,'GO');
                     
-- tabela Fornecedor
-- idSupplier, SocialName, CNPJ, Contact
insert into Supplier (SocialName, CNPJ, Contact)
					 values ('Almeida e Filhos', 245790385902365,46680934),
							('Eletrõnicos Silva', 58690235009574,55679089),
                            ('Eletrõnicos Supera', 200944859923461,52098872);
    
    
 -- tabela ProductSupplier
-- idPsSupplier, idPsProduct, Quantity   
    insert into ProductSupplier (idPsSupplier, idPsProduct, Quantity)
					 values (1,1,500),
							(1,2,400),
							(2,4,633),
                            (3,3,5),
                            (2,5,10);



-- tabela Vendedor
-- idSeller, SocialName, AbstName, CNPJ, CPF, Localtion, Contact
insert into Seller (SocialName, AbstName, CNPJ, CPF, Localtion, Contact)
					 values ('Tech Eltronics', null, 123456789456321, null, 'Rio de Janeiro', 21349984),
							('Botique Buergas', null, 348909944572346, 13458909032, 'Rio de Janeiro', 21335589),
                            ('Kids World', null, 258903759015869, null, 'São Paulo', 55759982);
							
-- tabela ProductSeller
-- idPseller, idPproduct, ProdQuantity
insert into ProductSeller (idPseller, idPproduct, ProdQuantity)
					 values (1,6,80),
							(2,7,10);
  -- tabela Payments      
  -- idPayOrder, TypePaymment, LimitAvailable
INSERT INTO Payments (idPayOrder, TypePaymment, LimitAvailable) VALUES (1, 'Cartão', 1000);
INSERT INTO Payments (idPayOrder, TypePaymment, LimitAvailable) VALUES (2, 'Pix', 0);


insert into Orders (idOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash) 
		values (2, default, 'Compra via Aplicativo', 10, 1);

							







