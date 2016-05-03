create database GPBrasilAtletismo
go
use GPBrasilAtletismo

-- Definir o DATETIME como BR

SET DATEFORMAT dmy

-- Criação de Tabelas --

CREATE TABLE Paises(
sigla char(3) primary key,
nome varchar(50))

go
Create table Atleta(
numeracao int primary key identity(1,1), 
nome varchar(100), 
sexo char(1),
codigo_Pais char(3)
foreign key(codigo_Pais) references Paises)

CREATE TABLE Prova(
	id INT IDENTITY PRIMARY KEY,
	tipo_prova INT, -- Define o tipo de Prova (1 - Salto e Arremesso, 2 - Corrida)
	nome VARCHAR(50),
	sexo CHAR(1)
)

CREATE TABLE Recordes
(
	id_prova INT,
	tipo_recorde INT, -- Define o tipo de Recorde (1 - Mundial, 2 - do Evento)
	marca_recorde VARCHAR(12),
	nome_atleta VARCHAR(100),
	pais_atleta CHAR(3),
	local_recorde VARCHAR(30),
	data_recorde DATETIME
	PRIMARY KEY (id_prova, tipo_recorde)
	FOREIGN KEY (id_prova) REFERENCES Prova
)

DROP TABLE Bateria_SA_Inicial
DROP TABLE Bateria_SA_Final
DROP TABLE Bateria_RUN_Inicial
DROP TABLE Bateria_RUN_Final

CREATE TABLE Bateria_SA_Inicial
(
	id_prova INT,
	numeracao_atleta INT,
	t1 VARCHAR(7), -- t -> referente a tentativa
	t2 VARCHAR(7),
	t3 VARCHAR(7),
	t4 VARCHAR(7),
	t5 VARCHAR(7),
	t6 VARCHAR(7),
	resultado DECIMAL(6,3)
	PRIMARY KEY (id_prova, numeracao_atleta)
	FOREIGN KEY (id_prova) REFERENCES Prova,
	FOREIGN KEY (numeracao_atleta) REFERENCES Atleta
)

CREATE TABLE Bateria_SA_Final
(
	id_prova INT,
	numeracao_atleta INT,
	t1 VARCHAR(7), -- t -> referente a tentativa
	t2 VARCHAR(7),
	t3 VARCHAR(7),
	t4 VARCHAR(7),
	t5 VARCHAR(7),
	t6 VARCHAR(7),
	resultado DECIMAL(6,3)
	PRIMARY KEY (id_prova, numeracao_atleta)
	FOREIGN KEY (id_prova) REFERENCES Prova,
	FOREIGN KEY (numeracao_atleta) REFERENCES Atleta
)

CREATE TABLE Bateria_RUN_Inicial
(
	id_prova INT,
	numeracao_atleta INT,
	resultado VARCHAR(12)
	PRIMARY KEY (id_prova, numeracao_atleta)
	FOREIGN KEY (id_prova) REFERENCES Prova,
	FOREIGN KEY (numeracao_atleta) REFERENCES Atleta
)

CREATE TABLE Bateria_RUN_Final
(
	id_prova INT,
	numeracao_atleta INT,
	resultado VARCHAR(12)
	PRIMARY KEY (id_prova, numeracao_atleta)
	FOREIGN KEY (id_prova) REFERENCES Prova,
	FOREIGN KEY (numeracao_atleta) REFERENCES Atleta
)

-- Drop de tabelas :) --

Drop table Atleta
go
Drop table Paises
DROP TABLE Recordes
DROP TABLE Prova
DROP TABLE Resultados

-- Insert de Tabelas --

Insert into Paises values
('ARG', 'Argentina'),
('BAR', 'Barbados'),
('BRA', 'Brasil'),
('CHI', 'Chile'),
('COL', 'Colômbia'),
('CUB', 'Cuba'),
('ECU', 'Equador'),
('ETH', 'Etiópia'),
('GER', 'Alemanha'),
('JAM', 'Jamaica'),
('KEN', 'Quênia'),
('MAR', 'Marrocos'),
('PUR', 'Porto Rico'),
('RUS', 'Rússia'),
('SKN', 'São Cristóvão e Nevis'),
('TTO', 'Trinidad e Tobago'),
('URU', 'Uruguai'),
('USA', 'Estados Unidos'),
('VEN', 'Venezuela')

SELECT * FROM Paises

