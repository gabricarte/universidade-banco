-- Consultas personalizadas

-- Selecionando todos os dependentes de professores

select tb_professores.nome as "Professor", tb_dependentes.nome "Dependente"
from tb_dependentes 
inner join tb_professores on tb_dependentes.id_professores = tb_professores.id_professores

-- Selecionando todos os dependentes de funcionários

select tb_funcionarios.nome as "Funcionário", tb_dependentes.nome "Dependente"
from tb_dependentes 
inner join tb_funcionarios on tb_dependentes.id_funcionarios = tb_funcionarios.id_funcionarios

-- Selecionando os nomes dos alunos e das turmas
select tb_turmas.nome_disciplina as "Disciplina", tb_alunos.nome as "Nome do aluno"
from tb_alunos_turmas 
inner join tb_turmas on tb_alunos_turmas.id_turmas = tb_turmas.id_turmas
inner join tb_alunos on tb_alunos_turmas.id_alunos = tb_alunos.id_alunos order by tb_turmas.nome_disciplina;


-- Selecionando os alunos da turma de id 1 (Introdução à Programação)
SELECT tb_alunos.nome AS "Alunos da turma Introdução à Programação"
FROM tb_alunos_turmas
INNER JOIN tb_alunos ON tb_alunos_turmas.id_alunos = tb_alunos.id_alunos
INNER JOIN tb_turmas ON tb_alunos_turmas.id_turmas = tb_turmas.id_turmas
WHERE tb_turmas.id_turmas = 1;

-- Somando o salário de todos os professores

select sum(salario) as "Despesa com salário dos professores"
from tb_professores	

-- Somando o salário de todos os contratados 
SELECT SUM(salario) AS "Total de Salários"
FROM (
    SELECT salario FROM tb_professores
    UNION ALL
    SELECT salario FROM tb_funcionarios
) AS salarios_totais;

-- Somando a mensalidade dos alunos

select sum(mensalidade) as "Total de Mensalidades"
from tb_alunos

-- Despesas e Receitas da Universidade

SELECT 
    (SELECT SUM(salario) FROM (
        SELECT salario FROM tb_professores
        UNION ALL
        SELECT salario FROM tb_funcionarios
    )) AS "Despesas",
    (SELECT SUM(mensalidade) FROM tb_alunos) AS "Receitas";


