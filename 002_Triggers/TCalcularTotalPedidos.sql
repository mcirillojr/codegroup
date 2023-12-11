CREATE OR ALTER TRIGGER calcular_total_pedido_trigger
ON itens_pedido
AFTER INSERT
AS
BEGIN
    DECLARE @pedido_id INT;

    SELECT @pedido_id = inserted.pedido_id
    FROM inserted;

    UPDATE pedidos
    SET total_pedido = dbo.calcular_total_pedido(@pedido_id)
    WHERE pedido_id = @pedido_id;
END;