INSERT INTO Prova VALUES
	(1,'Lançamento de Dardo', 'F'),
	(1,'Salto em Distância', 'M'),
	(1,'Salto com Vara', 'M'),
	(2,'400 m com barreiras', 'M'),
	(2,'100 m', 'F'),
	(1,'Arremesso do peso', 'F'),
	(2,'100 m', 'M'),
	(2,'3000 m', 'M'),
	(1,'Lançamento do Disco', 'M'),
	(2,'3000 m com obstáculos', 'F'),
	(1,'Salto Triplo', 'F'),
	(2,'400 m', 'M'),
	(2,'800 m', 'F'),
	(2,'800 m', 'M'),
	(2,'200 m', 'F'),
	(2,'200 m', 'M')
	
SELECT id, 
	CASE tipo_prova
		WHEN 1 THEN
			'Salto e arremesso'
		WHEN 2 THEN
			'Corrida'
	END AS tipo_prova
	, nome, 
	CASE sexo
		WHEN 'F' THEN
			'Feminino'
		WHEN 'M' THEN
			'Masculino'
	END AS sexo
FROM Prova 
ORDER BY tipo_prova, sexo

INSERT INTO Recordes VALUES
	(1, 1, '72.28', 'Barbara Špotáková', 'CZE', 'Stuttgart', '13/09/2008'),
	(2, 1, '8.95', 'Mike Powell', 'USA', 'Tóquio', '30/08/1991'),
	(3, 1, '6.16', 'Renaud Lavilennie', 'FRA', 'Donetsk', '15/02/2014'),
	(4, 1, '00:00:46.78', 'Kevin Young', 'USA', 'Barcelona', '06/08/1992'),
	(5, 1, '00:00:10.49', 'Florence G. Joyner', 'USA', 'Indianápolis', '16/07/1988'),
	(6, 1, '22.63', 'Natalya Lisovskaya', 'FRA', 'Moskva', '07/06/1987'),
	(7, 1, '00:00:9.58', 'Usain Bolt', 'JAM', 'Berlim', '16/08/2009'),
	(8, 1, '00:07:20.67', 'Daniel Komen', 'KEN', 'Rieti', '01/09/1996'),
	(9, 1, '74.08', 'Jurgen Schult', 'GER', 'Neubrandenburg', '06/06/1986'),
	(10, 1, '00:08:58.81', 'Gulnara Galkira', 'RUS', 'Beijing', '17/08/2008'),
	(11, 1, '15.50', 'Inessa Kravets', 'UKR', 'Goterborg', '10/08/1995'),
	(12, 1, '00:00:43.18', 'Michael Johnson', 'USA', 'Sevilha', '26/08/1996'), 
	(13, 1, '00:01:53.28', 'Jarmila Kratochvílová', 'TCH', 'Munique', '26/07/1983'),
	(14, 1, '00:01:40.91', 'David Lekuta Rudisha', 'KEN', 'Londres', '09/08/2012'),
	(15, 1, '00:00:21.34', 'Florence G. Joyner', 'USA', 'Seul', '27/09/1988'),
	(16, 1, '00:00:19.19', 'Usain Bolt', 'JAM', 'Berlim', '20/08/2009'),
	(1, 2, '62.33', 'Osleidys Menéndes', 'CUB', 'Belém', '21/07/2006' ),
	(2, 2, '8.51', 'Roland McGhee', 'USA', 'São Paulo', '14/05/1995' ),
	(3, 2, '5.92', 'Dean Starkey', 'USA', 'São Paulo', '21/05/1994' ),
	(4, 2, '00:00:48.12', 'Samuel Matete', 'ZAM', 'Rio de Janeiro', '04/05/1996' ),
	(5, 2, '00:00:11.05', 'Ana Claudia Lemos S', 'BRA', 'Belém', '12/05/2013' ),
	(6, 2, '20.73', 'Vita Pavlysh', 'UKR', 'Rio de Janeiro', '04/05/1997' ),
	(7, 2, '00:00:9.99', 'Daniel Bailey', 'ANT', 'Belém', '24/05/2009' ),
	(8, 2, '00:07:43.15', 'Simon Chemoiywo', 'KEN', 'São Paulo', '14/05/1995' ),
	(9, 2, '67.02', 'Attila Horvath', 'HUN', 'São Paulo', '19/05/1991' ),
	(10, 2, '00:09:31.03', 'Salima El Ouali Alam', 'MAR', 'Rio de Janeiro', '19/05/2012' ),
	(11, 2, '14.81', 'Trecia Smith', 'JAM', 'Belém', '22/05/2005' ),
	(12, 2, '00:00:44.45', 'Leonard Byrd', 'USA', 'Belém', '05/05/2002' ),
	(13, 2, '00:01:57.38', 'Maria Mutola', 'MOZ', 'São Paulo', '16/05/1993' ),
	(14, 2, '00:01:44.52', 'Gilbert Kipchoge', 'KEN', 'Belém', '25/05/2008' ),
	(15, 2, '00:00:22.43', 'Gwen Torrence', 'USA', 'São Paulo', '14/05/1995' ),
	(16, 2, '00:00:20.02', 'Michael Johnson', 'USA', 'São Paulo', '19/05/1991' )

