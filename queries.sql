use oficina;

-- Dados Clientes
insert into clients (name, address, contact, email, cpf) values
('Marcos Silva', 'Rua das Flores 120', '11987654321', 'marcos.silva@email.com', '12345678901'),
('Ana Pereira', 'Av. Central 450', '11999887766', 'ana.pereira@email.com', '23456789012'),
('Carlos Souza', 'Rua Verde 89', '11988776655', 'carlos.souza@email.com', '34567890123'),
('Fernanda Lima', 'Rua Azul 300', '11977665544', 'fernanda.lima@email.com', '45678901234'),
('Ricardo Santos', 'Av. Paulista 900', '11966554433', 'ricardo.santos@email.com', '56789012345'),
('Juliana Costa', 'Rua das Orquídeas 15', '11955443322', 'juliana.costa@email.com', '67890123456'),
('Paulo Mendes', 'Rua Bahia 210', '11944332211', 'paulo.mendes@email.com', '78901234567'),
('Beatriz Rocha', 'Av. Rio Branco 77', '11933221100', 'beatriz.rocha@email.com', '89012345678'),
('Lucas Ferreira', 'Rua Aurora 510', '11922110099', 'lucas.ferreira@email.com', '90123456789'),
('Isabela Martins', 'Rua Ipê Amarelo 88', '11911009876', 'isabela.martins@email.com', '01234567890');

-- Dados Equipes
insert into team (description) values
('team alpha'),
('team beta'),
('team gamma');


-- Dados Mecânicos
insert into mechanic (cname, address, contact, specialty) values
('marcos silva', 'rua a, 100', '11987654321', 'motor'),
('paulo santos', 'rua b, 200', '11988551234', 'freios'),
('ana rodrigues', 'av central, 330', '11999887766', 'eletrica'),
('bruno almeida', 'rua das flores, 17', '11977776666', 'suspensao'),
('carla lima', 'rua ipiranga, 55', '11966664444', 'injeção'),
('ricardo teixeira', 'av brasil, 900', '11995554433', 'transmissao');


-- Dados Equipe e Mecênico
insert into team_has_mechanic (idteam, idmechanic) values
(1,1), (1,2),
(2,3), (2,4),
(3,5), (3,6);


-- Dados Carros
insert into car (Plate, Model, year, Brand, Color, idClient) values
('abc1a23', 'civic', '2018', 'honda', 'silver', 1),
('def2b34', 'corolla', '2020', 'toyota', 'white', 2),
('ghi3c45', 'onix', '2019', 'chevrolet', 'black', 3),
('jkl4d56', 'hb20', '2017', 'hyundai', 'red', 4),
('mno5e67', 'argo', '2021', 'fiat', 'grey', 5),
('pqr6f78', 'sandero', '2016', 'renault', 'blue', 6),
('stu7g89', 'golf', '2015', 'volkswagen', 'white', 7),
('vwx8h90', 'compass', '2022', 'jeep', 'black', 8),
('yza9i11', 'fit', '2014', 'honda', 'silver', 9),
('bcd0j22', 'creta', '2023', 'hyundai', 'brown', 10);


-- Dados Serviços
insert into service (sdescription, service_type, labor_value) values
('troca de óleo e filtro', 'manutenção', 120.00),
('alinhamento e balanceamento', 'manutenção', 180.00),
('revisão preventiva 10k km', 'revisão', 350.00),
('troca de pastilhas de freio', 'manutenção', 220.00),
('revisão completa', 'revisão', 650.00);


-- Dados Peças
insert into part (pdescription, unit_value) values
('filtro de óleo', 35.00),
('filtro de ar', 45.00),
('pastilha de freio', 180.00),
('vela de ignição', 40.00),
('fluido de freio', 60.00);


-- Dados Ordem de serviço
insert into work_order
(issue_date, conclusion_date, order_status, total_value, payment_method, idcar, idteam)
values
('2024-01-05', '2024-01-06', 'Concluida', 250.00, 'Pix', 1, 1),
('2024-01-07', '2024-01-08', 'Concluida', 370.00, 'Cartão', 2, 2),
('2024-01-10', null, 'Em andamento', 180.00, 'Dinheiro', 3, 1),
('2024-01-11', '2024-01-12', 'Concluida', 420.00, 'Pix', 4, 3),
('2024-01-12', null, 'Aberta', 350.00, 'Cartão', 5, 2),
('2024-01-13', '2024-01-13', 'Concluida', 220.00, 'Dinheiro', 6, 1),
('2024-01-14', null, 'Em andamento', 300.00, 'Pix', 7, 3),
('2024-01-15', '2024-01-16', 'Concluida', 650.00, 'Cartão', 8, 2),
('2024-01-16', null, 'Aberta', 180.00, 'Pix', 9, 1),
('2024-01-17', '2024-01-18', 'Concluida', 480.00, 'Dinheiro', 10, 3);


-- Dados Ordem de serviço e Serviço
insert into work_order_has_service (idwork_order, idservice) values
(1,1),
(2,3),
(3,2),
(4,4),
(5,3),
(6,1),
(7,2),
(8,5),
(9,1),
(10,4);


-- Dados Ordem de Serviço e Peças
insert into work_order_has_part (idwork_order, idpart, unit_price, quantity) values
(1,1,35.00,1),
(2,2,45.00,1),
(3,3,180.00,1),
(4,5,60.00,1),
(5,4,40.00,4),
(6,1,35.00,1),
(7,3,180.00,1),
(8,2,45.00,1),
(9,4,40.00,2),
(10,5,60.00,1);


-- Quantas Ordens de Serviço cada cliente possui?
select 
    c.name as client,
    count(wo.idwork_order) as total_orders
from clients c
left join car ca on ca.idclient = c.idclient
left join work_order wo on wo.idcar = ca.idcar
group by c.name
order by total_orders desc;


-- Valor total de OS por cliente
select
    c.name as client,
    sum(wo.total_value) as total_spent
from clients c
join car ca on ca.idclient = c.idclient
join work_order wo on wo.idcar = ca.idcar
group by c.name
having total_spent > 0
order by total_spent desc;

-- Lista OS com seus serviços associados
select 
    wo.idwork_order,
    c.name as client,
    s.sdescription as service,
    s.service_type,
    s.labor_value
from work_order wo
join car ca on ca.idcar = wo.idcar
join clients c on c.idclient = ca.idclient
join work_order_has_service wos on wos.idwork_order = wo.idwork_order
join service s on s.idservice = wos.idservice
order by wo.idwork_order;

-- Lista OS com peças utilizadas e valor total por OS
select 
    wo.idwork_order,
    c.name as client,
    sum(wp.quantity * wp.unit_price) as parts_total
    
from work_order wo
join car ca on ca.idcar = wo.idcar
join clients c on c.idclient = ca.idclient
join work_order_has_part wp on wp.idwork_order = wo.idwork_order
group by wo.idwork_order, c.name;


-- Equipes e quantidade de OS atendidas
select 
    t.description as team,
    count(wo.idwork_order) as total_orders
from team t
left join work_order wo on wo.idteam = t.idteam
group by t.description
order by total_orders desc;


-- Filtrar OS concluídas acima de determinado valor
select
    wo.idwork_order,
    wo.order_status,
    wo.total_value
from work_order wo
where wo.order_status = 'Concluida'
  and wo.total_value > 500;



