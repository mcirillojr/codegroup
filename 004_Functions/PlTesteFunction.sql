DECLARE
    v_pedido_id NUMBER := 2;
    v_total_pedido NUMBER;
BEGIN
    v_total_pedido := HR.calcular_total_pedido(v_pedido_id);

    IF v_total_pedido IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Total do Pedido ' || v_pedido_id || ': ' || TO_CHAR(v_total_pedido));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Pedido ' || v_pedido_id || ' não encontrado.');
    END IF;
END;
/