TRUNCATE TABLE Recordes	
/*
SELECT que agrupa os recordes por prova
*/	
SELECT * FROM Recordes
ORDER BY id_prova

INSERT INTO Atleta values
('Abel Curtinove', 'M', 'BRA'),
('Aláin Sotolongo Iraola', 'M', 'CUB'),
('Aldemir Gomes da Silva Junior', 'M', 'BRA'),
('Alex Ribeiro da Costa Fausino', 'M', 'BRA'),
('Alexander Russo', 'M', 'BRA'),
('Aline Torres Sena', 'F', 'BRA'),
('Ana Claudia Lemos Silva', 'F', 'BRA'),
('Anastasia Bazdyreva', 'F', 'RUS'),
('Anderson Freitas Henriques', 'M', 'BRA'),
('Anderson Teles da Silva', 'M', 'BRA'),
('Andre Alberi de Santana', 'M', 'BRA'),
('Angela Figueroa', 'F', 'COL'),
('Antoine Adams', 'M','SKN'),
('Antonio Cesar Rodrigues', 'M', 'BRA'),
('Artur Langowski Terezan', 'M', 'BRA'),
('Asafa Powell', 'M', 'JAM'),
('Bárbara Pierre', 'F', 'USA'),
('Bryshon Nellum', 'M', 'USA'),
('Buzuayeuhu Mohamed', 'F', 'ETH'),
('Carlos Antonino Barbosa da Silva Vall', 'M', 'BRA'),
('Carlos Antonio dos Santos', 'M', 'BRA'),
('Caroline Alves Dias', 'F', 'BRA'),
('Claudine Paola Gimenes de Jesus', 'F', 'BRA'),
('Cleiton Cezario Abrão', 'M', 'BRA'),
('Cleopatra Borel', 'F', 'TTO'),
('Cornelius Kangogo', 'M', 'KEN'),
('Damar Frobes', 'M', 'JAM'),
('David Kiprotich Bett', 'M', 'KEN'),
('Dentarius Locke', 'M', 'USA'),
('Ederson Vilela Pereira', 'M', 'BRA'),
('Edivania dos Santos Araujo', 'F', 'BRA'),
('Eliane Luanda Cardoso Pereira', 'F', 'BRA'),
('Emiliano Lasa', 'M', 'URU'),
('Eric Alejandro', 'M', 'PUR'),
('Evelyn Carolina de Oliveira dos Santos', 'F', 'BRA'),
('Fábio Gomes da Silva', 'M', 'BRA'),
('Felipe Lorenzon', 'M', 'BRA'),
('Flor Ruiz', 'F', 'COL'),
('Geisa Rafaela Arcanjo', 'F', 'BRA'),
('Geoffrey Barusei', 'M', 'KEN'),
('Geral Giraldo', 'M', 'COL'),
('German Chiaraviglio', 'M', 'ARG'),
('Gisele Lima de Oliveira', 'F', 'BRA'),
('Giselle Marculino de Albuquerque', 'F', 'BRA'),
('Hederson Alves Estefani', 'M', 'BRA'), 
('Henrique da Silva', 'M', 'BRA'),
('Higor Silva Alves', 'M', 'BRA'),
('Ivan Gonzalez', 'M', 'COL'),
('Izabela Rodrigues da Silva', 'F', 'BRA'),
('Jared Schuurmans', 'M', 'USA'),
('Jason Young', 'M', 'USA'),
('Jeff Estenton Oliverio', 'M', 'BRA'),
('Jefferson Liberato Lucindo', 'M', 'BRA'),
('Jessica Gonzaga dos Santos', 'F', 'BRA'),
('João Gabriel Santos Souza', 'M', 'BRA'),
('Job Koech Kinyor', 'M', 'KEN'),
('John Kipkoech', 'M', 'KEN'),
('Joilson Bernardo da Silva', 'M', 'BRA'),
('Jorge Felix Miranzo', 'M', 'CUB'),
('Jorge Henrique da Costa Vides', 'M', 'BRA'),
('Jucian Rafael Alcântara Pereira', 'M', 'BRA'),
('Jucilene Sales de Lima', 'F', 'BRA'),
('July Ferreira da Silva', 'F', 'BRA'),
('Justin Gaymon', 'M', 'USA'),
('Keila da Silva Costa', 'F', 'BRA'),
('Kelly Christinne Pinho Rodrigues Medei', 'F', 'BRA'),
('Kevin Angulo', 'M', 'ECU'),
('Laila Ferrer Domingos', 'F', 'BRA'),
('Leandro Prates Oliveira', 'M', 'BRA'),
('Lilian Meurer Seibert', 'F', 'BRA'),
('Livia Avancini', 'F', 'BRA'),
('Lucirio Antônio Garrido', 'M', 'VEN'),
('Lutimar Abreu Paes', 'M', 'BRA'),
('Mahau Camargo Suguimati', 'M', 'BRA'),
('Maria Conceição Paixão da Silva', 'F', 'BRA'),
('Mario Luis David Junior', 'M', 'BRA'),
('Markus Münch', 'M', 'GER'),
('Marvin Blanco', 'M', 'VEN'),
('Marvin Bracy', 'M', 'USA'),
('Maurice Mitchell', 'M', 'USA'),
('Maurício Ortega', 'M', 'COL'),
('Mauro Vinícius Hilário da Silva', 'M', 'BRA'),
('Miki Barber', 'F', 'USA'),
('Muriel Coneo', 'F', 'COL'),
('Natalia Ducó', 'F', 'CHI'),
('Othmar El Goumri', 'M', 'MAR'),
('Paloma Nascimento Oliveira', 'F', 'BRA'),
('Paulo Sergio dos Santos Oliveira', 'M', 'BRA'),
('Pedro Luiz Burmann de Oliveira', 'M', 'BRA'),
('Peterson dos Santos', 'M', 'BRA'),
('Rafael Santos Novais', 'M', 'BRA'),
('Rafaela Torres Gonçalves', 'F', 'BRA'),
('Rafith Rodriguez', 'M', 'COL'),
('Ramon Gittens', 'M', 'BAR'),
('Renata Tavares Severiano', 'F', 'BRA'),
('Rogerio da Silva Bispo', 'M', 'BRA'),
('Ronald Odair Oliveira Julião', 'M', 'BRA'),
('Rosangela Cristina Oliveira Santos', 'F', 'BRA'),
('Sammy Kibet Kirongo', 'M', 'KEN'),
('Sandra Lemos', 'F', 'COL'),
('Sara Vaughn', 'F', 'USA'),
('Soufiyan Bouqantar', 'M', 'MAR'),
('Tabarie Henry', 'M', 'USA'),
('Tamiris Cristina Rodrigues', 'F', 'BRA'),
('Tania Ferreira da Silva', 'F', 'BRA'),
('Tatiana de Souza Araujo', 'F', 'BRA'),
('Tatiane Raquel da Silva', 'F', 'BRA'),
('Thiago de Jesus Sales', 'M', 'BRA'),
('Thiago Henrique Matias Gonçalves', 'M', 'BRA'),
('Tiffany Towsend', 'M', 'USA'),
('Vanusa Henrique dos Santos', 'F', 'BRA'),
('Vitor Hugo Silva Mourão dos Santos', 'M', 'BRA'),
('Viviane Santana Lyra', 'F', 'BRA'),
('Wagner Francisco Cardoso', 'M', 'BRA'),
('Willian dos Santos Gomes', 'M', 'BRA'),
('Yosiri Urrutia', 'F', 'COL'),
('Younés Essalhi', 'M', 'MAR')

