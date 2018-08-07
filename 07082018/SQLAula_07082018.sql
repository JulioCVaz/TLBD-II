
/*Crição de view para consulta no banco de dados*/
CREATE VIEW vwDocumentoPessoa
as 

SELECT tbDoc.nrRG, tbPe.nomePessoa FROM dbo.TbPessoa as tbPe INNER JOIN dbo.tbDocumentoPessoa as tbDoc on tbPe.cdPessoa = tbdoc.cdPessoa;

/*Editar dados da VIEW - ALTER VIEW vwDocumentoPessoa*/ 

/*Criar banco de dados*/
CREATE DATABASE CidadeInteligente;

/*Criar tabela pessoa*/
CREATE TABLE dbo.TbPessoa(
	cdPessoa int NOT NULL PRIMARY KEY IDENTITY(0,1),
	nomePessoa varchar(255),
	nrTelefone char(11),
	nrCelular char(11),
	enderecoPessoa varchar(255),
	nrCep char(15)	
);
/*Criar tabela Documento Pessoa*/
CREATE TABLE dbo.tbDocumentoPessoa(
	cdDocumentoPessoa int NOT NULL PRIMARY KEY identity(0,1),
	cdPessoa int NOT NULL FOREIGN KEY REFERENCES dbo.TbPessoa(cdPessoa),
	nrRG char(11),
	nfCPF char(11),
	nrReservista varchar(211)
);
/*usar banco*/
USE CidadeInteligente;


/*Inserir dados na tabela pessoa*/
INSERT INTO dbo.TbPessoa(nomePessoa, nrTelefone, nrCelular, enderecoPessoa, nrCep) 
VALUES ('Júlio César', '1120353358', '11958138581', 'Rua Manoel dos Santos', '08564-540'),
('Martina Luiza', '1120205689', '11988652365', 'Rua Afonso lopes de baiao', '05001-123'),
('Joao Pedro', '1120353358', '11958138581', 'Rua Manoel dos Santos', '08564-540')

SELECT * FROM dbo.TbPessoa;

/*Inserir dados na tabela Documento*/
INSERT INTO dbo.tbDocumentoPessoa(cdPessoa, nrRG, nfCPF, nrReservista) VALUES (2, '36660013-5', '44856485975', '132.456.789.11')

SELECT * FROM dbo.tbDocumentoPessoa;

SELECT * FROM vwDocumentoPessoa;




/* 

** Salvar sem a query de recriação

Ferramentas > Opções > Designer > (Desabilitar) - Evitar salvar alterações que exijam recriação

*/