create or replace FUNCTION HR.calcular_total_pedido(p_pedido_id IN NUMBER)
RETURN NUMBER
IS
    v_total NUMBER(15, 2);
BEGIN
    -- Lógica para calcular o total do pedido
    SELECT COALESCE(SUM(ip.quantidade * pr.preco), NULL)
    INTO v_total
    FROM itens_pedido ip
    JOIN produtos pr ON ip.produto_id = pr.produto_id
    WHERE ip.pedido_id = p_pedido_id;

    RETURN v_total;
END calcular_total_pedido;