CREATE SCHEMA CK_Store;

USE CK_Store;

-- Criar Tabela Produtos

CREATE TABLE produtos(
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
categoria VARCHAR(100),
preco DECIMAL(10,2),
estoque INT
);

-- Criar Tabela Clientes

CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100),
telefone VARCHAR(100)
);

-- Criar Tabela Vendas

CREATE TABLE vendas(
id_venda INT AUTO_INCREMENT PRIMARY KEY,
id_produto INT,
id_cliente INT,
FOREIGN KEY (id_produto) REFERENCES produtos (id_produto),
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
quantidade INT,
data_venda DATE
);

-- Cadastro de produtos

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES 
('iPhone 15 Pro Max', 'Smartphone', 10299.00, 10), 
('iPhone 15 Pro', 'Smartphone', 7499.00, 10),
('iPhone 15', 'Smartphone', 5999.00, 10),
('AirPods 4', 'Acessórios', 2199.00, 8),
('Carregador MagSafe', 'Acessórios', 449.99, 14);

-- Tabela de Cadastro de Clientes

INSERT INTO clientes (nome, email, telefone) VALUES
('Roberto Alisson', 'RobertoAlisson356@gmail.com', '(051) 92789-6789'),
('Geoclenio Pereira', 'GeoclenioPe55@gmail.com', '(021) 93344-3764'),
('Pedro Boarque', 'Boarque1998@hotmail.com', '(081) 99424-1988'),
('Gabriel joaquim', 'BielzinhoMestre033@gmail.com', '(081) 94556-3674'),
('Maria Vitoria', 'luisaSonzaPerfeita@gmail.com', '(033) 94562-3454');

-- Tabela de vendas REALIZADAS

INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda) VALUES
(1, 1, 4, '2024-08-10'),
(3, 2, 3, '2024-08-10'),
(4, 3, 2, '2024-08-12'),
(4, 1, 1, '2024-08-13'),
(2, 1, 9, '2024-08-14'),
(3, 1, 12, '2024-08-15'),
(1, 2, 5, '2024-08-16'),
(1, 1, 4, '2024-08-17'),
(2, 1, 3, '2024-08-18'),
(1, 1, 1, '2024-08-19');

-- Refresh de Produtos

UPDATE produtos
SET preco = 10199.00
WHERE id_produto = 1;

UPDATE clientes
SET telefone = '(021) 93344-3764'
WHERE id_cliente = 2;

DELETE FROM cliente
WHERE id_cliente = 1;

DELETE FROM produtos
WHERE id_produto = 5;


SELECT *
FROM produtos
WHERE categoria = 'Smartphone';

SELECT *
FROM vendas
WHERE data_venda = '2024-08-10';

SELECT *
FROM produtos
ORDER BY nome ASC;

SELECT *
FROM clientes
ORDER BY nome DESC;

SELECT
    clientes.id_cliente,
    clientes.nome,
    SUM(vendas.quantidade * produtos.preco) AS receita_total
FROM vendas
JOIN produtos ON vendas.id_produto = produtos.id_produto
JOIN clientes ON vendas.id_cliente = clientes.id_cliente
GROUP BY clientes.id_cliente;


-- Usando o WHERE para retornar todos os empregados da tabela

SELECT * FROM empregados
WHERE data_admissao > empregados;