SELECT * FROM Atleta

SELECT * FROM Prova

exec sp_computaMarcas 1,1,'8.98',1,1
exec sp_computaMarcas 1,1,'6.98',2,1
exec sp_computaMarcas 1,1,'6.98',3,1
exec sp_computaMarcas 1,1,'7.75',4,1
exec sp_computaMarcas 1,1,'11.81',5,1
exec sp_computaMarcas 1,1,'10.54',6,1

exec sp_computaMarcas 1,2,'8.98',1,1
exec sp_computaMarcas 1,2,'6.98',2,1
exec sp_computaMarcas 1,2,'6.98',3,1
exec sp_computaMarcas 1,2,'7.75',4,1
exec sp_computaMarcas 1,2,'11.81',5,1
exec sp_computaMarcas 1,2,'10.54',6,1

select * from Bateria_SA_Inicial

exec sp_computaMarcas 1,3,'8.98',1,1
exec sp_computaMarcas 1,3,'6.98',2,1
exec sp_computaMarcas 1,3,'6.98',3,1
exec sp_computaMarcas 1,3,'7.75',4,1
exec sp_computaMarcas 1,3,'11.81',5,1
exec sp_computaMarcas 1,3,'10.54',6,1

exec sp_computaMarcas 1,4,'8.98',1,1
exec sp_computaMarcas 1,4,'10.87',2,1
exec sp_computaMarcas 1,4,'09.85',3,1
exec sp_computaMarcas 1,4,'14.87',4,1
exec sp_computaMarcas 1,4,'13.80',5,1
exec sp_computaMarcas 1,4,'14.94',6,1

