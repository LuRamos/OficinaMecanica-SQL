-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (Nome, Endereco, Especialidade, CPF) VALUES
('Carlos Silva', 'Rua A, 123', 'Motorista', '123.456.789-00'),
('João Souza', 'Rua B, 456', 'Eletricista', '234.567.890-11'),
('Maria Oliveira', 'Rua C, 789', 'Pintura', '345.678.901-22'),
('José Santos', 'Rua D, 101', 'Suspensão', '456.789.012-33'),
('Ana Costa', 'Rua E, 202', 'Arrefecimento', '567.890.123-44');

-- Inserindo dados na tabela Servico
INSERT INTO Servico (Descricao, Valor_Mao_De_Obra) VALUES
('Troca de óleo', 50.00),
('Alinhamento de rodas', 120.00),
('Troca de bateria', 200.00),
('Troca de pastilhas de freio', 150.00),
('Troca de filtros', 80.00);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, Telefone, CPF, Email) VALUES
('Paulo Almeida', '987654321', '789.123.456-78', 'paulo@exemplo.com'),
('Juliana Lima', '912345678', '890.234.567-89', 'juliana@exemplo.com'),
('Felipe Martins', '923456789', '901.345.678-90', 'felipe@exemplo.com'),
('Cláudia Costa', '934567890', '012.456.789-01', 'claudia@exemplo.com'),
('Renato Souza', '945678901', '123.567.890-12', 'renato@exemplo.com');

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe () VALUES
(),
(),
(),
(),
();

-- Inserindo dados na tabela Peca
INSERT INTO Peca (Nome_Peca, Valor_Peca) VALUES
('Filtro de óleo', 15.00),
('Pastilha de freio', 40.00),
('Bateria 12V', 180.00),
('Filtro de ar', 25.00),
('Óleo 5W30', 30.00);

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (idVeiculo_Cliente, Placa, Modelo, Marca, Ano) VALUES
(1, 'ABC-1234', 'Fusca', 'Volkswagen', 1985),
(2, 'XYZ-5678', 'Civic', 'Honda', 2015),
(3, 'LMN-9012', 'Fiesta', 'Ford', 2010),
(4, 'DEF-3456', 'Onix', 'Chevrolet', 2018),
(5, 'GHI-7890', 'Palio', 'Fiat', 2012);

-- Inserindo dados na tabela OrdemDeServico
INSERT INTO OrdemDeServico (idOrdemDeServico_Veiculo, idOrdemDeServico_Equipe, Data_Emissao, Valor, Status, Data_Conclusao) VALUES
(1, 1, '2025-03-01', 50.00, 'Aberta', NULL),
(2, 2, '2025-03-02', 120.00, 'Em Andamento', NULL),
(3, 3, '2025-03-03', 200.00, 'Em Andamento', NULL),
(4, 4, '2025-03-04', 150.00, 'Concluída', '2025-03-06'),
(5, 5, '2025-03-05', 80.00, 'Cancelada', NULL),
(3, 1, '2025-03-06', 600.00, 'Concluída', '2025-03-07');


-- Inserindo dados na tabela ReferenciaMaoDeObra
INSERT INTO ReferenciaMaoDeObra (idReferenciaMaoDeObra_Servico, Tempo_Estimado, Custo) VALUES
(1, '01:00:00', 50.00),
(2, '02:00:00', 120.00),
(3, '03:00:00', 200.00),
(4, '01:30:00', 150.00),
(5, '00:45:00', 80.00);

-- Inserindo dados na tabela AutorizacaoCliente
INSERT INTO AutorizacaoCliente (idAutorizacaoCliente_Cliente, idAutorizacaoCliente_OrdemDeServico, Data_Autorizacao, Status) VALUES
(1, 1, '2025-03-01', 'Aprovado'),
(2, 2, '2025-03-02', 'Pendente'),
(3, 3, '2025-03-03', 'Rejeitado'),
(4, 4, '2025-03-04', 'Aprovado'),
(5, 5, '2025-03-05', 'Pendente');

-- Inserindo dados na tabela EquipesMecanicos
INSERT INTO EquipesMecanicos (idEquipesMecanicos_Equipe, idEquipesMecanicos_Mecanico) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

-- Inserindo dados na tabela OSPeca
INSERT INTO OSPeca (idOSPeca_Peca, idOSPeca_OrdemDeServico, Quantidade, Subtotal) VALUES
(1, 1, 2, 30.00),
(2, 2, 1, 40.00),
(3, 3, 1, 180.00),
(4, 4, 3, 75.00),
(5, 5, 5, 125.00);

-- Inserindo dados na tabela OSServico
INSERT INTO OSServico (idOSServico_Servico, idOSServico_OrdemDeServico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
