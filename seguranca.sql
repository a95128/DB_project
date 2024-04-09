-- SEGURANÇA SQL

-- Administrador

CREATE USER 'Administrador' @ 'localhost'
	identified by 'adminpassword';
GRANT SELECT, INSERT, DELETE, UPDATE ON *.* TO 'Administrador' @ 'localhost';
REVOKE DROP, CREATE ON *.*  FROM 'Administrador' @ 'localhost';

-- Funcionario 

CREATE USER 'Funcionario' @ 'localhost'
	identified by 'funcpassword';
    
GRANT SELECT ON Livraria.Livro TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Formato TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Editora TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Estado TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Cliente TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.CompraLivro TO 'Cliente'@'localhost';  

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.Livro
FROM 'Funcionario' @ 'localhost';

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.Formato
FROM 'Funcionario' @ 'localhost';

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.Editora
FROM 'Funcionario' @ 'localhost';

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.Estado
FROM 'Funcionario' @ 'localhost';

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.Cliente
FROM 'Funcionario' @ 'localhost';

REVOKE DROP,CREATE,DELETE,UPDATE,INSERT
ON Livraria.CompraLivro
FROM 'Funcionario' @ 'localhost';

-- Cliente
CREATE USER  'Cliente'@'localhost'
	identified by 'clientepassword';
GRANT SELECT ON Livraria.Livro TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Formato TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Editora TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Estado TO 'Cliente'@'localhost';
GRANT SELECT ON Livraria.Autor TO 'Cliente'@'localhost';


GRANT SELECT, DELETE, UPDATE
ON Livraria.Cliente [ID, Nome, Email, NIF, Username, `Palavra-Passe`, `Numero de telemovel`, Localidade, `Codigo Postal`, `N da Porta`, Rua]
TO  'Cliente'@'localhost';
GRANT SELECT, DELETE, INSERT, UPDATE ON Livraria.Cliente TO 'Cliente'@'localhost';

REVOKE DROP, CREATE
ON Livraria.Cliente
FROM 'Cliente'@'localhost';









