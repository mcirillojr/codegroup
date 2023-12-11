-- Teste de função
DECLARE @pedido_id_teste INT = 20; 

DECLARE @total_pedido NVARCHAR(100);  

SELECT @total_pedido = dbo.calcular_total_pedido(@pedido_id_teste);

SELECT 'Total do Pedido' AS Descricao, @total_pedido AS Resultado;


