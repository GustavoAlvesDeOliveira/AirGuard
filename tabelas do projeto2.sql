create database airguard;
use airguard;

create table Empresas ( 
IdEmpresa int not null primary key auto_increment,
NomeEmpresa varchar(50) NOT NULL,
NomeRepresentante varchar(100) NOT NULL,
Logradouro varchar(200) NOT NULL,
Bairro varchar(30) NOT NULL,
Cep char(08) NOT NULL,
Cnpj varchar(20) NOT NULL
);

create table Sensores( 
IdSensores int not null primary key auto_increment,
Qtd int NOT NULL,
Localização varchar(100) NOT NULL,
FkEmpresa int,
constraint ck_qtd check(qtd>0)
)auto_increment=100;

create table registros ( 
volume int,
horario timestamp default current_timestamp,
fkSensores int
);

alter table registros add foreign key(fksensores) references Sensores(idSensores);
alter table Sensores add foreign key(fkempresa) references Empresas(idEmpresa);

create unique index ix_cep on Empresas(cep);
create unique index ix_cnpj on Empresas(cnpj);

INSERT INTO Empresas (NomeEmpresa,NomeRepresentante,Logradouro,Bairro,cep, 
Cnpj) VALUES
('Metalúrgica Alpha','Ricardo', 'Rua das Indústrias, 123', 'Jardim angela', '03058060', 
'12.345.678/0001-90'),
('Ferro & Aço Ltda','Mateus', 'Avenida do Aço, 456', 'Vila prudente', '08795632', 
'98.765.432/0001-21'),
('Solda Forte','Douglas', 'Travessa das Chamas, 789', 'Vila mariana', '05664012', 
'23.456.789/0001-32'),
('MIGMAG Soluções','Marta', 'Rua dos Soldadores, 101', 'Santa amaro', '04258796', 
'34.567.890/0001-43'),
('CO2 Tech','Maria', 'Avenida dos Sensores, 202', 'Brás', '05089453', '45.678.901/0001-54');

INSERT INTO Sensores (Qtd, Localização, FkEmpresa) VALUES
(10, 'Galpão Principal', 1), 
(7, 'Setor de Soldagem', 2), 
(5, 'Linha de Produção', 3), 
(8, 'Área de Fundição', 4),
(12, 'Depósito de Materiais', 5); 

INSERT INTO registros (volume, horario, Fksensores) VALUES
(35.50, '2025-03-10 08:15:00', 101), 
(28.75, '2025-03-10 09:30:00', 102), 
(15.20, '2025-03-10 10:45:00', 103), 
(40.10, '2025-03-10 11:00:00', 104),
(50.90, '2025-03-10 12:20:00', 105); 

select*from Sensores;
select*from Empresas;
select*from registros;
