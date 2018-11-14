-- Júlio César Vaz 18846

CREATE DATABASE lojavirtualdb;
use lojavirtualdb;

-- table cliente
CREATE TABLE cliente(
	id integer not null primary key identity(1,1),
	nome varchar(255) not null,
	email varchar(255),
	cpf varchar(60) NOT NULL
)
-- table setor
CREATE TABLE setor(
	id integer not null primary key identity(1,1),
	desc_setor varchar(255)
)
-- table produtos
CREATE TABLE produtos(
	id integer not null primary key identity(1,1),
	desc_produto varchar(255),
	modelo varchar(255),
	setor integer foreign key references setor(id),
	valor decimal (5,2)
)
-- table venda
CREATE TABLE venda(
	id integer not null primary key identity(1,1),
	clienteID integer foreign key references cliente(id),
	produtoID integer foreign key references produtos(id),
	qtd integer,
	datavenda datetime default GETDATE()
);

 -- table cliente_has_produto
CREATE TABLE cliente_has_venda(
	id_cliente integer foreign key references cliente(id),
	id_venda integer foreign key references venda(id)
);

INSERT INTO setor(desc_setor) VALUES ('Eletrodomesticos'), ('Móveis'), ('Eletronicos'), ('Casa'), ('Decoracao'), ('Escritorio');

INSERT INTO cliente(nome, email, cpf) VALUES ('Júlio Vaz', 'julio.vaz@gmail.com', '132.465.789-75');

INSERT INTO produtos(desc_produto, modelo, setor, valor) VALUES ('xbox one S', 'S', 3, 17005.50);

INSERT INTO venda(clienteID, produtoID, qtd ,datavenda) VALUES (1,9,3,GETDATE());

INSERT INTO cliente_has_venda(id_cliente, id_venda) VALUES (1,1);


SELECT * FROM setor;

SELECT * FROM produtos;

SELECT * FROM venda;

SELECT * FROM cliente_has_venda;
--  
SELECT cli.nome, cli.cpf , prod.desc_produto, prod.modelo, prod.valor FROM cliente as cli INNER JOIN cliente_has_venda as cv ON cli.id = cv.id_cliente INNER JOIN produtos as prod ON prod.id = 9; -- foi colocado o 9 por causa do erro no insert do produto