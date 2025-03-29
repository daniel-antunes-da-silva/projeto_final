SET GLOBAL local_infile = 1;
USE dados_saude;


-- Inserindo dados do arquivo de operadoras ativas (Relatorio_cadop.csv)
LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/Relatorio_cadop.csv'
INTO TABLE operadoras_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, 
 Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, 
 DDD, Telefone, Fax, Endereco_eletronico, Representante, 
 Cargo_Representante, Regiao_de_Comercializacao, @Data_Registro_ANS)
SET Data_Registro_ANS = STR_TO_DATE(@Data_Registro_ANS, '%Y-%m-%d');


-- Inserindo dados das demonstrações contábeis de cada arquivo
LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

-- Esse arquivo precisou de um ajuste, pois os dados dele estão aparecendo de uma forma diferente, gerando warning nas datas.
LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');

LOAD DATA LOCAL INFILE 'C:/Users/Daniel/Documents/Projetos Python/projeto_final/src/banco_de_dados/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%Y-%m-%d'),
    DESCRICAO = TRIM(@DESCRICAO),
    VL_SALDO_INICIAL = REPLACE(REPLACE(@VL_SALDO_INICIAL, '.', ''), ',', '.'),
    VL_SALDO_FINAL = REPLACE(REPLACE(@VL_SALDO_FINAL, '.', ''), ',', '.');