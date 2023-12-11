CREATE OR ALTER FUNCTION [dbo].[calcular_total_pedido](@p_pedido_id INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @v_total NUMERIC(15, 3) = 0;

    
    IF NOT EXISTS (SELECT 1 FROM pedidos WHERE pedido_id = @p_pedido_id)
    BEGIN
        
        RETURN 'Pedido Nao Encontrado'; 
    END

    
    SELECT @v_total = COALESCE(SUM(ip.quantidade * pr.preco), 0)
    FROM itens_pedido ip
    JOIN produtos pr ON ip.produto_id = pr.produto_id
    WHERE ip.pedido_id = @p_pedido_id;

    
    RETURN CAST(@v_total AS NVARCHAR(100));
END;
GO