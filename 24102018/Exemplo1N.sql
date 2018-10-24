-- Julio Vaz
/*
 Exemplo de criação de banco 1 para Muitos 1:N
 Com consulta inner join
*/

-- Criar banco de dados
CREATE DATABASE loja
-- usar banco de dados
use loja

-- criar table de vendas
CREATE TABLE tbVenda(
	idvenda integer not null primary key identity(1,1),
	data datetime
);
-- criar table de produtos
CREATE TABLE tbProduto(
	idproduto integer not null primary key identity(1,1),
	nomeproduto varchar(255),
	valor decimal (10,2)
)
-- criar table de venda produtos
CREATE TABLE tbVendaItem(
	idVendaItem integer not null primary key identity(1,1),
	vendaID integer FOREIGN KEY REFERENCES tbVenda(idvenda),
	ProdutoID integer FOREIGN KEY REFERENCES tbProduto(idProduto),
	qtd decimal(10,0)
)

INSERT INTO tbProduto(nomeproduto, valor) VALUES ('Sofá', 2.400),
('Computador',5.355),
('Televisão', 2.200),
('Mesa', 900),
('Estante', 3.100),
('xbox360', 800),
('ps4', 1.200),
('Mouse', 50),
('Teclado', 90)

SELECT * FROM tbProduto;

INSERT INTO tbVenda(data) VALUES (GETDATE()), (GETDATE()), (GETDATE()), (GETDATE()), (GETDATE())

SELECT * FROM tbVenda;

-- venda 1
INSERT INTO tbVendaItem(vendaID, ProdutoID, qtd) VALUES (1,1,5), (1,5,1), (1,4,3);
-- venda 2
INSERT INTO tbVendaItem(vendaID, ProdutoID, qtd) VALUES (2,6,4), (2,2,10), (2,3,5);
-- venda 3
INSERT INTO tbVendaItem(vendaID, ProdutoID, qtd) VALUES (3,8,1), (3,9,1), (3,2,1);

SELECT * FROM tbVendaItem;

 --- idvenda, qtd de produtos, total da venda
 
SELECT vi.vendaID as codigovenda FROM tbVendaItem as vi INNER JOIN tbVenda as tv ON vi.vendaID = tv.idvenda;