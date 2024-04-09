
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

-- Vista dos livros disponíveis
CREATE VIEW LivrosDisponiveis AS
SELECT L.ID, L.Titulo, L.Genero, L.Quantidade, L.Preço, A.nome AS Autor, E.nome AS Editora
FROM Livro L
JOIN Autor A ON L.Autor = A.idAutor
JOIN Editora E ON L.Editora = E.idEditora
WHERE L.Estado = 1;

-- Vista de compras por cliente
CREATE VIEW ComprasPorCliente AS
SELECT C.ID AS ClienteID, C.Nome AS ClienteNome, COUNT(CL.idCompraLivro) AS TotalCompras
FROM Cliente C
LEFT JOIN CompraLivro CL ON C.ID = CL.`Cliente ID`
GROUP BY C.ID, C.Nome;

-- Vista dos livros por autor
CREATE VIEW LivrosPorAutor AS
SELECT A.nome AS Autor, COUNT(L.ID) AS TotalLivros
FROM Autor A
LEFT JOIN Livro L ON A.idAutor = L.Autor
GROUP BY A.nome;

-- SELECT * FROM LivrosDisponiveis

-- ------------------------------------------------------
-- <fim>
-- Grupo 33, 2023
-- ------------------------------------------------------