exec sp_computaMarcas 1,5,'09.25',1,1
exec sp_computaMarcas 1,5,'14.20',2,1
exec sp_computaMarcas 1,5,'16.15',3,1
exec sp_computaMarcas 1,5,'15.80',4,1
exec sp_computaMarcas 1,5,'13.14',5,1
exec sp_computaMarcas 1,5,'18.69',6,1

exec sp_computaMarcas 1,6,'09.25',1,1
exec sp_computaMarcas 1,6,'09.17',2,1
exec sp_computaMarcas 1,6,'08.00',3,1
exec sp_computaMarcas 1,6,'08.15',4,1
exec sp_computaMarcas 1,6,'13.45',5,1
exec sp_computaMarcas 1,6,'16.98',6,1

exec sp_computaMarcas 1,7,'08.48',1,1
exec sp_computaMarcas 1,7,'07.99',2,1
exec sp_computaMarcas 1,7,'10.98',3,1
exec sp_computaMarcas 1,7,'12.12',4,1
exec sp_computaMarcas 1,7,'12.52',5,1
exec sp_computaMarcas 1,7,'19.12',6,1

exec sp_computaMarcas 1,8,'09.99',1,1
exec sp_computaMarcas 1,8,'06.20',2,1
exec sp_computaMarcas 1,8,'15.12',3,1
exec sp_computaMarcas 1,8,'10.10',4,1
exec sp_computaMarcas 1,8,'14.99',5,1
exec sp_computaMarcas 1,8,'16.23',6,1

exec sp_computaMarcas 1,9,'09.14',1,1
exec sp_computaMarcas 1,9,'18.78',2,1
exec sp_computaMarcas 1,9,'14.56',3,1
exec sp_computaMarcas 1,9,'10.45',4,1
exec sp_computaMarcas 1,9,'12.99',5,1
exec sp_computaMarcas 1,9,'14.64',6,1

exec sp_computaMarcas 1,10,'08.98',1,1
exec sp_computaMarcas 1,10,'06.58',2,1
exec sp_computaMarcas 1,10,'05.25',3,1
exec sp_computaMarcas 1,10,'14.85',4,1
exec sp_computaMarcas 1,10,'01.61',5,1
exec sp_computaMarcas 1,10,'15.44',6,1

exec sp_computaMarcas 1,10,'FAULT',1,2

exec sp_computaMarcas 4,60,'00:00:09.123',1,1

select * from Bateria_SA_Final
select * from Bateria_RUN_Inicial

create procedure sp_computaMarcas(@idProva int, @idAtleta int, @marca varchar(12), @tentativa int, @fase int) as 
declare @tipoProva int
declare @mensagem varchar(max)

set @tipoProva=(select tipo_prova from Prova where id = @idProva)

IF(@marca <> 'FAULT' AND @marca <> 'DNF')
BEGIN
	set @mensagem = dbo.fn_verificaRecorde(@idProva, @idAtleta, @marca)
	PRINT(@mensagem)
END

if(@tipoProva =1) begin
	exec sp_computaSalto @idProva, @idAtleta, @marca, @tentativa, @fase
end
else begin
	--declare @time time(3)
	--set @time = CAST(@marca AS TIME(3))
	exec sp_computaCorrida @idProva, @idAtleta, @marca, @fase
end
	
	drop procedure sp_computaMarcas
	
create procedure sp_computaSalto(@idProva int, @idAtleta int, @marca varchar(12), @tentativa int, @fase int) as 
declare @IniFin varchar(18)
declare @query varchar(max)
declare @t varchar(2)

set @t = 't' + cast(@tentativa as varchar(1))

if(@fase =1)begin
	set @IniFin = 'Bateria_SA_Inicial'
end
else if(@fase=2)begin
		set @IniFin = 'Bateria_SA_Final'
end

if(@tentativa=1 and @fase=1)begin
	if(@marca = 'FAULT') begin
		set @query = 'insert into ' + @IniFin + '(id_prova, numeracao_atleta, t1, resultado) values (' 
		+ cast(@idProva as varchar(2)) + ', ' + cast(@idAtleta as varchar(3)) + ', ''FAULT'', NULL)'
		exec(@query)
	end
	else begin
		set @query = 'insert into ' + @IniFin + '(id_prova, numeracao_atleta, t1, resultado) values (' 
		+ cast(@idProva as varchar(2)) + ', ' + cast(@idAtleta as varchar(3)) + ', ' 
		+ cast(@marca as varchar(12)) + ', ' + cast(@marca as varchar(12)) + ' )'
		exec(@query)
	end
