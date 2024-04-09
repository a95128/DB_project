

-- ------------------------------------------------------
-- ------------------------------------------------------
-- Universidade do Minho
-- Lincenciatura em Engenharia Informática
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: Livraria
-- Criação do Esquema Físico
-- Povoamento inicial da base de dados
-- Maio de 2023/GRUPO 33
-- ------------------------------------------------------
-- ------------------------------------------------------

--
-- Esquema: "Livraria"
USE `Livraria` ;

--
-- Permissão para fazer operações de remoção de dados.Usermane`Numero de telemovel`
SET SQL_SAFE_UPDATES = 0;

--
-- Povoamento da tabela "Editora"
INSERT INTO `Livraria`.`Editora`
	(idEditora, Nome)
	VALUES 
		(1, 'Porto Editora'),
        (2, 'Relógio dÁgua'),
        (3, 'Leya'),
		(4, 'Dom Quixote'),
        (5, 'Bertrand Editora'),
        (6, 'Presença'),
		(7, 'Quetzal Editores'),
        (8, 'Guerra e Paz Editores'),
        (9, 'Caminho'),
        (10, 'Tinta da China'),
        (11, 'ASA'),
        (12, 'Casa das Letras'),
        (13, 'Editorial Caminho'),
        (14, 'Minotauro'),
        (15, 'Gradiva'),
        (16, 'Civilização Editora'),
        (17, 'Livros do Brasil'),
        (18, 'Sextante Editora'),
        (19, 'Oficina do Livro'),
        (20, 'Dom Quixote');


-- DELETE FROM Editora;
-- SELECT * FROM Editora;

--
-- Povoamento da tabela "Autores"
INSERT INTO `Livraria`.`Autor`
	(idAutor, nome)
	VALUES 
		(1, 'José Saramago'),
        (2, 'Fernando Pessoa'),
        (3, 'Miguel Torga'),
        (4, 'José Luís Peixoto'),
        (5, 'Almeida Garrett'),
        (6, 'Sophia de Mello Breyner Andresen'),
		(7, 'António Lobo Antunes'),
        (8, 'Luís de Camões'),
        (9, 'Eça de Queirós'),
        (10, 'Agustina Bessa-Luís'),
        (11, 'Vergílio Ferreira'),
        (12, 'Camilo Castelo Branco'),
        (13, 'Fernando Namora'),
        (14, 'Jorge Amado'),
        (15, 'José Cardoso Pires'),
        (16, 'António Nobre'),
        (17, 'Vasco Graça Moura'),
        (18, 'Carlos Drummond de Andrade'),
        (19, 'Clarice Lispector'),
        (20, 'Gonçalo M. Tavares'),
        (21, 'Mário de Sá-Carneiro'),
        (22, 'Júlio Dinis'),
        (23, 'Miguel Sousa Tavares'),
        (24, 'Florbela Espanca'),
        (25, 'Manuel Alegre'),
        (26, 'José Régio'),
        (27, 'Teixeira de Pascoaes'),
        (28, 'Fernando Assis Pacheco'),
        (29, 'Herberto Helder'),
        (30, 'Nuno Júdice');

--
-- DELETE FROM Autores;
-- SELECT * FROM Autor;

INSERT INTO `Livraria`.`Função`
	(`Funcionario ID`, `Entregador`, `Livreiro`)
	VALUES 
        (1, 'Não', 'Sim'),
        (2, 'Sim', 'Não'),
        (3, 'Sim','Sim')
	;
    
-- DELETE FROM Função;
-- SELECT * FROM Função;

--
-- Povoamento da tabela "Funcionario"
INSERT INTO `Livraria`.`Funcionario`
	(ID, Nome,  Username, `Palavra-Passe`, IBAN, Localidade, Rua, `N da Porta`, `Codigo Postal`, função)
	VALUES 
		(1, 'João Silva', 'admin_jota', 'jota1921','PT50 1234 5678 9012 3456 7890 1', 'Lisboa', 'Rua dos Remédios', '10', '4000-002', 1),
        (2, 'José Maria Alves', 'fun_joaoalves', 'jmaria123','PT50 9876 5432 1098 7654 3210 2', 'Lisboa', 'Rua dos Remédios', '15', '4000-002', 1),
        (3, 'Pedro Almeida', 'fun_palmeida', 'almeidalindo','PT50 6543 2109 8765 4321 0987 3', 'Lisboa', 'Rua das Flores', '20', '4700-003', 2)
	;


