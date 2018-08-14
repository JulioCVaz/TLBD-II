/*CREATE DATABASE COMPRAS;



*/
/* pedido - produto - cliente */

USE COMPRAS;

CREATE TABLE cliente(
	id_cliente int NOT NULL PRIMARY KEY IDENTITY(0,1),
	nome_cliente varchar(255),
	cpf_cliente varchar(60),
	end_cliente varchar(255),
	tel_cliente varchar(60)
);

-- ALTER TABLE cliente ADD cpf_cliente varchar(60), end_cliente varchar(255), tel_cliente varchar(60);

SELECT * FROM cliente;


CREATE TABLE setor(
	id_setor int NOT NULL PRIMARY KEY IDENTITY(0,1),
	nome_setor varchar(255)
);

INSERT INTO setor(nome_setor) VALUES ('Eletrodomestico');

SELECT * FROM setor;


CREATE TABLE marca(
	id_marca int NOT NULL PRIMARY KEY IDENTITY(0,1),
	nome_marca varchar(255)
);

INSERT INTO marca(nome_marca) VALUES ('Samsung');

CREATE TABLE produto(
	id_produto int NOT NULL PRIMARY KEY IDENTITY(0,1),
	nome_produto varchar(255),
	marcaID int FOREIGN KEY REFERENCES marca(id_marca),
	setorID int FOREIGN KEY REFERENCES setor(id_setor)
);

INSERT INTO produto (nome_produto, marcaID, setorID, descricao_prod, validade_produto, valor_produto) values ('Samsung - Smart TV 49', 0, 0, 'Televisão ótima qualidade', 2028-08-10, 2159.00);

-- DELETE FROM produto WHERE id_produto = 0;

SELECT * FROM produto;


-- ALTER TABLE produto ADD descricao_prod varchar(255), validade_produto datetime, valor_produto decimal(10,2);

-- SELECT * FROM produto;

CREATE TABLE pedido(
	id_pedido int NOT NULL PRIMARY KEY IDENTITY(0,1),
	clienteID int FOREIGN KEY REFERENCES cliente(id_cliente),
	data_pedido date, --tipo deve ser datetime
	valor_total money,
	valor_desconto money,
	valor_final money
);

INSERT INTO pedido(clienteID, data_pedido, valor_total, valor_desconto, valor_final) VALUES (0,GETDATE(), 2159.00, 0.00, 2159.00);

CREATE TABLE pedidoProduto(
	pedidoID int FOREIGN KEY REFERENCES pedido(id_pedido),
	produtoID int FOREIGN KEY REFERENCES produto(id_produto),
	qtdProduto int NOT NULL
);

INSERT cliente (nome_cliente,cpf_cliente, end_cliente, tel_cliente) VALUES ('Júlio', '123.456.789-50', 'Avenida Aguia de Haia', '(11)98065-1215');

SELECT * FROM pedidoProduto;