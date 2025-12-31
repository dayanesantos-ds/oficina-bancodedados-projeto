create database oficina;

use oficina;

-- Criar tabela Clients
create table clients (
    idclient int auto_increment primary key,
    CName varchar(45) not null,
    Address varchar(45) not null,
    Contact char(11) not null,
    Email varchar(45) not null,
    CPF char(11) not null,
	constraint unique_cpf_client unique(cpf)
);

-- Criar tabela de veículo
create table car (
    idCar int auto_increment primary key,
    Plate varchar(10) not null,
    Model varchar(45) not null,
    CYear char(4) not null,
    Brand varchar(45) not null,
    Color varchar(20) not null,
    idClient int not null,
    constraint fk_car_client foreign key (idclient) references clients(idclient)
);

-- Criar tabela de Equipe
create table team (
    idteam int auto_increment primary key,
    TDescription varchar(255) not null
);

-- Criar tabela de Mecânico
create table mechanic (
    idmechanic int auto_increment primary key,
    Cname varchar(45) not null,
    address varchar(45) 
    contact char(11) not null,
    specialty varchar(45) not null
);


-- Criar tabela Equipe e mecânico
create table team_has_mechanic (
    idteam int not null,
    idmechanic int not null,
    primary key (idteam, idmechanic),
    constraint fk_thm_team foreign key (idteam) references team(idteam),
    constraint fk_thm_mechanic foreign key (idmechanic) references mechanic(idmechanic)
);


-- Criar tabela de serviço
create table service (
    idservice int auto_increment primary key,
    sdescription varchar(255) not null,
    service_type enum('Manutenção','Revisão') not null,
    labor_value decimal(10,2) not null
);



-- Criar tabela de peças
create table part (
    idpart int auto_increment primary key,
    Pdescription varchar(255) not null,
    unit_value decimal(10,2) not null
);



-- Criar tabela de Ordem de Serviço
create table work_order (
    idwork_order int auto_increment primary key,
    issue_date date not null,
    conclusion_date date,
	Order_status enum('Aberta','Em andamento','Concluida','Cancelada') not null,
    total_value decimal(10,2) not null,
    payment_method enum('Dinheiro','Cartão','Pix') not null,
    idCar int not null,
    idteam int not null,
    constraint fk_workorder_car foreign key (idCar) references car(idCar),
    constraint fk_workorder_team foreign key (idteam) references team(idteam)
);


-- criar tabela Ordem de Serviço e Serviço
create table work_order_has_service (
    idwork_order int not null,
    idservice int not null,
    primary key (idwork_order, idservice),
    constraint fk_wos_workorder foreign key (idwork_order) references work_order(idwork_order),
    constraint fk_wos_service foreign key (idservice) references service(idservice)
);

-- Criar tabela Ordem de Serviço e Peça
create table work_order_has_part (
    idwork_order int not null,
    idpart int not null,
    unit_price decimal(10,2) not null,
    quantity int not null,
    primary key (idwork_order, idpart),
    constraint fk_wop_work_order foreign key (idwork_order) references work_order(idwork_order),
    constraint fk_wop_part foreign key (idpart) references part(idpart)
);

show tables;