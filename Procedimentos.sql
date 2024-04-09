
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

-- Procedimento para inserir um novo livro
DELIMITER //

CREATE PROCEDURE InserirLivro(
	IN id INT,
    IN genero VARCHAR(45),
    IN formato INT,
    IN quantidade INT,
    IN titulo VARCHAR(45),
    IN autor INT,
    IN editora INT,
    IN edicao VARCHAR(45),
    IN rating INT,
    IN preco DECIMAL(5,2),
    IN estado INT
)
BEGIN
    INSERT INTO Livro (ID, Genero, Formato, Quantidade, Titulo, Autor, Editora, Edição, Rating, Preço, Estado)
    VALUES (id, genero, formato, quantidade, titulo, autor, editora, edicao, rating, preco, estado);
END //

DELIMITER ;

-- Procedimento para atualizar a quantidade de um livro
DELIMITER //

CREATE PROCEDURE AtualizarQuantidadeLivro(
    IN livro_id INT,
    IN nova_quantidade INT
)
BEGIN
    UPDATE Livro
    SET Quantidade = nova_quantidade
    WHERE ID = livro_id;
END //

DELIMITER ;

-- ------------------------------------------------------
-- <fim>
-- Grupo 33, 2023
-- ------------------------------------------------------
