create database formativaHogwarts;

use formativaHogwarts;

alter table usuarios add column celular varchar (50);
alter table usuarios add column link_foto text (50);

create table tarefas(
  tarefa_id bigint not null auto_increment,
  tarefa_nome varchar(50),
  descricao text,
  execucao date,
  comeco_data date,
  fim_data date,
  ambiente varchar(50),
  tarefa_solicitado bigint,
  progresso enum ("aberta", "em andamento", "concluida", "encerrada"),
  primary key(tarefa_id),
  FOREIGN KEY (tarefa_solicitado) REFERENCES usuarios(id)
);


create table tarefa_responsaveis(
 tarefa_id bigint,
 usuario_id bigint,
 primary key(tarefa_id),
  FOREIGN KEY (tarefa_id) REFERENCES tarefas(tarefa_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


create table historico(
  historico_id bigint not null AUTO_INCREMENT,
  tarefa_id bigint,
  status enum ("aberta", "em andamento", "concluida", "encerrada"),
  comment text (50),
  data_historico date,
  horario_historico datetime,
 primary key (historico_id),
 FOREIGN KEY (tarefa_id) REFERENCES tarefas(tarefa_id)
);

ALTER TABLE historico DROP COLUMN horario_historico;
ALTER TABLE historico ADD column historico time;
ALTER TABLE historico DROP COLUMN historico;
ALTER TABLE historico ADD column horario_historico time;

create table tarefafotos(
  foto_id bigint not null auto_increment,
  tarefa_id bigint,
  foto_link varchar(50),
  primary key(foto_id),
  FOREIGN KEY (tarefa_id) REFERENCES tarefas(tarefa_id)
);


insert into usuarios (celular, link_foto) values ("19996488246","https://www.google.com/url?sa=i&url=https%3A%2F%2Fbrasilescola.uol");
insert into usuarios (celular, link_foto) values ("192836479010","https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.biologianet");
insert into usuarios (celular, link_foto) values ("191122288463","https://www.google.com/url?sa=i&url=https%3A%2F%2Foglobo");

insert into tarefas (tarefa_nome, descricao,execucao, comeco_data, fim_data, ambiente, tarefa_solicitado , progresso) values ('Tarefa 1', 'Esta é a descrição da tarefa 1', '2023-06-10', '2023-06-10', '2023-06-15', 'patio', 1, 'aberta') ;
insert into tarefas (tarefa_nome, descricao,execucao, comeco_data, fim_data, ambiente, tarefa_solicitado, progresso) values ('Tarefa 2', 'Esta é a descrição da tarefa 2', '2023-06-12', '2023-06-03', '2023-06-20', 'sala de aula', 2, 'em andamento') ;
insert into tarefas (tarefa_nome, descricao,execucao, comeco_data, fim_data, ambiente, tarefa_solicitado, progresso) values ('Tarefa 3', 'Esta é a descrição da tarefa 3', '2023-06-13', '2023-06-04', '2023-06-20', 'banheiro', 3, 'concluida') ;


insert into tarefa_responsaveis (tarefa_id, usuario_id) values (1,1);
insert into tarefa_responsaveis (tarefa_id, usuario_id) values (2,1);
insert into tarefa_responsaveis (tarefa_id, usuario_id) values (3,4);

insert into historico (tarefa_id, status, comment, data_historico, horario_historico) values ("1", "encerrada", "o trabalho foi otimo", "2023-06-20", "13:12");
insert into historico (tarefa_id, status, comment, data_historico, horario_historico) values ("2", "aberta", "esperando ser realizado", "2023-06-22", "14:14");
insert into historico (tarefa_id, status, comment, data_historico, horario_historico) values ("3", "em andamento", "espero que não demore", "2023-06-27", "18:15");

insert into tarefafotos (tarefa_id, foto_link) values (1, "https://www.google.com/url?sa=i&url=https");
insert into tarefafotos (tarefa_id, foto_link) values (2, "https://www.google.com/url?sa=i&url=https");
insert into tarefafotos (tarefa_id, foto_link) values (3, "https://www.google.com/url?sa=i&url=https");