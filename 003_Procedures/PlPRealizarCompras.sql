CREATE OR REPLACE PROCEDURE realizar_compra (
    p_cliente_id IN NUMBER,
    p_produto_id IN NUMBER,
    p_quantidade IN NUMBER
)
IS
    v_last_pedido_id pedidos.pedido_id%TYPE;
    mensagem_erro_cliente VARCHAR2(255);
    mensagem_erro_produto VARCHAR2(255);
    mensagem_erro_transacao VARCHAR2(255);
    v_cliente_count NUMBER;
    v_produto_count NUMBER;

BEGIN
    -- Desativa a contagem de linhas afetadas
    DBMS_OUTPUT.ENABLE(NULL);

    -- Iniciar transa��o
    BEGIN
        -- Verificar se o cliente existe
        SELECT COUNT(*) INTO v_cliente_count
        FROM clientes
        WHERE cliente_id = p_cliente_id;

        IF v_cliente_count = 0 THEN
            mensagem_erro_cliente := 'Erro: Cliente n�o encontrado.';
            DBMS_OUTPUT.PUT_LINE(mensagem_erro_cliente);
            RETURN;
        END IF;

        -- Verificar se o produto existe
        SELECT COUNT(*) INTO v_produto_count
        FROM produtos
        WHERE produto_id = p_produto_id;

        IF v_produto_count = 0 THEN
            mensagem_erro_produto := 'Erro: Produto n�o encontrado.';
            DBMS_OUTPUT.PUT_LINE(mensagem_erro_produto);
            RETURN;
        END IF;

        -- Inserir novo pedido
        BEGIN
            LOOP
                BEGIN
                    -- Tentar inserir com um novo valor da sequ�ncia
                    INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total_pedido)
                    VALUES (pedidos_seq.nextval, p_cliente_id, SYSDATE, 0)
                    RETURNING pedido_id INTO v_last_pedido_id;

                    -- Sair do loop se a inser��o for bem-sucedida
                    EXIT;
                EXCEPTION
                    -- Lidar com exce��o de viola��o de chave prim�ria
                    WHEN DUP_VAL_ON_INDEX THEN
                        CONTINUE;
                END;
            END LOOP;

            -- Inserir novo item no pedido
            INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade)
            VALUES (itens_pedido_seq.nextval, v_last_pedido_id, p_produto_id, p_quantidade);

            -- Atualizar o total do pedido
            UPDATE pedidos
            SET total_pedido = calcular_total_pedido(v_last_pedido_id)
            WHERE pedido_id = v_last_pedido_id;

            -- Commit
            COMMIT;

            DBMS_OUTPUT.PUT_LINE('Pedido criado com sucesso. ID do Pedido: ' || TO_CHAR(v_last_pedido_id));
        EXCEPTION
            -- Lidar com exce��es espec�ficas, se necess�rio
            WHEN OTHERS THEN
                ROLLBACK;
                mensagem_erro_transacao := 'Erro durante a transa��o. Detalhes: ' || SQLERRM;
                DBMS_OUTPUT.PUT_LINE(mensagem_erro_transacao);
                RETURN;
        END;
    EXCEPTION
        -- Lidar com exce��es gerais
        WHEN OTHERS THEN
            ROLLBACK;
            mensagem_erro_transacao := 'Erro durante a transa��o. Detalhes: ' || SQLERRM;
            DBMS_OUTPUT.PUT_LINE(mensagem_erro_transacao);
            RETURN;
    END;
END realizar_compra;
/
