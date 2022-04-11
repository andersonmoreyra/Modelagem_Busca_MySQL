USE escola;

-- 1 - Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola
SELECT c.nome, a.* 
FROM aluno a, curso c, matricula m 	
WHERE a.cpf = m.cpf_aluno and c.codigo = m.codigo_curso;

-- 2 - Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecidos pela escola
SELECT c.nome AS curso , d.nome AS disciplina
FROM curso c, disciplina d, compoe cp 
WHERE c.codigo = cp.codigo_curso and d.codigo = cp.codigo_disciplina;

-- 3 - Produza um relatório que contenha o nome dos alunos e as disciplinas em que estão matriculados
SELECT a.nome AS nome_aluno, d.nome AS disciplina
FROM aluno a, disciplina d, cursa c 
WHERE a.cpf = c.cpf_aluno AND d.codigo = c.codigo_disciplina
ORDER BY a.nome;

-- 4 - Produza um relatório com os dados dos professores e as disciplinas que ministram
SELECT p.*, d.nome AS disciplina
FROM professor p, disciplina d 
WHERE p.matricula = d.matricula_professor
ORDER BY p.nome;

-- 5 - Produza um relatório com os nomes das disciplinas e seus pré-requisitos
SELECT d.nome AS disciplina , dp.nome AS dependencia 
FROM disciplina d JOIN pre_req p ON d.codigo = p.codigo_disciplina
JOIN disciplina dp ON dp.codigo = p.codigo_disciplina_dependencia;

-- 6 - Produza um relatório com a média de idade dos alunos matriculados em cada curso
CREATE OR REPLACE VIEW curso_aluno_idade AS
SELECT c.*, a.cpf , TRUNCATE(DATEDIFF(NOW(),data_nasc)/365,0) as idade 
FROM aluno a, curso c, matricula m WHERE a.cpf = m.cpf_aluno AND c.codigo = m.codigo_curso;

SELECT nome AS curso, TRUNCATE(AVG(idade),0) AS media_idade
FROM curso_aluno_idade
GROUP BY nome
ORDER BY nome;

-- 7 - Produza um relatório com os cursos oferecidos por cada departamento
SELECT d.nome AS departamento, c.nome AS curso
FROM departamento d, curso c 
WHERE d.codigo = c.codigo_dpto
ORDER BY d.nome;


