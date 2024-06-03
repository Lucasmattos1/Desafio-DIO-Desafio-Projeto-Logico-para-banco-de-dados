-- Criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table Clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
);
        ALTER TABLE Clients MODIFY COLUMN Address VARCHAR(60);


-- criar tabela produto

create table Product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        Classification_Kids bool default false,
        Category enum('Eletrônico', 'Vestimenta', 'Brinquedos','Alimentos', 'Móveis') not null,
        Avaliação float default 0
);
ALTER TABLE Product MODIFY COLUMN Pname VARCHAR(20);

-- Para ser continuado no desafio: termine de implementar a tabela e crie a conexão
create table Payments(
	idPayment INT PRIMARY KEY AUTO_INCREMENT,
    idPayOrder int,
    TypePaymment enum('Boleto', 'Cartão', 'Pix'),
    LimitAvailable float,
    constraint fk_payment_orders foreign key (idPayOrder) references Orders(idOrder)
);


-- criar tabela pedido

create table Orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
    OrderDescription varchar(255),
    SendValue float default 10,
    PaymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references Clients(idClient)
			on update cascade
);
    
    
-- criar tabela Estoque
create table ProductStorage(
	idProdStorage int auto_increment primary key,
	StorageLocation varchar(255),
    Quantity int default 0
);


-- criar tabela Fornecedor
create table Supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
-- criar tabela Vendedor
drop table Seller;
create table Seller(
	idSeller int auto_increment primary key,
	SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15) not null,
    CPF char(11),
    Localtion varchar(255),
    Contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ)
);

-- criar tabela 
create table ProductSeller(
	idPseller int,
    idPproduct int,
    ProdQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references Seller(idSeller),
	constraint fk_product_product foreign key (idPproduct) references Product(idProduct)
);

create table ProductOrder(
	idPOproduct int,
    idPOorder int,
    PoQuantity int default 1,
    PoStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references Product(idProduct),
	constraint fk_productorder_product foreign key (idPOorder) references Orders(idOrder)
);

create table StorageLocation(
	idLproduct int,
    idLstorage int,
    Location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references Product(idProduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references ProductStorage(idProdStorage)
);

create table ProductSupplier(
	idPsSupplier int,
    idPsProduct int,
    Quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references Supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references Product(idProduct)
);

show tables;
use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
    
	
