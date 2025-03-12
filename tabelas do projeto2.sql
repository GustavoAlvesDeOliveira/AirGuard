create database  airguard;
use airguard;

create table Empresas ( 
idEmpresa int not null primary key auto_increment,
NomeEmpresa varchar(50) NOT NULL,
NomeRepresentante varchar(100) NOT NULL,
Endereco varchar(500) NOT NULL,
cep char(08) NOT NULL,
Cnpj varchar(20) NOT NULL,
qtdsensores int
);
create table Sensores( 
idSensores int not null primary key auto_increment,
qtd int NOT NULL,
localização varchar(20),
fkempresa int,
constraint ck_qtd check(qtd>0)
)auto_increment=100;
create table registros ( 
volume int,
horario timestamp default current_timestamp,
fkSensores int
);
alter table registros add foreign key(fksensores) references Sensores(idSensores);
alter table Empresas add foreign key(qtdsensores) references Sensores(idSensores);
alter table Sensores add foreign key(fkempresa) references Empresas(idEmpresa);

create unique index ix_cep on Empresas(cep);
create unique index ix_cnpj on Empresas(cnpj);
