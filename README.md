# 🛠️ Sistema de Gestão de Ordem de Serviço – Oficina Mecânica

Este repositório contém o desenvolvimento completo do **projeto lógico de banco de dados para um sistema de oficina mecânica**, criado a partir de uma narrativa realista e estruturado com base em boas práticas de modelagem relacional.

O projeto contempla modelagem do banco, criação das tabelas em SQL, inserção de dados fictícios e consultas analíticas para apoio à gestão de ordens de serviço, serviços executados, peças utilizadas e equipes de mecânicos.

---

## 🎯 Objetivo do Projeto

- Criar um banco de dados relacional para controle de ordens de serviço em uma oficina mecânica  
- Representar clientes, veículos, equipes, mecânicos, serviços e peças  
- Registrar execução de serviços e composição de valor por OS  
- Garantir integridade via **PK, FK, UNIQUE e NOT NULL**  
- Executar consultas SQL analíticas conforme o desafio proposto pela DIO

---

## 🧩 Modelagem do Banco de Dados

A modelagem contempla as seguintes entidades principais:

- **Clients** – informações do cliente  
- **Car** – veículos vinculados ao cliente  
- **Team** – equipes de mecânicos  
- **Mechanic** – dados dos mecânicos  
- **Team_has_mechanic** – relação equipe x mecânico  
- **Work_order** – registro da ordem de serviço  
- **Service** – catálogo de serviços (manutenção / revisão)  
- **Part** – catálogo de peças  
- **Work_order_has_service** – serviços executados na OS  
- **Work_order_has_part** – peças utilizadas na OS  

O modelo segue princípios de **normalização**, evitando redundâncias e garantindo consistência das informações.

📌 **Arquivo do diagrama EER (.mwb):**  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/esquema.mwb  

📌 **Print do diagrama (imagem):**  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20esquema.png

---

## 🛠 Tecnologias Utilizadas

- MySQL Server  
- MySQL Workbench  
- SQL (DDL, DML e consultas analíticas)

---

## 📂 Estrutura do Repositório

| Arquivo / Pasta | Descrição |
|-----------------|----------|
| `esquema.mwb` | Diagrama EER do banco de dados |
| `insert.sql` | Script de inserção de dados fictícios |
| `queries.sql` | Consultas SQL do desafio |
| `imagens/` | Prints das consultas e do modelo |

📌 Arquivos principais:

- Script de inserts  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/insert.sql  

- Script de consultas  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/queries.sql  

---

## ▶️ Como Executar o Projeto

1️⃣ Importe o arquivo `.mwb` no MySQL Workbench  
2️⃣ Execute o script de criação do banco e tabelas  
3️⃣ Execute o arquivo **`insert.sql`** para popular os dados  
4️⃣ Execute o arquivo **`queries.sql`** para rodar as consultas analíticas  

---

## 🔎 Consultas Criadas

As queries desenvolvidas incluem:

- Recuperação de ordens de serviço por cliente  
- OS executadas por veículo  
- Valor total de OS por cliente  
- Listagem de serviços executados por OS  
- Listagem de peças utilizadas por OS  
- Equipes responsáveis por cada OS  
- Filtragem por status da ordem de serviço  

📌 **Prints das consultas estão na pasta `/imagens`:**

- Quantidade de ordens de serviço por cliente  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Quantas%20ordens%20de%20servi%C3%A7o%20-%20cliente.png  

- Valor total de OS por cliente  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Valor%20total%20de%20OS%20por%20cliente.png  

- Listagem de peças utilizadas por OS  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Listar%20OS%20com%20pe%C3%A7as%20utilizadas%20e%20valor%20total%20por%20OS.png  

- OS concluídas acima de determinado valor  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Filtar%20OS%20conclu%C3%ADdas%20acima%20de%20determinado%20valor.png  

- Equipes e quantidade de OS atendidas  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Equipes%20e%20quantidade%20de%20OS%20atendidas.png  

- Tabela clientes com dados populados  
https://github.com/dayanesantos-ds/oficina-bancodedados-projeto/blob/main/imagens/Print%20Tabela%20Clientes%20com%20Dados.png  

---

## 🧪 Exemplos de Resultados (prints incluídos)

- ✔️ OS por cliente  
- ✔️ Serviços executados na OS  
- ✔️ Peças usadas por OS  
- ✔️ Valor total da OS  
- ✔️ OS por equipe
- ✔️ OS acima de R$500,00
  

> As consultas foram testadas e validadas no MySQL Workbench.

---

## ✅ Conclusão

Este projeto consolida o uso de SQL em um contexto de gestão de oficina mecânica, explorando:

- Modelagem relacional  
- Criação de esquema físico  
- Integração entre tabelas via relacionamento  
- Inserção controlada de dados  
- Consultas com **JOIN, GROUP BY, HAVING, filtros e agregações**  

Além de atender ao desafio proposto, o projeto foi estruturado para uso prático em **cenários reais de manutenção automotiva**.

---

## ✨ Autor(a)

Projeto desenvolvido por **Dayane Santos** como parte do programa de formação em Análise de Dados da DIO.

