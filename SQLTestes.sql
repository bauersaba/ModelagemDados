SELECT * FROM Cliente;
INSERT INTO Cliente(Nome, Telefone, Rua, Bairro)
VALUES ('Marcelo Bauer', 11111, 'Rua 1', 'Horto');

INSERT INTO Cliente(Nome, Telefone, Rua, Bairro)
VALUES ('Jonas Moreira', 22222, 'Rua 2', 'Horto');

INSERT INTO cardapio(Ingredientes, Tamanho, Valor, Sabor)
VALUES ('Calabresa, cebola, requeijão', 'Grande', 25.00, 'Calabresa'),
	   ('Calabresa, cebola, requeijão', 'Média', 22.00, 'Calabresa'),
       ('Calabresa, cebola, requeijão', 'Pequena', 20.00, 'Calabresa');

INSERT INTO cardapio(Ingredientes, Tamanho, Valor, Sabor)
VALUES ('Queijo mussarela e molho de tomate', 'Média', 20.00, 'Mussarela'),
	   ('Queijo mussarela e molho de tomate', 'Grande', 25.00, 'Mussarela'),
       ('Queijo mussarela e molho de tomate', 'Pequena', 18.00, 'Mussarela');

INSERT INTO cardapio(Ingredientes, Tamanho, Valor, Sabor)
VALUES ('Frango, mussarela, catupiry', 'Pequena', 18.00, 'Frango Catupiry'),
	   ('Frango, mussarela, catupiry', 'Média', 20.00, 'Frango Catupiry'),
       ('Frango, mussarela, catupiry', 'Grande', 25.00, 'Frango Catupiry');

INSERT INTO dev_pizza(Unidade, CNPJ, Cidade)
VALUES ('UNASP', 12345678, 'Hortolândia');      

INSERT INTO pedido(Cod_cliente, Cod_Sabor, Quantidade, Total_Pagar,fk_Cliente_Cod_cliente,fk_cardapio_Cod_Sabor)
VALUES (2, 1, 1, 35.00, 2 ,1 );

DELIMITER //


CREATE PROCEDURE BuscaCliente(IN VALOR VARCHAR(50))

	BEGIN 
		SELECT * FROM cliente WHERE VALOR IN (Nome,Telefone,Rua,Bairro);
                  
	END //
    
call BuscaCliente('Horto')

DELIMITER //


CREATE PROCEDURE InserirCliente(IN nome VARCHAR(50), IN telefone VARCHAR(50), IN rua VARCHAR(50),IN bairro VARCHAR(50) )

	BEGIN 
		INSERT INTO Cliente(Nome, Telefone, Rua, Bairro)
		VALUES (nome,telefone,rua,bairro);
                  
	END //
    
call InserirCliente('Gustavo','Rua alberto,75','Matão','96299332');

CREATE PROCEDURE InserirPedido(IN codcliente int, IN codsabor int, IN quantidade int, IN totalpagar double, in fkcliente int, in fksabor int)

	BEGIN 
		INSERT INTO pedido(Cod_cliente, Cod_Sabor, Quantidade, Total_Pagar, fk_Cliente_Cod_cliente, fk_cardapio_Cod_Sabor)
		VALUES (codcliente, codsabor, quantidade, totalpagar, fkcliente , fksabor);
                  
	END //
    
call InserirPedido(3,4,2,35,3,4);


CREATE PROCEDURE InserirCardapio(IN ingrediente VARCHAR(150), IN tamanho varchar(50), IN valor float, IN sabor varchar(50))

	BEGIN 
		INSERT INTO cardapio(Ingredientes, Tamanho, Valor, Sabor)
		VALUES (ingrediente, tamanho, valor, sabor);
                  
	END //
    
call InserirCardapio('Mussarela, Manjericão e Tomate','Pequena',25.00,'Manjericão');

DELIMITER //

CREATE PROCEDURE AtualizarCliente(IN ID INT, IN nome VARCHAR(50), IN rua VARCHAR(50), IN bairro VARCHAR(50),IN telefone VARCHAR(50) )

	BEGIN 
		UPDATE Cliente SET Nome = nome, Rua = rua, Bairro = bairro, Telefone = telefone 
        WHERE Cod_cliente = ID;
                  
	END //
    
call AtualizarCliente(5,'Antonio','Rua Açucenas,103','Malta','98774788')

DELIMITER //

CREATE PROCEDURE AtualizarCardapio(IN ID INT,IN ingrediente VARCHAR(150), IN tamanho varchar(50), IN valor float, IN sabor varchar(50))

	BEGIN 
		UPDATE Cardapio SET Ingredientes = ingrediente, Tamanho = tamanho, Valor = valor, Sabor = Sabor 
        WHERE Cod_Sabor = ID;
                  
	END //
    
 call AtualizarCardapio(12,'Mussarela, Manjericão e Tomate','Pequena',45.00,'Manjericão');  
 
 DELIMITER //
 
 CREATE PROCEDURE DeletaCliente(IN ID INT)

	BEGIN 
		DELETE FROM cliente WHERE Cod_cliente = ID;
                  
	END //
    
    call DeletaCliente(5);
    
DELIMITER //
 
 CREATE PROCEDURE DeletaPedido(IN ID INT)

	BEGIN 
		DELETE FROM pedido WHERE Nu_pedido = ID;
                  
	END //
 
 call DeletaPedido(3);
 
 DELIMITER //
 
 CREATE PROCEDURE DeletaSabor(IN ID INT)

	BEGIN 
		DELETE FROM cardapio WHERE Cod_Sabor = ID;
                  
	END //

DELIMITER $$
CREATE TRIGGER DeletaPedido
	AFTER DELETE
	ON cliente FOR EACH ROW
	BEGIN
		delete from pedido where Cod_cliente = old.Cod_cliente;
	END $$
    DELIMITER $$

DELIMITER $$

CREATE FUNCTION DeletaPedido(clienteID int)
RETURNS INT
DETERMINISTIC
BEGIN
		delete from pedido where Cod_cliente = clienteID;
		set control = 1;
		RETURN (control);
END $$
DELIMITER ;

CREATE VIEW PedidosEfetuados AS SELECT
pe.Nu_pedido, cl.Nome,ca.Sabor,pe.Quantidade,pe.Total_pagar from pedido as pe
inner join cliente as cl on pe.Cod_cliente = cl.Cod_cliente
inner join cardapio as ca on pe.Cod_Sabor = ca.Cod_Sabor;

SELECT * FROM PedidosEfetuados;

delete from cliente where Cod_cliente = 15;

DELIMITER //


CREATE PROCEDURE BuscaPedido(IN VALOR int)

	BEGIN 
		SELECT * FROM pedido WHERE Nu_pedido = VALOR;
                  
	END //