end
else begin

	declare @melhor VARCHAR(12)
	if(@marca = 'FAULT') begin
		set @query = 'update ' + @IniFin + ' set ' + @t + ' = ''FAULT'''  +  
		' where id_prova = ''' + cast(@idProva as varchar(2)) + 
		''' and  numeracao_atleta = ''' + cast(@idAtleta as varchar(3)) + ''''
		exec(@query)
	end
	else begin
		set @melhor = CAST(dbo.fn_melhorResultado(@idProva, @idAtleta, @marca, @fase) AS VARCHAR(12))
		set @query = 'update ' + @IniFin + ' set ' + @t + ' = ' + @marca + 
		' , resultado = ' + @melhor + 
		'  where id_prova = ''' + cast(@idProva as varchar(2)) + 
		''' and  numeracao_atleta = ''' + cast(@idAtleta as varchar(3)) + ''''
		exec(@query)
	end	
end	

drop procedure sp_computaSalto
select * from Bateria_SA_Final
exec sp_computaMarcas 1, 7, '18.98',1,2

create function fn_melhorResultado(@idProva int, @idAtleta int, @marca varchar(12), @fase int) returns DECIMAL(6,3) as begin
declare @melhor DECIMAL(6,3)
if(@fase =1) begin
	set @melhor = (select resultado from Bateria_SA_Inicial  where id_prova = @idProva and numeracao_atleta = @idAtleta )
end
else begin
	set @melhor = (select resultado from Bateria_SA_Final  where id_prova = @idProva and numeracao_atleta = @idAtleta )
end


	DECLARE @marca2 DECIMAL(6,3) 
	SET @marca2 = CAST(@marca AS DECIMAL(6,3))
	if(@melhor is null)begin
		set @melhor = '0.00'
	end
	if(@marca2> @melhor) begin
		set @melhor = @marca2
	end

		return @melhor	

	end


DROP FUNCTION fn_melhorResultado

create procedure sp_computaCorrida(@idProva int, @idAtleta int, @marca VARCHAR(12), @fase int)as

declare @IniFin varchar(19)
declare @query varchar(max)

if(@fase =1)begin
	set @IniFin = 'Bateria_RUN_Inicial'
end
else begin
		set @IniFin = 'Bateria_RUN_Final'
end
if(@fase=1)begin
	if(@marca = 'DNS') begin
		set @query = 'insert into ' + @IniFin + '(id_prova, numeracao_atleta, resultado) values (' + cast(@idProva as varchar(2)) + ' , ' + cast(@idAtleta as varchar(3)) + ', ''DNS '' )'
		exec(@query)
	end
	else begin
		set @query = 'insert into ' + @IniFin + '(id_prova, numeracao_atleta, resultado) values (' + cast(@idProva as varchar(2)) + ' , ' + cast(@idAtleta as varchar(3)) + ', ''' + CAST(@marca AS VARCHAR(12)) + ''' )'
		exec(@query)
	end
end
else begin
	if(@marca = 'DNS') begin
		set @query = 'update ' + @IniFin + ' set resultado = ''DNS '' where id_prova = ' + CAST(@idProva as varchar(2)) + ' and numeracao_atleta =' + CAST(@idAtleta as varchar(3)) 
		exec(@query)
	end
	else begin
		set @query = 'update ' + @IniFin + ' set resultado = ''' + CAST(@marca AS VARCHAR(12)) + ''' where id_prova = ' + CAST(@idProva as varchar(2)) + ' and numeracao_atleta =' + CAST(@idAtleta as varchar(3)) 
		exec(@query)
	end
end

DROP PROCEDURE sp_computaCorrida
select * from fn_tabelaResultadoInicial()

select * from Bateria_SA_Inicial

select * from dbo.fn_tabelaResultadoInicial()
CREATE FUNCTION fn_tabelaResultadoInicial() RETURNS @tabelaResultado TABLE(
	codigo_atleta int,
	nome_atleta varchar(100),
	nome_pais varchar(50),
	resultado varchar(12))
AS
BEGIN
	INSERT INTO @tabelaResultado(codigo_atleta, nome_atleta, nome_pais, resultado)
	
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_SA_Inicial.resultado as varchar(12))AS Resultado from Bateria_SA_Inicial
	inner join Atleta on Bateria_SA_Inicial.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla 
	
	union all
	
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_RUN_Inicial.resultado as varchar(12)) from Bateria_RUN_Inicial
	inner join Atleta on Bateria_RUN_Inicial.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla 
	
	RETURN
END

select * from dbo.fn_tabelaResultadoFinal()

CREATE FUNCTION fn_tabelaResultadoFinal() RETURNS @tabelaResultado TABLE(
	codigo_atleta int,
	nome_atleta varchar(100),
	nome_pais varchar(50),
	resultado varchar(12))
AS
BEGIN
	INSERT INTO @tabelaResultado(codigo_atleta, nome_atleta, nome_pais, resultado)
	
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_SA_Final.resultado as varchar(12))AS Resultado from Bateria_SA_Final
	inner join Atleta on Bateria_SA_Final.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla 
	
	union all
	
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_RUN_Final.resultado as varchar(12)) from Bateria_RUN_Final
	inner join Atleta on Bateria_RUN_Final.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla 
	
	RETURN
END


create function fn_verificaRecorde(@idProva int, @idAtleta int, @marca varchar(12)) returns varchar(max) as begin
declare @recordeCampeonato varchar(12)
declare @recordeMundial varchar(12)
declare @tipo int
set @tipo = (select tipo_prova from Prova where id=@idProva)
declare @nomeAtleta varchar(max)
set @nomeAtleta =(select nome from Atleta where numeracao=@idAtleta)

declare @mensagem varchar(max)

set @recordeCampeonato = (select marca_recorde from Recordes where id_prova=@idProva and tipo_recorde=2)
set @recordeMundial = (select marca_recorde from Recordes where id_prova=@idProva and tipo_recorde=1)

if(@tipo=1)begin
	if(@marca>@recordeMundial) begin
		set @mensagem = 'Recorde do Mundial foi quebrado. Parabéns ' + @nomeAtleta + ' !'
	end
	if(@marca>@recordeCampeonato)begin
		set @mensagem = 'Recorde do Campeonato foi quebrado. Parabéns ' + @nomeAtleta + ' !'
	end	
	if(@marca > @recordeMundial and @marca> @recordeCampeonato)begin
		set @mensagem = 'Recorde do Campeonato e do Mundial foram quebrados. Parabéns ' +@nomeAtleta + ' !'
	end
end
else if(@tipo=2)begin
		if(@marca<@recordeMundial) begin
		set @mensagem = 'Recorde do Mundial foi quebrado. Parabéns ' + @nomeAtleta + ' !'
	end
	if(@marca<@recordeCampeonato)begin
		set @mensagem = 'Recorde do Campeonato foi quebrado. Parabéns ' +  @nomeAtleta + ' !'
	end	
	if(@marca < @recordeMundial and @marca< @recordeCampeonato)begin
		set @mensagem = 'Recorde do Campeonato e do Mundial foram quebrados. Parabéns ' + @nomeAtleta + ' !'
	end
end	
	return @mensagem
end





create function fn_mostraResultado(@idProva int)RETURNS @tabelaResultado TABLE(
	codigo_atleta int,
	nome_atleta varchar(100),
	nome_pais varchar(50),
	resultado varchar(12))
AS
BEGIN

declare @tipo int

set @tipo = (select tipo_prova from Prova where id=@idProva)

if(@tipo = 1)begin

INSERT INTO @tabelaResultado(codigo_atleta, nome_atleta, nome_pais, resultado)
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_SA_Inicial.resultado as varchar(12))AS Resultado from Bateria_SA_Inicial
	inner join Atleta on Bateria_SA_Inicial.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla where id_prova=@idProva

end
else if(@tipo=2)begin

INSERT INTO @tabelaResultado(codigo_atleta, nome_atleta, nome_pais, resultado)
	select Atleta.numeracao, Atleta.nome, Paises.nome, cast(Bateria_RUN_Inicial.resultado as varchar(12)) as Resultado from Bateria_RUN_Inicial
	inner join Atleta on Bateria_RUN_Inicial.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla where id_prova=@idProva
end

	return
end

create procedure sp_classificaFinal(@idProva int)as 

declare @tipo int
declare @contador int
declare @idAtleta int
declare @resultado varchar(12)
set @contador = 1

set @tipo = (select tipo_prova from Prova where id=@idProva)

while(@contador<=8)begin
	
	if(@tipo = 1)begin 

		set @idAtleta = ( select top 1 numeracao_atleta from Bateria_SA_Inicial
		where numeracao_atleta IN(
			select top (cast(@contador as int)) numeracao_atleta
			from Bateria_SA_Inicial
			order by resultado desc
		)
		order by resultado asc)
		insert into Bateria_SA_Final(id_prova,numeracao_atleta) values(@idProva, @idAtleta)
	end
	
	
	else if(@tipo=2)begin
		
		set @idAtleta = ( select top 1 numeracao_atleta from Bateria_RUN_Inicial
		where numeracao_atleta IN(
			select top (cast(@contador as int)) numeracao_atleta
			from Bateria_RUN_Inicial
			order by resultado asc
		)
		order by resultado desc)
		set @resultado = (select top 1 resultado from Bateria_RUN_Inicial
		where resultado IN(
			select top (cast(@contador as int)) resultado
			from Bateria_RUN_Inicial
			order by resultado asc
		)
		order by resultado desc)
		IF(@resultado <> 'DNF')
		BEGIN
			insert into Bateria_RUN_Final(id_prova,numeracao_atleta) values(@idProva, @idAtleta)
		END
	end
	set @contador = @contador +1
end

drop procedure sp_classificaFinal

exec sp_classificaFinal 4
select * from Bateria_RUN_Final

exec sp_computaMarcas 1, 7, '8.98',2,2

select * from Bateria_RUN_Inicial order by resultado asc

truncate table Bateria_RUN_Inicial

exec sp_computaMarcas 4, 51, '00:00:10.456', 1, 1
exec sp_computaMarcas 4, 52, '00:00:08.789', 1, 1
exec sp_computaMarcas 4, 53, '00:00:07.111', 1, 1
exec sp_computaMarcas 4, 54, '00:00:11.222', 1, 1
exec sp_computaMarcas 4, 55, '00:00:09.333', 1, 1
exec sp_computaMarcas 4, 56, '00:00:13.777', 1, 1
exec sp_computaMarcas 4, 57, '00:00:11.111', 1, 1
exec sp_computaMarcas 4, 58, 'DNF', 1, 1
exec sp_computaMarcas 4, 59, 'DNF', 1, 1

exec sp_computaMarcas 4, 60, 'DNF', 1, 1
/*
----------------------------------------------------------------------
CRIAÇÃO DE TRIGGERS
----------------------------------------------------------------------
*/

CREATE TRIGGER UpOrDelCountries ON Paises
AFTER UPDATE,DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela Países não pode ser alterada ou excluída', 1, 16)
END

CREATE TRIGGER UpOrDelAtletas ON Atleta
AFTER UPDATE,DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela Atleta não pode ser alterada ou excluída', 1, 16)
END

DISABLE TRIGGER UpOrDelBSAI ON Bateria_SA_Inicial
DISABLE TRIGGER UpOrDelBSAF ON Bateria_SA_Final
DISABLE TRIGGER UpOrDelBRUNI ON Bateria_RUN_Inicial
DISABLE TRIGGER UpOrDelBRUNF ON Bateria_RUN_Final

CREATE TRIGGER UpOrDelBSAI ON Bateria_SA_Inicial
AFTER DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela bateria inicial de saltos e arremessos não pode ser alterada ou excluída', 1, 16)
END

CREATE TRIGGER UpOrDelBSAF ON Bateria_SA_Final
AFTER DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela bateria final de saltos e arremessos não pode ser alterada ou excluída', 1, 16)
END

CREATE TRIGGER UpOrDelBRUNI ON Bateria_RUN_Inicial
AFTER DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela bateria inicial de corridas não pode ser alterada ou excluída', 1, 16)
END

CREATE TRIGGER UpOrDelBRUNF ON Bateria_RUN_Final
AFTER DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('A tabela bateria final de corridas não pode ser alterada ou excluída', 1, 16)
END

SET LANGUAGE 'Portuguese'

-- Teste de conversão

DECLARE @marca VARCHAR(12),
		@tempo TIME(3),
		@distancia DECIMAL(6,3)
SET @marca = '00:00:09:123'
SET @tempo = CAST(@marca AS TIME(3))
PRINT(@tempo)
SET @marca = '100.80'
SET @distancia = CAST(@marca AS DECIMAL(6,3))
PRINT(@distancia)

select numeracao_atleta, resultado,
	ROW_NUMBER() OVER(ORDER BY resultado DESC) AS linha
from Bateria_SA_Inicial

select top 8 numeracao_atleta, resultado
		from Bateria_SA_Inicial
		order by resultado desc

select top 1 numeracao_atleta, resultado
from Bateria_SA_Inicial
	where numeracao_atleta IN(
		select top 2 numeracao_atleta
		from Bateria_SA_Inicial
		order by resultado desc
	)
order by resultado asc	



select top 1 Atleta.numeracao, Atleta.nome, Paises.nome as Pais, cast(Bateria_SA_Inicial.resultado as varchar(12)) as Resultado from Bateria_SA_Inicial
	inner join Atleta on Bateria_SA_Inicial.numeracao_atleta = Atleta.numeracao  
	inner join Paises on Atleta.codigo_Pais = Paises.sigla
	where numeracao_atleta IN(
		select top 2 numeracao_atleta
		from Bateria_SA_Inicial
		order by resultado desc
	)
order by resultado asc