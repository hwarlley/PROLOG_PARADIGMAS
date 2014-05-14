:-dynamic estudante/8.
:-dynamic professor/10.
:-dynamic sexo/2.
:-dynamic cor_cabelo/2.
:-dynamic tamanho_cabelo/2.
:-dynamic cor_olho/2.
:-dynamic estatura/2.
:-dynamic curso/2.
:-dynamic semestre/2.
:-dynamic materia_principal/2.
:-dynamic mestrado/2.
:-dynamic doutorado/2.


estudante(nome,sexo,cor_cabelo,tamanho_cabelo,cor_olho,estatura,curso,semestre).

estudante(victor, m,loiro,curto,azul,    alta, software,5).
estudante(joao,   m,preto,curto,castanho,alta, software,5).
estudante(caio,   m,preto,longo,castanho,media,software,5).
estudante(leandro,m,preto,medio,castanho,media,software,8).


professor(nome,sexo,cor_cabelo,tamanho_cabelo,cor_olho,estatura,curso,materia_principal,mestrado,doutorado).

professor(milene,  f,loiro,   longo,castanho,baixa,paradigmas_de_programacao,software,mestrado,doutorado).
professor(mauricio,m,preto,   medio,castanho,media,eda_2,                    software,ciencia_computacao,ciencia_computacao).
professor(sergio,  m,grizalho,medio,castanho,alta, fac,						 software,computacao,engenharia_eletrica).
professor(hilmer,  m,preto,   longo,castanho,media,mds,						 software,ciencia_computacao,nao).
professor(rejane,  f,loiro,   longo,verde,   alta, pds, 					 software,matematica_computacional/ciencia_computacao,engenharia_mecanica).
professor(edson,   m,preto,   medio,castanho,alta, jogos,					 software,matematica,engenharia_eletrica).

sexo(victor,m).
sexo(joao,m).
sexo(caio,m).
sexo(leandro,m).
sexo(milene,f).
sexo(mauricio,m).
sexo(sergio,m).
sexo(hilmer,m).
sexo(rejane,f).
sexo(edson,m).

cor_cabelo(victor,loiro).
cor_cabelo(joao,preto).
cor_cabelo(caio,preto).
cor_cabelo(leandro,preto).
cor_cabelo(milene,loiro).
cor_cabelo(mauricio,preto).
cor_cabelo(sergio,grizalho).
cor_cabelo(hilmer,preto).
cor_cabelo(rejane,loiro).
cor_cabelo(edson,preto).


tamanho_cabelo(victor,curto).
tamanho_cabelo(joao,curto).
tamanho_cabelo(caio,longo).
tamanho_cabelo(leandro,medio).
tamanho_cabelo(milene,longo).
tamanho_cabelo(mauricio,medio).
tamanho_cabelo(sergio,medio).
tamanho_cabelo(hilmer,longo).
tamanho_cabelo(rejane,longo).
tamanho_cabelo(edson,medio).

cor_olho(victor,azul).
cor_olho(joao,castanho).
cor_olho(caio,castanho).
cor_olho(leandro,castanho).
cor_olho(milene,castanho).
cor_olho(mauricio,castanho).
cor_olho(sergio,castanho).
cor_olho(hilmer,castanho).
cor_olho(rejane,verde).
cor_olho(edson,castanho).

estatura(victor,alta).
estatura(joao,alta).
estatura(caio,media).
estatura(leandro,media).
estatura(milene,baixa).
estatura(mauricio,media).
estatura(sergio,alta).
estatura(hilmer,media).
estatura(rejane,alta).
estatura(edson,alta).

semestre(victor,5).
semestre(joao,5).
semestre(caio,5).
semestre(leandro,8).

curso(victor,software).
curso(joao,software).
curso(caio,software).
curso(leandro,software).
curso(milene,software).
curso(mauricio,software).
curso(sergio,software).
curso(hilmer,software).
curso(rejane,software).
curso(edson,software).


