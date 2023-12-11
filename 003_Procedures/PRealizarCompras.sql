CREATE OR ALTER PROCEDURE [dbo].[realizar_compra]
    @p_cliente_id INT,
    @p_produto_id INT,
    @p_quantidade INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @pedido_id INT;

  
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE cliente_id = @p_cliente_id)
    BEGIN
        DECLARE @mensagemErroCliente NVARCHAR(255) = 'Erro: Cliente não encontrado.';
        THROW 50000, @mensagemErroCliente, 1;
        RETURN; -- Sai da procedure em caso de erro
    END


    IF NOT EXISTS (SELECT 1 FROM produtos WHERE produto_id = @p_produto_id)
    BEGIN
        DECLARE @mensagemErroProduto NVARCHAR(255) = 'Erro: Produto não encontrado.';
        THROW 50000, @mensagemErroProduto, 1;
        RETURN; 
    END

    BEGIN TRY
        
        BEGIN TRANSACTION;

        
        INSERT INTO pedidos (cliente_id, data_pedido, total_pedido)
        VALUES (@p_cliente_id, GETDATE(), 0);

        
        SET @pedido_id = SCOPE_IDENTITY();

    
        INSERT INTO itens_pedido (pedido_id, produto_id, quantidade)
        VALUES (@pedido_id, @p_produto_id, @p_quantidade);

       
        UPDATE pedidos
        SET total_pedido = dbo.calcular_total_pedido(@pedido_id)
        WHERE pedido_id = @pedido_id;

           COMMIT;

       
        PRINT 'Pedido criado com sucesso. ID do Pedido: ' + CAST(@pedido_id AS VARCHAR);
    END TRY
    BEGIN CATCH
        
        IF @@TRANCOUNT > 0
            ROLLBACK;

     
        DECLARE @mensagemErroTransacao NVARCHAR(255) = 'Erro durante a transação.';
        THROW 50000, @mensagemErroTransacao, 1;
    END CATCH;
END;
GO
