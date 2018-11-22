CREATE DATABASE blackfriday;

use blackfriday;


CREATE TABLE setores(
	id integer not null primary key identity(1,1),
	desc_setor varchar(255)
)

CREATE TABLE produtos(
	id integer not null primary key identity(1,1),
	desc_produto varchar(255),
	valor_produto decimal(10,2),
	setorID integer foreign key references setores(id)
)

CREATE TABLE promocao(
	id_promocao integer not null primary key identity(1,1),
	produtoID integer foreign key references produtos(id),
	dtinicial datetime,
	dtfinal datetime,
	vlpromocao integer,
	vlproduto decimal(10,2)
)


INSERT INTO setores(desc_setor) VALUES ('Eletrodomesticos'), ('Vestuario'), ('Alimentos'), ('Esportivo'), ('Eletronicos'), ('Moveis');

INSERT INTO produtos(desc_produto, valor_produto, setorID) VALUES ('Celular Samsung Galaxy J4', 1000, 5);
INSERT INTO produtos(desc_produto, valor_produto, setorID) VALUES ('Televisão LG 89', 4999, 1);
INSERT INTO produtos(desc_produto, valor_produto, setorID) VALUES ('Roupa de couro', 200, 2);

SELECT * FROM produtos;

INSERT INTO promocao(produtoID,dtinicial,dtfinal,vlpromocao,vlproduto) VALUES (1, GETDATE(), DATEADD(HOUR, 1, GETDATE()), 25, (SELECT (sum((valor_produto)/100)*25) FROM produtos WHERE id = 1));

SELECT * FROM promocao;

select A.id, A.desc_produto, 
ISNULL((SELECT top 1 B.vlproduto from 
	   promocao B
	   where B.produtoID = A.id 
	   and B.dtinicial <= GETDATE() and B.dtfinal >= GETDATE()), A.valor_produto) from produtos A