materia_principal(milene,paradigmas_de_programacao).
materia_principal(mauricio,eda_2).
materia_principal(sergio,fac).
materia_principal(hilmer,mds).
materia_principal(rejane,pds).
materia_principal(edson,jogos).

mestrado(milene,mestrado).
mestrado(mauricio,mestrado).
mestrado(sergio,mestrado).
mestrado(hilmer,mestrado).
mestrado(rejane,mestrado).
mestrado(edson,mestrado).

doutorado(milene,doutorado).
doutorado(mauricio,doutorado).
doutorado(sergio,doutorado).
doutorado(hilmer,doutorado).
doutorado(rejane,doutorado).
doutorado(edson,doutorado).

estudante(nome,sexo,cor_cabelo,tamanho_cabelo,cor_olho,estatura,curso,semestre).

curso_estudante(Nome,Curso):-estudante(Nome,_,_,_,_,_,Curso,_).
semestre_estudante(Nome,Semestre):-estudante(Nome,_,_,_,_,_,_,Semestre).

curso_professor(Nome,Curso):-professor(Nome,_,_,_,_,_,Curso,_,_,_).
materia_professor(Nome,Materia):-professor(Nome,_,_,_,_,_,_,Materia,_,_).
mestrado_professor(Nome,Mestrado):-professor(Nome,_,_,_,_,_,_,_,Mestrado,_).
doutorado_professor(Nome,Doutorado):-professor(Nome,_,_,_,_,_,_,_,_,Doutorado).


exclui(X):-
	deleta(X),fail.
exclui(X).

deleta(X):-
	retract(X).
deleta(X).

salva(X):-
	exclui(X), assert(X).




pergunta1:-write('A pessoa e do sexo masculino?'), read(Sexo),
			Sexo = s, professor(_,m,_,_,_,_,_,_,_,_),
			Sexo = n, professor(_,f,_,_,_,_,_,_,_,_),
			pergunta2,!.

pergunta2:-write('A pessoa tem o cabelo loiro?'), read(Cor_cabelo),
			Cor_cabelo = s, professor(_,_,loiro,_,_,_,_,_,_,_),
			Cor_cabelo = n, write('A pessoa tem o cabelo preto?'), read(Cor_cabelo_2),
			Cor_cabelo_2 = s, professor(_,_,preto,_,_,_,_,_,_,_),
			Cor_cabelo_2 = n, write('A pessoa tem o cabelo castanho?'), read(Cor_cabelo_3),
			Cor_cabelo_3 = s, professor(_,_,castanho,_,_,_,_,_,_,_),
			pergunta3,!.

pergunta3:-write('A pessoa tem cabelo curto?'), read(Tamanho_cabelo),
			Tamanho_cabelo = s, professor(_,_,_,curto,_,_,_,_,_,_),
			Tamanho_cabelo = n, write('A pessoa tem cabelo longo?'), read(Tamanho_cabelo_2),
			Tamanho_cabelo_2 = s, professor(_,_,_,longo,_,_,_,_,_,_),
			Tamanho_cabelo_2 = n, write('A pessoa tem cabelo medio?'), read(Tamanho_cabelo_3),
			Tamanho_cabelo_3 = s, professor(_,_,_,medio,_,_,_,_,_,_),
			Tamanho_cabelo_3 = n, professor(_,_,_,calvo,_,_,_,_,_,_),
			pergunta4,!.			

pergunta4:-write('A pessoa tem os olhos castanhos?'), read(Cor_olho),
			Cor_olho = s, professor(_,_,_,castanho,_,_,_,_,_,_),
			Cor_olho = n, write('A pessoa tem olhos verdes?'), read(Cor_olho_2),
			Cor_olho_2 = s, professor (_,_,_,verde,_,_,_,_,_,_),
			Cor_olho_2 = n, professor (_,_,_,azul,_,_,_,_,_,_),!.