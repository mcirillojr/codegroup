CREATE OR REPLACE TRIGGER HR.calcular_total_pedido_trigger
AFTER INSERT ON itens_pedido
DECLARE
    CURSOR c_itens_pedido IS
        SELECT DISTINCT pedido_id FROM itens_pedido;

    v_pedido_id pedidos.pedido_id%TYPE;
    v_total_pedido NUMBER(15,3);
BEGIN
    
    FOR r_pedido IN c_itens_pedido LOOP
        v_pedido_id := r_pedido.pedido_id;

        -- Chamando a função calcular_total_pedido diretamente usando variáveis locais
        SELECT calcular_total_pedido(v_pedido_id) INTO v_total_pedido FROM dual;

        -- Atualizando o total do pedido
        UPDATE pedidos
        SET total_pedido = v_total_pedido
        WHERE pedido_id = v_pedido_id;
    END LOOP;
END;
/