-- DELETE FROM Funcionario;
-- SELECT * FROM Funcionario;

--
-- Povoamento da tabela "Formato"
INSERT INTO `Livraria`.`Formato`
	(`Formato ID`, `Digital`, `Fisico`)
	VALUES 
		(1, 0, 1),
        (2, 1, 0)
	;

--
-- DELETE FROM Formato;
-- SELECT * FROM Formato;


 -- Inserção dos estados "Disponível" e "Esgotado"
-- Povoamento da tabela "Estado"
INSERT INTO `Livraria`.`Estado` (`Estado ID`, `Disponivel`,`Esgotado`)
VALUES
(1, 1,0),
(2, 0,1);

-- Povoamento da tabela "Livro" e atualização do estado com base na quantidade
INSERT INTO `Livraria`.`Livro` (`ID`, `Genero`, `Formato`, `Quantidade`, `Titulo`, `Autor`, `Editora`, `Edição`, `Rating`, `Preço`, `Estado`)
VALUES 
(1, 'Ficção Científica', 1, 5, 'Duna', 1, 4, '1', 4, 29.99, 1),
(2, 'Romance', 1, 3, 'Orgulho e Preconceito', 2, 3, '2', 5, 19.99, 1),
(3, 'Mistério', 2, 7, 'O Código Da Vinci', 3, 2, '1', 4.2, 24.99, 1),
(4, 'Fantasia', 1, 2, 'O Senhor dos Anéis', 4, 1, '3', 4.9, 39.99, 1),
(5, 'Suspense', 1, 6, 'Garota Exemplar', 5, 4, '1', 4.6, 17.99, 1),
(6, 'Ficção Científica', 2, 4, 'Neuromancer', 6, 4, '2', 4.3, 14.99, 1),
(7, 'Aventura', 1, 0, 'As Aventuras de Tom Sawyer', 7, 2, '1', 4.7, 21.99, 2),
(8, 'Drama', 2, 9, 'O Sol é para Todos', 2, 1, '1', 4.4, 16.99, 1),
(9, 'Ficção Científica', 1, 2, 'Fundação', 3, 4, '1', 4.8, 27.99, 1),
(10, 'Thriller', 1, 8, 'O Silêncio dos Inocentes', 5, 3, '2', 4.6, 23.99, 1),
(11, 'Romance', 1, 5, 'Romeu e Julieta', 8, 5, '1', 4.5, 19.99, 1),
(12, 'Mistério', 2, 3, 'O Assassinato no Expresso do Oriente', 9, 6, '1', 4.7, 22.99, 1),
(13, 'Ficção Científica', 1, 7, 'Eu, Robô', 10, 7, '1', 4.3, 24.99, 1),
(14, 'Fantasia', 1, 2, 'A Batalha do Labirinto', 11, 8, '3', 4.9, 34.99, 1),
(15, 'Suspense', 1, 6, 'Psicose', 12, 9, '1', 4.2, 18.99, 1),
(16, 'Aventura', 2, 4, 'O Chamado da Floresta', 13, 10, '1', 4.6, 22.99, 1),
(17, 'Drama', 1, 0, 'O Retrato de Dorian Gray', 14, 11, '3', 4.4, 16.99, 2),
(18, 'Ficção Científica', 1, 9, 'Admirável Mundo Novo', 15, 12, '1', 4.3, 26.99, 1),
(19, 'Romance', 1, 1, 'Romeu e Julieta', 16, 13, '2', 4.7, 19.99, 1),
(20, 'Suspense', 2, 8, 'A Garota no Trem', 17, 14, '1', 4.6, 23.99, 1),
(21, 'Ficção Científica', 1, 3, 'Eu, Robô', 18, 15, '1', 4.5, 19.99, 1),
(22, 'Fantasia', 1, 5, 'A Batalha do Labirinto', 19, 16, '1', 4.9, 34.99, 1),
(23, 'Thriller', 2, 2, 'Psicose', 20, 17, '1', 4.8, 21.99, 1),
(24, 'Drama', 1, 4, 'O Apanhador no Campo de Centeio', 21, 18, '1', 4.2, 18.99, 1),
(25, 'Mistério', 1, 6, 'O Nome da Rosa', 22, 19, '1', 4.6, 22.99, 1),
(26, 'Romance', 1, 2, 'Dom Casmurro', 23, 20, '1', 4.4, 17.99, 1),
(27, 'Fantasia', 2, 7, 'A Torre Negra', 24, 1, '1', 4.3, 24.99, 1),
(28, 'Suspense', 1, 5, 'O Iluminado', 25, 2, '1', 4.7, 21.99, 1),
(29, 'Ficção Científica', 1, 0, 'Fahrenheit 451', 26, 3, '1', 4.5, 19.99, 2),
(30, 'Thriller', 1, 9, 'O Código Da Vinci', 27, 4, '1', 4.6, 23.99, 1);


