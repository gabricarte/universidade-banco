-- Criando as tabelas

create table tb_alunos(
	id_alunos serial primary key,
	cd_matricula int unique,
	nome varchar(200), 
	email varchar(100),
	mensalidade money
);

create table tb_professores(
	id_professores serial primary key,
	cd_matricula int unique,
	nome varchar(200),
	email varchar(100),
	salario money,
	formacao varchar(200)
);


create table tb_turmas(
	id_turmas serial primary key,
	cd_codcred int unique,
	cd_numero_turma int unique,
	id_professores int references tb_professores(id_professores),
	nome_disciplina varchar(100),
	horario time
);


create table tb_alunos_turmas(
	id_alunos int references tb_alunos(id_alunos),
	id_turmas int references tb_turmas(id_turmas),
	primary key (id_alunos, id_turmas)
);

create table tb_funcionarios(
	id_funcionarios serial primary key,
	cd_matricula int unique, 
	nome varchar(200),
	email varchar(100),
	salario money, 
	funcao varchar(100)
);

CREATE TABLE tb_dependentes (
    id_dependentes serial PRIMARY KEY, 
    id_professores int,
    id_funcionarios int,	
    nome varchar(200),
    FOREIGN KEY (id_professores) REFERENCES tb_professores(id_professores),
    FOREIGN KEY (id_funcionarios) REFERENCES tb_funcionarios(id_funcionarios)
);

create table tb_unidades_academicas(
	id_unidades serial primary key, 
	cd_unidades int, 
	nome varchar(100)
);

create table tb_contratados_unidade(
	id_contratados_unidade serial primary key,
    id_professores int,
    id_funcionarios int,
    id_unidades int,
    data_inicio date,
	foreign key (id_professores) references tb_professores(id_professores),
	foreign key (id_funcionarios) references tb_funcionarios(id_funcionarios),
	foreign key (id_unidades) references tb_unidades_academicas(id_unidades)
);

-- Inserção de dados

-- Inserindo dados na tabela tb_alunos
INSERT INTO tb_alunos (cd_matricula, nome, email, mensalidade) 
VALUES 
    (123456, 'João Silva', 'joao.silva@example.com', 1500.00),
    (789012, 'Maria Souza', 'maria.souza@example.com', 1700.00), 
   (139013, 'Glória Pires', 'gloria.souza@example.com', 1500.00);
   
-- Inserindo dados na tabela tb_professores
INSERT INTO tb_professores (cd_matricula, nome, email, salario, formacao) 
VALUES 
    (654321, 'Carlos Oliveira', 'carlos.oliveira@example.com', 5000.00, 'Doutorado em Engenharia'),
    (210987, 'Ana Santos', 'ana.santos@example.com', 4500.00, 'Mestrado em Matemática');

-- Inserindo dados na tabela tb_turmas
INSERT INTO tb_turmas (cd_codcred, cd_numero_turma, id_professores, nome_disciplina, horario)
VALUES 
    (101, 1, 1, 'Introdução à Programação', '08:00'),
    (202, 2, 2, 'Cálculo I', '10:00');

-- Inserindo dados na tabela tb_alunos_turmas
INSERT INTO tb_alunos_turmas (id_alunos, id_turmas)
VALUES 
    (1, 1), -- João Silva na turma de Introdução à Programação
    (2, 2); -- Maria Souza na turma de Cálculo I

INSERT INTO tb_alunos_turmas (id_alunos, id_turmas)
VALUES(3, 1) -- Glória Pires na turma de Introdução à Programação
    
-- Inserindo dados na tabela tb_funcionarios
INSERT INTO tb_funcionarios (cd_matricula, nome, email, salario, funcao) 
VALUES 
    (123, 'Pedro Rocha', 'pedro.rocha@example.com', 4000.00, 'Assistente Administrativo'),
    (456, 'Camila Lima', 'camila.lima@example.com', 3800.00, 'Secretária');
   
 -- Inserindo dados na tabela tb_dependentes
INSERT INTO tb_dependentes (id_professores, nome) VALUES (1, 'Carlinhos');
INSERT INTO tb_dependentes (id_funcionarios, nome) VALUES (2, 'Camilinha');

-- Inserindo dados na tabela tb_unidades_academicas
INSERT INTO tb_unidades_academicas (cd_unidades, nome) VALUES (101, 'Unidade Acadêmica 1');
INSERT INTO tb_unidades_academicas (cd_unidades, nome) VALUES (102, 'Unidade Acadêmica 2');

-- Inserindo dados na tabela tb_contratados_unidade
INSERT INTO tb_contratados_unidade (id_professores, id_unidades, data_inicio) VALUES (1, 1, '2024-05-10');
INSERT INTO tb_contratados_unidade (id_funcionarios, id_unidades, data_inicio) VALUES (1, 2, '2024-05-15');

   
-- Selects
    
SELECT * FROM tb_alunos;
SELECT * FROM tb_professores;
SELECT * FROM tb_turmas;
SELECT * FROM tb_alunos_turmas;
SELECT * FROM tb_funcionarios;
SELECT * FROM tb_dependentes;
SELECT * FROM tb_unidades_academicas;	
SELECT * FROM tb_contratados_unidade;

-- Drops
DROP TABLE IF EXISTS tb_alunos;
DROP TABLE IF EXISTS tb_professores;
DROP TABLE IF EXISTS tb_turmas;
DROP TABLE IF EXISTS tb_alunos_turmas;
DROP TABLE IF EXISTS tb_funcionarios;
DROP TABLE IF EXISTS tb_dependentes;
DROP TABLE IF EXISTS tb_unidades_academicas;
DROP TABLE IF EXISTS tb_contratados_unidade;


