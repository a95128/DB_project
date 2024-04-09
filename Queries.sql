
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

-- Livros de um autor
SELECT Livro.*
FROM Livraria.Livro
WHERE Livro.Autor = 2;

-- Livros digitais
SELECT Livro.*
FROM Livraria.Livro
JOIN Livraria.Formato ON Livro.Formato = Formato.`Formato ID`
WHERE Formato.Digital = 1;

-- Lucro gerado por um cliente
SELECT SUM(c.Lucro) AS LucroTotal
FROM Livraria.Cliente cl
JOIN Livraria.CompraLivro clv ON cl.ID = clv.`Cliente ID`
JOIN Livraria.Compra c ON clv.`Compra ID` = c.ID
WHERE cl.ID = 8;

-- Vendas num dado intervalo de tempo
SELECT Compra.*
FROM Livraria.Compra
WHERE Data BETWEEN '2023-05-02 14:45:00' AND '2023-05-04 09:15:00';

-- Livros mais vendidos por ordem
SELECT Livro.Titulo, COUNT(*) AS TotalVendas
FROM Livraria.Livro
JOIN Livraria.Compra clv ON Livro.ID = clv.`Livro ID`
JOIN Livraria.CompraLivro c ON clv.ID = c.`Compra ID`
GROUP BY Livro.Titulo
ORDER BY TotalVendas DESC;

-- Lucro de todos os autores por ordem
SELECT a.idAutor, a.nome, SUM(c.Lucro) AS LucroTotal
FROM Livraria.Autor a
JOIN Livraria.Livro l ON a.idAutor = l.`Autor`
JOIN Livraria.Compra c ON l.`ID` = c.`Livro ID`
JOIN Livraria.CompraLivro clv ON c.ID = clv.`Compra ID`
GROUP BY a.idAutor, a.nome
ORDER BY LucroTotal DESC;

-- ------------------------------------------------------
-- <fim>
-- Grupo 33, 2023
-- ------------------------------------------------------
