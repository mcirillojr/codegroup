CREATE OR REPLACE TRIGGER calcular_total_pedido_trigger
AFTER INSERT ON itens_pedido
FOR EACH ROW
DECLARE
    v_pedido_id pedidos.pedido_id%TYPE;
BEGIN
    -- Obtendo o pedido_id do novo item inserido
    v_pedido_id := :new.pedido_id;

    -- Atualizando o total do pedido
    UPDATE pedidos
    SET total_pedido = calcular_total_pedido(v_pedido_id)
    WHERE pedido_id = v_pedido_id;
END;
/
