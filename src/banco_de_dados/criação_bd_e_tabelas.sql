-- Cria o banco de dados com encoding utf-8
CREATE DATABASE IF NOT EXISTS dados_saude
CHARACTER SET utf8mb4;


-- Cria tabelas no banco de dados criado anteriormente
USE dados_saude;

CREATE TABLE IF NOT EXISTS operadoras_ativas (
    Registro_ANS VARCHAR(6) PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    Razao_Social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Logradouro VARCHAR(255),
    Numero VARCHAR(100),
    Complemento VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(8),
    DDD VARCHAR(2),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(100),
    Cargo_Representante VARCHAR(100),
    Regiao_de_Comercializacao CHAR(1),
    Data_Registro_ANS DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    DATA DATE NOT NULL,
    REG_ANS VARCHAR(6) NOT NULL,
    CD_CONTA_CONTABIL VARCHAR(20) NOT NULL,
    DESCRICAO VARCHAR(255) NOT NULL,
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


