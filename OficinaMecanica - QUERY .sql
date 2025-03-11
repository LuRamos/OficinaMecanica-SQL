-- Quais são os nomes e especialidades dos mecânicos cadastrados na oficina?
SELECT Nome, Especialidade FROM Mecanico;
-- --------------------------------------------------------------------------

-- Quais serviços têm um valor de mão de obra superior a R$100?
SELECT Descricao, Valor_Mao_De_Obra
FROM Servico
WHERE Valor_Mao_De_Obra > 100;
-- --------------------------------------------------------------------------

-- Qual o valor total (incluindo peças e mão de obra) de cada ordem de serviço?
SELECT os.idOrdemDeServico AS ID_Ordem,
       c.Nome AS Nome_Cliente,
       v.Modelo AS Modelo_Veiculo,
       v.Placa AS Placa_Veiculo,
       os.Valor AS Valor_Mao_De_Obra,
       COALESCE(SUM(osp.Subtotal), 0) AS Total_Pecas,
       os.Valor + COALESCE(SUM(osp.Subtotal), 0) AS Valor_Total
FROM OrdemDeServico os
LEFT JOIN OSPeca osp ON os.idOrdemDeServico = osp.idOSPeca_OrdemDeServico
LEFT JOIN Veiculo v ON os.idOrdemDeServico_Veiculo = v.idVeiculo
LEFT JOIN Cliente c ON v.idVeiculo_Cliente = c.idCliente
GROUP BY os.idOrdemDeServico, c.Nome, v.Modelo, v.Placa, os.Valor
ORDER BY os.idOrdemDeServico;

-- --------------------------------------------------------------------------

--  Quais são os clientes com os maiores valores de ordens de serviço?
SELECT c.Nome AS Cliente, SUM(os.Valor) AS Total_Valor_Ordem
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idVeiculo_Cliente
JOIN OrdemDeServico os ON v.idVeiculo = os.idOrdemDeServico_Veiculo
GROUP BY c.idCliente
ORDER BY Total_Valor_Ordem DESC;
-- --------------------------------------------------------------------------

-- Quais equipes têm um valor total de ordens de serviço superior a R$500?
SELECT e.idEquipe, SUM(os.Valor) AS Total_Valor
FROM Equipe e
JOIN OrdemDeServico os ON e.idEquipe = os.idOrdemDeServico_Equipe
GROUP BY e.idEquipe
HAVING SUM(os.Valor) > 500;
-- --------------------------------------------------------------------------

-- Quais peças foram usadas em ordens de serviço que têm o status "Em Andamento"?
SELECT p.Nome_Peca, osp.Quantidade, os.Status
FROM Peca p
JOIN OSPeca osp ON p.idPeca = osp.idOSPeca_Peca
JOIN OrdemDeServico os ON osp.idOSPeca_OrdemDeServico = os.idOrdemDeServico
WHERE os.Status = 'Em Andamento';
-- --------------------------------------------------------------------------

-- Liste os mecânicos que fazem parte de equipes associadas a ordens de serviço, ordenando pelo nome do mecânico?
SELECT m.Nome AS Nome_Mecanico, e.idEquipe, os.Status
FROM Mecanico m
JOIN EquipesMecanicos em ON m.idMecanico = em.idEquipesMecanicos_Mecanico
JOIN Equipe e ON em.idEquipesMecanicos_Equipe = e.idEquipe
JOIN OrdemDeServico os ON e.idEquipe = os.idOrdemDeServico_Equipe
ORDER BY m.Nome;
-- --------------------------------------------------------------------------

--  Quais serviços têm um valor total (mão de obra + peças) superior a R$200 em ordens de serviço concluídas?
SELECT s.Descricao, 
       SUM(s.Valor_Mao_De_Obra) + SUM(osp.Subtotal) AS Valor_Total
FROM Servico s
JOIN OSServico os ON s.idServico = os.idOSServico_Servico
JOIN OrdemDeServico osd ON os.idOSServico_OrdemDeServico = osd.idOrdemDeServico
JOIN OSPeca osp ON osd.idOrdemDeServico = osp.idOSPeca_OrdemDeServico
WHERE osd.Status = 'Concluída'
GROUP BY s.idServico
HAVING Valor_Total > 200;
-- --------------------------------------------------------------------------

-- Quais clientes estão associados a veículos com o modelo "Fiesta" e qual o status da ordem de serviço relacionada?
SELECT c.Nome, v.Modelo, os.Status
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idVeiculo_Cliente
JOIN OrdemDeServico os ON v.idVeiculo = os.idOrdemDeServico_Veiculo
WHERE v.Modelo = 'Fiesta'
ORDER BY c.Nome;
-- --------------------------------------------------------------------------


-- Quais serviços e peças são mais frequentes em ordens de serviço e ordene por frequência decrescente?
SELECT s.Descricao, p.Nome_Peca, COUNT(*) AS Frequencia
FROM OSServico os
JOIN Servico s ON os.idOSServico_Servico = s.idServico
JOIN OSPeca osp ON os.idOSServico_OrdemDeServico = osp.idOSPeca_OrdemDeServico
JOIN Peca p ON osp.idOSPeca_Peca = p.idPeca
GROUP BY s.idServico, p.idPeca
ORDER BY Frequencia DESC;
-- --------------------------------------------------------------------------

-- Exibe o ID das equipes e os mecânicos que pertencem a cada uma delas
SELECT e.idEquipe AS ID_Equipe, 
       m.idMecanico AS ID_Mecanico, 
       m.Nome AS Nome_Mecanico
FROM Equipe e
JOIN EquipesMecanicos em ON e.idEquipe = em.idEquipesMecanicos_Equipe
JOIN Mecanico m ON em.idEquipesMecanicos_Mecanico = m.idMecanico
ORDER BY e.idEquipe, m.Nome;
