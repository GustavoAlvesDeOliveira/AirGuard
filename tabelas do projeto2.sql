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
Localização varchar(20) NOT NULL,
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
