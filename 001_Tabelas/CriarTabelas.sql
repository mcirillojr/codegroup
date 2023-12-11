-- ----------------------------------------------------- 
-- Table Produtos
-- ----------------------------------------------------- 
CREATE TABLE produtos (
    produto_id int PRIMARY KEY,
    nome VARCHAR(50),
    preco numeric(15,2)
);
-- ----------------------------------------------------- 
-- Table Clientes 
-- ----------------------------------------------------- 
CREATE TABLE clientes (
    cliente_id int PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50),
    email VARCHAR(50)
);
-- ----------------------------------------------------- 
-- Table Pedidos 
-- ----------------------------------------------------- 
CREATE TABLE pedidos (
    pedido_id int PRIMARY KEY IDENTITY(1,1),
    cliente_id int,
    data_pedido DATE,
    total_pedido numeric(15,3)
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
-- ----------------------------------------------------- 
-- Table Itens Pedido
-- ----------------------------------------------------- 
CREATE TABLE itens_pedido (
    item_id int PRIMARY KEY IDENTITY(1,1),
    pedido_id int,
    produto_id int,
    quantidade int,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
