# 📦 Modelagem de Banco de Dados para Sistema de Oficina Mecânica

Bem-vindo ao README da modelagem de banco de dados para um sistema de oficina mecânica! Esta modelagem foi desenvolvida para gerenciar todas as informações relacionadas aos clientes, veículos, serviços realizados, ordens de serviço, peças, mecânicos e muito mais, garantindo eficiência e organização nas operações da oficina.

## 🖋️ Sobre a Modelagem

Esta modelagem foi projetada para representar de forma clara e eficiente as informações de uma oficina mecânica, abrangendo a gestão de clientes, veículos, serviços, peças e ordens de serviço. O objetivo é garantir a integridade dos dados e otimizar o processo de trabalho, desde o cadastro do cliente até a execução da ordem de serviço.

## 🎯 Objetivos da Modelagem

- **Cadastro de Clientes e Veículos**: Gerenciar informações sobre clientes e seus respectivos veículos.
- **Gestão de Serviços e Peças**: Registrar os serviços prestados e controlar o estoque de peças utilizadas nas ordens de serviço.
- **Ordens de Serviço**: Gerenciar o ciclo completo de ordens de serviço, incluindo mecânicos e status das ordens.
- **Controle de Mecânicos e Equipes**: Atribuir mecânicos às equipes e controlar a execução de serviços.

## 🚀 Entidades Principais e Seus Atributos

### **Cliente**
- `idCliente` (PK)
- `Nome`
- `Telefone`
- `CPF`
- `Email`

### **Veículo**
- `idVeiculo` (PK)
- `idVeiculo_Cliente` (FK para Cliente)
- `Placa`
- `Modelo`
- `Marca`
- `Ano`

### **Mecânico**
- `idMecanico` (PK)
- `Nome`
- `Endereco`
- `Especialidade`
- `CPF`

### **Equipe**
- `idEquipe` (PK)

### **Ordem de Serviço**
- `idOrdemDeServico` (PK)
- `idOrdemDeServico_Veiculo` (FK para Veículo)
- `idOrdemDeServico_Equipe` (FK para Equipe)
- `Data_Emissao`
- `Valor`
- `Status`
- `Data_Conclusao`

### **Peca**
- `idPeca` (PK)
- `Nome_Peca`
- `Valor_Peca`

### **Servico**
- `idServico` (PK)
- `Descricao`
- `Valor_Mao_De_Obra`

### **ReferenciaMaoDeObra**
- `idReferenciaMaoDeObra` (PK)
- `idReferenciaMaoDeObra_Servico` (FK para Servico)
- `Tempo_Estimado`
- `Custo`

### **AutorizacaoCliente**
- `idAutorizacaoCliente` (PK)
- `idAutorizacaoCliente_Cliente` (FK para Cliente)
- `idAutorizacaoCliente_OrdemDeServico` (FK para OrdemDeServico)
- `Data_Autorizacao`
- `Status`

---

## 🔗 Relacionamentos

- **Cliente e Veículo**: Relacionamento 1:N, onde um cliente pode ter vários veículos.
- **Ordem de Serviço e Veículo**: Relacionamento 1:N, um veículo pode ter várias ordens de serviço.
- **Ordem de Serviço e Equipe**: Relacionamento 1:N, uma ordem de serviço pode ser associada a várias equipes, com a equipe sendo responsável por completar o serviço.
- **Ordem de Serviço e Peças (OSPeca)**: Relacionamento N:M, uma ordem de serviço pode ter várias peças e cada peça pode estar presente em várias ordens de serviço.
- **Ordem de Serviço e Equipe:** Relacionamento 1:N, onde uma ordem de serviço está associada a uma única equipe, e cada equipe pode ser responsável por várias ordens de serviço.
- **Ordem de Serviço e Serviço (OS Serviço)**: Relacionamento N:M, onde uma ordem de serviço pode envolver vários serviços, e um serviço pode ser prestado em várias ordens de serviço.
- **Mecânico e Equipe (EquipesDeMecanicos)**: Relacionamento N:M, onde mecânicos são atribuídos a diferentes equipes e podem ser alocados em várias ordens de serviço.
- **Autorização de Cliente e Ordem de Serviço**: Relacionamento 1:1, onde um cliente autoriza a realização de uma única ordem de serviço, e cada ordem de serviço tem uma única autorização associada a ela.

---
