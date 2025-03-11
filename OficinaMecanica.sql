-- criação database oficina mecânica
CREATE DATABASE Oficina_Mecanica;
USE Oficina_Mecanica;





-- Tabelas Principais

CREATE TABLE Mecanico(
	idMecanico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    Especialidade VARCHAR(50) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE
    );


CREATE TABLE Servico(
	idServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Descricao VARCHAR(510) NOT NULL,
    Valor_Mao_De_Obra DECIMAL(10,2) NOT NULL
    );
    
    
    
CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL
);


CREATE TABLE Equipe(
	idEquipe INT PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE Peca(
	idPeca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Peca VARCHAR(50) NOT NULL,
    Valor_Peca DECIMAL(10,2) NOT NULL
);

CREATE TABLE Veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idVeiculo_Cliente INT NOT NULL,
	Placa VARCHAR(20) NOT NULL UNIQUE,
    Modelo VARCHAR(30) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
    Ano INT NOT NULL,
    FOREIGN KEY (idVeiculo_Cliente) REFERENCES CLiente (idCliente)
);

CREATE TABLE OrdemDeServico(
	idOrdemDeServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idOrdemDeServico_Veiculo INT NOT NULL,
    idOrdemDeServico_Equipe INT NOT NULL,
	Data_Emissao DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Status ENUM('Aberta', 'Em Andamento', 'Concluída', 'Cancelada') NOT NULL,
    Data_Conclusao DATE NULL,
    FOREIGN KEY (idOrdemDeServico_Veiculo) REFERENCES Veiculo (idVeiculo),
    FOREIGN KEY (idOrdemDeServico_Equipe) REFERENCES Equipe (idEquipe)
);


CREATE TABLE ReferenciaMaoDeObra(
	idReferenciaMaoDeObra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idReferenciaMaoDeObra_Servico INT NOT NULL,
	Tempo_Estimado TIME NOT NULL,
    Custo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idReferenciaMaoDeObra_Servico) REFERENCES Servico(idServico)
);

CREATE TABLE AutorizacaoCliente(
	idAutorizacaoCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idAutorizacaoCliente_Cliente INT NOT NULL,
    idAutorizacaoCliente_OrdemDeServico INT NOT NULL,
	Data_Autorizacao DATE NOT NULL,
    Status ENUM('Aprovado', 'Rejeitado', 'Pendente') NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (idAutorizacaoCliente_Cliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idAutorizacaoCliente_OrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico)
);





-- Tabelas de Relacionamentos
CREATE TABLE EquipesMecanicos(
	idEquipesMecanicos_Equipe INT NOT NULL,
    idEquipesMecanicos_Mecanico INT NOT NULL,
    PRIMARY KEY(idEquipesMecanicos_Equipe, idEquipesMecanicos_Mecanico),
    FOREIGN KEY(idEquipesMecanicos_Equipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY(idEquipesMecanicos_Mecanico) REFERENCES Mecanico(idMecanico)    
);

CREATE TABLE OSPeca(
	idOSPeca_Peca INT NOT NULL,
    idOSPeca_OrdemDeServico INT NOT NULL,
    Quantidade INT NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(idOSPeca_Peca, idOSPeca_OrdemDeServico),
    FOREIGN KEY(idOSPeca_Peca) REFERENCES Peca(idPeca),
    FOREIGN KEY(idOSPeca_OrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico)    
);

CREATE TABLE OSServico(
	idOSServico_Servico INT NOT NULL,
    idOSServico_OrdemDeServico INT NOT NULL,
    PRIMARY KEY(idOSServico_Servico, idOSServico_OrdemDeServico),
    FOREIGN KEY(idOSServico_Servico) REFERENCES Servico(idServico),
    FOREIGN KEY(idOSServico_OrdemDeServico) REFERENCES OrdemDeServico(idOrdemDeServico)    
);