-- DELETE FROM Livro;
-- SELECT * FROM Livro;

--
-- Povoamento da tabela "Compra"

INSERT INTO `Livraria`.`Compra`
	(ID, `Preço Consumidor`, `Preço Custo`, Data, Lucro, `Modo de Compra`, `Metodo de Pagamento`, `Livro ID`, `Funcionario ID`)
VALUES 
	(1, 29.99, 15.00, '2023-05-01 10:30:00', 14.99, 'Digital', 'Cartão de Crédito', 1, 1),
	(2, 19.99, 10.00, '2023-05-02 14:45:00', 9.99, 'Física', 'MBWay', 2, 2),
	(3, 24.99, 12.00, '2023-05-03 16:20:00', 12.99, 'Física', 'Cartão de Crédito', 3, 2),
	(4, 39.99, 20.00, '2023-05-04 09:15:00', 19.99, 'Digital', 'Cartão de Crédito', 4, 1),
	(5, 17.99, 8.00, '2023-05-05 12:00:00', 9.99, 'Física', 'Monetário', 5, 1),
	(6, 14.99, 7.00, '2023-05-06 11:30:00', 7.99, 'Digital', 'MBWay', 6, 2),
	(7, 29.99, 15.00, '2023-05-01 10:30:00', 14.99, 'Digital', 'Monetário', 7, 1),
	(8, 19.99, 10.00, '2023-05-02 14:45:00', 9.99, 'Física', 'Cartão de Crédito', 8, 2),
	(9, 24.99, 12.00, '2023-05-03 16:20:00', 12.99, 'Física', 'MBWay', 9, 2),
	(10, 39.99, 20.00, '2023-05-04 09:15:00', 19.99, 'Digital', 'Cartão de Crédito', 10, 1),
	(11, 17.99, 8.00, '2023-05-05 12:00:00', 9.99, 'Física', 'Monetário', 11, 1),
	(12, 14.99, 7.00, '2023-05-06 11:30:00', 7.99, 'Digital', 'MBWay', 12, 2),
	(13, 29.99, 15.00, '2023-05-01 10:30:00', 14.99, 'Digital', 'Monetário', 13, 1),
	(14, 19.99, 10.00, '2023-05-02 14:45:00', 9.99, 'Física', 'Cartão de Crédito', 14, 2),
	(15, 24.99, 12.00, '2023-05-03 16:20:00', 12.99, 'Física', 'MBWay', 15, 2),
	(16, 39.99, 20.00, '2023-05-04 09:15:00', 19.99, 'Digital', 'Cartão de Crédito', 16, 1),
	(17, 17.99, 8.00, '2023-05-05 12:00:00', 9.99, 'Física', 'Monetário', 17, 1),
	(18, 14.99, 7.00, '2023-05-06 11:30:00', 7.99, 'Digital', 'MBWay', 18, 2),
	(19, 29.99, 15.00, '2023-05-01 10:30:00', 14.99, 'Digital', 'Monetário', 19, 1),
	(20, 19.99, 10.00, '2023-05-02 14:45:00', 9.99, 'Física', 'Cartão de Crédito', 20, 2),
	(21, 24.99, 12.00, '2023-05-03 16:20:00', 12.99, 'Física', 'MBWay', 21, 2),
	(22, 39.99, 20.00, '2023-05-04 09:15:00', 19.99, 'Digital', 'Cartão de Crédito', 22, 1),
	(23, 17.99, 8.00, '2023-05-05 12:00:00', 9.99, 'Física', 'Monetário', 23, 1),
	(24, 14.99, 7.00, '2023-05-06 11:30:00', 7.99, 'Digital', 'MBWay', 24, 2),
	(25, 29.99, 15.00, '2023-05-01 10:30:00', 14.99, 'Digital', 'Monetário', 25, 1),
	(26, 19.99, 10.00, '2023-05-02 14:45:00', 9.99, 'Física', 'Cartão de Crédito', 26, 2),
	(27, 24.99, 12.00, '2023-05-03 16:20:00', 12.99, 'Física', 'MBWay', 27, 2),
	(28, 39.99, 20.00, '2023-05-04 09:15:00', 19.99, 'Digital', 'Cartão de Crédito', 28, 1),
	(29, 17.99, 8.00, '2023-05-05 12:00:00', 9.99, 'Física', 'Monetário', 29, 1),
	(30, 14.99, 7.00, '2023-05-06 11:30:00', 7.99, 'Digital', 'MBWay', 30, 2);


