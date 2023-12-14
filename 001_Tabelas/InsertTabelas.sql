insert clientes (nome, email)
values 
('Marcio Pascoal Cirillo Jr.', 'mcirillojr@gmail.com'),
('Marcio Cirillo', 'mcirillojr@gmail.com'),
('Marcio Pascoal Jr.', 'mcirillojr@gmail.com')

select * from clientes

insert produtos (produto_id, nome, preco)
values ('0001', 'Tenis Nike Air Jordan', '800.00')

insert produtos (produto_id, nome, preco)
values ('0002', 'Tenis Adidas Originals', '600.00')

insert produtos (produto_id, nome, preco)
values ('0003', 'Tenis Nike Air Jordan II', '1500.00')

insert produtos (produto_id, nome, preco)
values ('0004', 'Tenis Converse Originals', '870.00')

select * from produtos

insert pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
values ('0001', '000001', getdate(), '0')

insert pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
values ('0002', '000001', getdate(), '0')

insert pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
values ('0003', '000001', getdate(), '0')

insert pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
values ('0004', '000001', getdate(), '0')

select * from pedidos
delete pedidos

insert itens_pedido (item_id, pedido_id, produto_id, quantidade)
values
('001', '0001', '0001', '5'),
('002', '0001', '0002', '3'),
('003', '0001', '0003', '2'),
('004', '0001', '0004', '8')

insert itens_pedido (item_id, pedido_id, produto_id, quantidade)
values
('005', '0002', '0001', '10'),
('006', '0002', '0002', '5'),
('007', '0002', '0003', '3'),
('008', '0002', '0004', '1')


insert itens_pedido (item_id, pedido_id, produto_id, quantidade)
values
('009', '0003', '0002', '5'),
('010', '0003', '0003', '3'),
('011', '0003', '0004', '1')

insert itens_pedido (item_id, pedido_id, produto_id, quantidade)
values
('012', '0004', '0001', '3'),
('013', '0004', '0002', '2'),
('014', '0004', '0003', '8'),
('015', '0004', '0004', '5')



select * from itens_pedido
delete itens_pedido


