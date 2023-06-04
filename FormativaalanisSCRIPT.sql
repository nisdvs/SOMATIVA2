create database formativaHogwarts;

use formativaHogwarts;

alter table usuarios add column celular varchar (50);
alter table usuarios add column link_foto text (50);


create table status(
	id bigint not null auto_increment,
    status varchar(30) not null,
    primary key(id)
);

create table tarefafotos(
  foto_id bigint not null auto_increment,
  foto_link varchar(50) not null,
  primary key(foto_id)
  );
  
create table tarefas(
  tarefa_id bigint not null auto_increment,
  tarefa_nome varchar(50),
  descricao text,
  comeco_data date,
  fim_data date,
  prazo date not null,
  tarefa_solicitado bigint,
  statusFK bigint not null,
  tarefafotoFK bigint not null,
  localFK bigint not null,
  primary key(tarefa_id),
  FOREIGN KEY (tarefa_solicitado) REFERENCES usuarios(id)
  foreign key(statusFK) references status(id)
  foreign key(tarefafotoFK) references tarefafotos(foto_id)
  foreign key(localFK) references locais(id)
);


create table tarefa_responsaveis(
 tarefa_id bigint not null auto_increment,
 tarefaFK bigint not null,
 responsavelFK bigint not null,
 primary key(tarefa_id),
  FOREIGN KEY (tarefaFK) REFERENCES tarefas(tarefa_id),
  FOREIGN KEY (responsavelFK) REFERENCES usuarios(id)
);


create table historico(
  historico_id bigint not null auto_increment,
  tarefa_id bigint,
   statusFK bigint not null,
   fotoFK bigint not null,
  comment text (50),
  data_historico date,
  horario_historico time,
 primary key (historico_id),
 FOREIGN KEY (tarefa_id) REFERENCES tarefas(tarefa_id)
 foreign key(statusFK) references status(id)
 foreign key(fotoFK) references tarefafotos(foto_id)
);

ALTER TABLE historico DROP COLUMN horario_historico;
ALTER TABLE historico ADD column historico time;
ALTER TABLE historico DROP COLUMN historico;
ALTER TABLE historico ADD column horario_historico time;


insert into status(status) values ('Aberta'), ('Em andamento'), ('Concluída'), ('Encerrada');

insert into tarefas (tarefa_nome, descricao, comeco_data, fim_data, prazo, tarefa_solicitado, statusFK, tarefafotoFK, localFK) values ('Tarefa 1', 'Esta é a descrição da tarefa 1','2023-02-10', '2023-02-15', '2023-02-20-15', 1, 2, 1, 2) ;
insert into tarefas (tarefa_nome, descricao, comeco_data, fim_data, prazo, tarefa_solicitado, statusFK, tarefafotoFK, localFK) values ('Tarefa 2', 'Esta é a descrição da tarefa 2','2023-06-03', '2023-06-20','2023-06-25',  2,5,7,2 );
insert into tarefas (tarefa_nome, descricao, comeco_data, fim_data, prazo, tarefa_solicitado, statusFK, tarefafotoFK, localFK ) values ('Tarefa 3', 'Esta é a descrição da tarefa 3', '2023-08-04', '2023-08-20', '2023-08-26', 3,1,2,4);

insert into tarefa_responsaveis (tarefaFK, responsavelFK) values (1,1);
insert into tarefa_responsaveis (tarefaFK, responsavelFK) values (2,1);
insert into tarefa_responsaveis (tarefaFK, responsavelFK) values (3,1);

insert into historico (tarefa_id, statusFK, fotoFK, comment, data_historico, horario_historico) values ("1", "4", "2","encerrada", "o trabalho foi otimo", "2023-06-20", "13:12");
insert into historico (tarefa_id, statusFK, fotoFK, comment, data_historico, horario_historico) values ("2","2","3", "aberta", "esperando ser realizado", "2023-06-22", "14:14");
insert into historico (tarefa_id, statusFK, fotoFK, comment, data_historico, horario_historico) values ("3", "3","1","em andamento", "espero que não demore", "2023-06-27", "18:15");

insert into tarefafotos (foto_link) values ("https://www.google.com/url?sa=i&url=https");
insert into tarefafotos (foto_link) values ("https://www.google.com/url?sa=i&url=https");
insert into tarefafotos (foto_link) values ("https://www.google.com/url?sa=i&url=https");
