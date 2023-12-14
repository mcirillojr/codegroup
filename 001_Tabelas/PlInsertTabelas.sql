-- Inserir clientes
INSERT INTO clientes (cliente_id, nome, email)
VALUES 
('000001', 'Marcio Pascoal Cirillo Jr.', 'mcirillojr@gmail.com');

INSERT INTO clientes (cliente_id, nome, email)
VALUES 
('000002', 'Marcio Cirillo', 'mcirillo@gmail.com');

INSERT INTO clientes (cliente_id, nome, email)
VALUES 
('000003', 'Marcio Pascoal Jr.', 'mpascoaljr@gmail.com');

-- Verificar dados na tabela clientes
SELECT * FROM clientes;

-- Inserir produtos
INSERT INTO produtos (produto_id, nome, preco)
VALUES ('0001', 'Tenis Nike Air Jordan', 800.00);

INSERT INTO produtos (produto_id, nome, preco)
VALUES ('0002', 'Tenis Adidas Originals', 600.00);

INSERT INTO produtos (produto_id, nome, preco)
VALUES ('0003', 'Tenis Nike Air Jordan II', 1500.00);

INSERT INTO produtos (produto_id, nome, preco)
VALUES ('0004', 'Tenis Converse Originals', 870.00);

-- Verificar dados na tabela produtos
SELECT * FROM produtos;

-- Inserir pedidos
INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
VALUES ('0001', '000001', SYSDATE, 0);

INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
VALUES ('0002', '000001', SYSDATE, 0);

INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
VALUES ('0003', '000001', SYSDATE, 0);

INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
VALUES ('0004', '000001', SYSDATE, 0);

-- Verificar dados na tabela pedidos
SELECT * FROM pedidos;

-- Excluir todos os dados da tabela pedidos
DELETE FROM pedidos;

-- Inserir itens_pedido
INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade)
VALUES
('001', '0001', '0001', 5);

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade)
VALUES
('002', '0001', '0002', 3);

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade)
VALUES
('003', '0001', '0003', 2);

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade)
VALUES
('004', '0001', '0004', 8);

-- Verificar dados na tabela itens_pedido
SELECT * FROM itens_pedido;

-- Excluir todos os dados da tabela itens_pedido
DELETE FROM itens_pedido;