-- DELETE FROM Compra;
-- SELECT * FROM Compra;

--
-- Povoamento da tabela "CompraLivro"
-- Povoamento da tabela "CompraLivro"
INSERT INTO `Livraria`.`CompraLivro`
	(`idCompraLivro`, `Cliente ID`, `Compra ID`)
VALUES 
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 6, 4),
	(5, 6, 5),
	(6, 5, 6),
	(7, 7, 7),
	(8, 7, 8),
	(9, 8, 9),
	(10, 8, 10),
	(11, 9, 11),
	(12, 9, 12),
	(13, 10, 13),
	(14, 10, 14),
	(15, 11, 15),
	(16, 11, 16),
	(17, 12, 17),
	(18, 12, 18),
	(19, 13, 19),
	(20, 13, 20),
	(21, 14, 21),
	(22, 14, 22),
	(23, 15, 23),
	(24, 15, 24),
	(25, 16, 25),
	(26, 16, 26),
	(27, 17, 27),
	(28, 17, 28),
	(29, 18, 29),
	(30, 18, 30);

    

-- DELETE FROM CompraLivro;
-- SELECT * FROM CompraLivro;

--
-- Povoamento da tabela "Cliente"
INSERT INTO `Livraria`.`Cliente`
	(ID, Nome, Email, NIF, Username, `Palavra-Passe`, `Numero de telemovel`, Localidade, `Codigo Postal`, `N da Porta`, Rua)
	VALUES 
		(1, 'Ana João da Rocha Alves', 'ana@gmail.com', 12, 'ana_alves', 'ana123', '911111111', 'Panoias', '4700-760', '6', 'Rua das Adegas Felizes'),
        (2, 'Gonçalo Araújo Brandao', 'goncalo@gmail.com', 123, 'goncalinho', 'goncas10', '911111112', 'Maximinos', '4700-761', '7', 'Rua das Adegas Tristes'),
        (3, 'Simão Pedro Ferreira Antunes', 'simao@gmail.com', 234, 'simma', 'simao123', '911111113', 'Sameiro', '4700-762', '8', 'Rua das Flores'),
        (4, 'Maya Gomes', 'maya@gmail.com', 123, 'maya_gms', 'mayafrance', '911111114', 'Dadim', '4700-763', '9', 'Rua das Pedras'),
        (5, 'Mariana Filipa Morais Gonçalves', 'mariana@gmail.com', 456, 'marifilipa', 'mari', '911111115', 'Anjos', '4700-764', '10', 'Rua de Coimbra'),
        (6, 'Henriques Morais Pereira', 'henrique@gmail.com', 567, 'henrqp', 'vilareal123', '911111116', 'Vila Real', '4700-765', '11', 'Rua de Beja'),
        (7, 'Luis Caetano', 'luis@gmail.com', 678, 'lucae', 'lucae123', '911111117', 'Cacem', '4700-766', '12', 'Bairro dos pescadores'),
        (8, 'Gonçalo Duarte Marinho Gonçalves', 'goncalo2@gmail.com', 789, 'goncalves', 'marinho23', '911111118', 'Fafe', '4700-767', '13', 'Largo do arraial'),
        (9, 'Andre Miguel Alves Carvalho', 'andre@gmail.com', 890, 'andre_alves', 'andres', '911111119', 'Gamil', '4700-768', '14', 'Rua de Barros'),
        (10, 'João Alberto Costa Alves', 'joao@gmail.com', 901, 'jalves_1', 'jalves', '911111110', 'Panoias', '4700-768', '15', 'Passeio dos ares'),
        (11, 'Sara Silva', 'sara@gmail.com', 345, 'sara_silva', 'sara123', '911111121', 'Braga', '4700-769', '16', 'Rua dos Lírios'),
        (12, 'Rui Santos', 'rui@gmail.com', 456, 'rui_santos', 'rui123', '911111122', 'Bom Jesus', '4700-770', '17', 'Avenida Central'),
        (13, 'Miguel Ferreira', 'miguel@gmail.com', 567, 'miguel_ferreira', 'miguel123', '911111123', 'Gualtar', '4700-771', '18', 'Rua dos Cedros'),
        (14, 'Carla Martins', 'carla@gmail.com', 678, 'carla_martins', 'carla123', '911111124', 'Nogueiró', '4700-772', '19', 'Travessa dos Cravos'),
        (15, 'Ricardo Pereira', 'ricardo@gmail.com', 789, 'ricardo_pereira', 'ricardo123', '911111125', 'São Vicente', '4700-773', '20', 'Rua dos Girassóis'),
        (16, 'Inês Costa', 'ines@gmail.com', 890, 'ines_costa', 'ines123', '911111126', 'Gualtar', '4700-774', '21', 'Rua do Castelo'),
        (17, 'Marta Silva', 'marta@gmail.com', 901, 'marta_silva', 'marta123', '911111127', 'Bom Jesus', '4700-775', '22', 'Avenida da Liberdade'),
        (18, 'Ricardo Almeida', 'ricardo2@gmail.com', 123, 'ricardo_almeida', 'ricardo2', '911111128', 'Real', '4700-776', '23', 'Rua dos Jasmins'),
        (19, 'Rita Nunes', 'rita@gmail.com', 234, 'rita_nunes', 'rita123', '911111129', 'Ferreiros', '4700-777', '24', 'Travessa da Fonte'),
        (20, 'Filipe Rodrigues', 'filipe@gmail.com', 345, 'filipe_rodrigues', 'filipe123', '911111120', 'Gondizalves', '4700-778', '25', 'Rua dos Carvalhos'),
        (21, 'Bruno Martins', 'bruno@gmail.com', 456, 'bruno_martins', 'bruno123', '911111131', 'Tadim', '4700-779', '26', 'Rua das Flores'),
        (22, 'Sofia Pereira', 'sofia@gmail.com', 567, 'sofia_pereira', 'sofia123', '911111132', 'Sequeira', '4700-780', '27', 'Avenida das Acácias'),
        (23, 'Carlos Ribeiro', 'carlos@gmail.com', 678, 'carlos_ribeiro', 'carlos123', '911111133', 'Este', '4700-781', '28', 'Travessa dos Pinheiros'),
        (24, 'Lara Fernandes', 'lara@gmail.com', 789, 'lara_fernandes', 'lara123', '911111134', 'Celeirós', '4700-782', '29', 'Rua dos Lírios'),
        (25, 'Fábio Santos', 'fabio@gmail.com', 890, 'fabio_santos', 'fabio123', '911111135', 'São Lázaro', '4700-783', '30', 'Avenida Central'),
        (26, 'Inês Ferreira', 'ines2@gmail.com', 901, 'ines_ferreira', 'ines2', '911111136', 'Gualtar', '4700-784', '31', 'Rua das Oliveiras'),
        (27, 'Tiago Oliveira', 'tiago@gmail.com', 123, 'tiago_oliveira', 'tiago123', '911111137', 'Nogueiró', '4700-785', '32', 'Travessa dos Cravos'),
        (28, 'Marta Ribeiro', 'martar@gmail.com', 234, 'marta_ribeiro', 'marta123', '911111138', 'São Vicente', '4700-786', '33', 'Rua dos Girassóis'),
        (29, 'Alexandre Carvalho', 'alexandre@gmail.com', 345, 'alexandre_carvalho', 'alexandre123', '911111139', 'Gualtar', '4700-787', '34', 'Rua do Castelo'),
        (30, 'Ricardo Lima', 'ricardo3@gmail.com', 456, 'ricardo_lima', 'ricardo3', '911111140', 'Bom Jesus', '4700-788', '35', 'Avenida da Liberdade');



-- DELETE FROM Cliente;
-- SELECT * FROM Cliente;


-- ------------------------------------------------------
-- <fim>
-- Grupo 33, 2023
-- ------------------------------------------------------
