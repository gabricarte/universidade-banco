
# Modelagem - Universidade

O projeto consiste em criar um banco de dados de uma universidade, onde diferentes tipos de pessoas estão envolvidas, incluindo alunos, professores e funcionários. 

## Explicação 

**tb_alunos**: Armazena informações sobre os alunos, como nome, matrícula, email e mensalidade.

**tb_professores**: Contém detalhes dos professores, incluindo nome, matrícula, email, salário e formação acadêmica.

**tb_turmas**: Registra informações sobre as turmas oferecidas pela universidade, como código, número de turma, professor responsável, disciplina e horário.

**tb_alunos_turmas**: Estabelece a relação de muitos para muitos entre alunos e turmas, indicando quais alunos estão matriculados em quais turmas.

**tb_funcionarios**: Armazena dados dos funcionários da universidade, como nome, matrícula, email, salário e função.

**tb_dependentes**: Registra os dependentes dos professores e funcionários da universidade.

**tb_unidades_academicas**: Contém informações sobre as unidades acadêmicas da universidade, como código e nome.

**tb_contratados_unidade**: Registra os contratos dos professores e funcionários com as unidades acadêmicas da universidade, incluindo a data de início do contrato.

## Considerações

- Foi escolhido deixar as tabelas "tb_funcionarios" e "tb_professores" separadas para caso futuramente forem inseridas mais informações distintas entre ambas. 

- Além disso, também houve a necessidade de criar uma tabela para "tb_contratados_unidade" pois achei que seria interessante relacionar a unidade e o funcionário com a data de início, ao invés de só deixar a data_inicio como uma coluna nas tabelas "tb_funcionarios" e "tb_professores".

- Além disso, há a coexistência do id e o cd, pois o id serve para controle interno do sistema, já o cd externo, como para manipulação do usuário.

- "tb_contratados_unidade" está associada a um único professor. Além disso, cada professor tem apenas um contrato com uma unidade acadêmica. Portanto, o relacionamento entre tb_contratados_unidade e tb_professores é "1 para 1".
