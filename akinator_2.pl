
deducao :- hipotese(Professor),
		write('Acho que o professor e: '),
		write(Professor),
		nl,
		undo.


/* hipoteses */
hipotese(milene)	:- milene, !.
hipotese(rejane)	:- rejane, !.
hipotese(carla)		:- carla, !.
hipotese(edna)		:- edna, !.

hipotese(mauricio)	:- mauricio, !.
hipotese(sergio_freitas)	:- sergio_freitas, !.
hipotese(hilmer)	:- hilmer, !.
hipotese(edson)		:- edson, !.

hipotese(nao_encontrado).

/* regras de identificacao de cada professor */

milene :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_baixa,
		  verify(ministra_paradigmas_de_programacao).

rejane :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_alta,
		  verify(mestrado_matematica_computacional),
		  verify(doutorado_engenharia_mecanica),
		  verify(ministra_pds).

carla  :- mulher,
		  software,
		  loiro,
		  cabelo_medio,
		  estatura_media,
		  verify(mestrado),
		  verify(doutorado),
		  verify(ministra_icg).

edna :- mulher, 
		  sofware,
		  loiro,
		  cabelo_longo,
		  estatura_baixa,
		  verify(ministra_sbd).

mauricio :- homem,
			software,
			preto,
			cabelo_medio,
			estatura_media,
			verify(mestrado_ciencia_computacao),
			verify(ministra_eda2).

sergio_freitas :- homem,
		  software,
		  grisalho,
		  cabelo_medio,
		  estatura_alta,
		  verify(mestrado_computacao),
		  verify(doutorado_engenharia_eletrica),
		  verify(ministra_fac).

hilmer :- homem,
		  software,
		  preto,
		  cabelo_longo,
		  estatura_media,
		  verify(mestrado_ciencia_computacao),
		  verify(ministra_mds).

edson :- homem,
		  software,
		  preto,
		  cabelo_medio,
		  estatura_alta,
		  verify(mestrado_matematica),
		  verify(doutorado_engenharia_eletrica),
		  verify(ministra_jogos).


/* regras de classificação */

mulher	:- verify(e_mulher), !.
homem	:- verify(e_homem), !.
software :- verify(docente_do_curso_de_software).
loiro   :- verify(tem_cabelo_loiro).
preto 	:- verify(tem_cabelo_preto).
grisalho :- verify(tem_cabelo_grisalho).
cabelo_longo :- verify(tem_cabelo_longo). /* pode ter um e o outro n */
cabelo_medio :- verify(tem_cabelo_medio).
cabelo_curto :- verify(tem_cabelo_curto).
estatura_baixa :- verify(estatura_baixa).
estatura_media :- verify(estatura_media).
estatura_alta  :- verify(estatura_alta).				  



/* perguntas */
ask(Pergunta) :-
	write('O professor tem a seguinte caracteristica: '),
	write(Pergunta),
	write('? '),
	read(Resposta),
	nl,
	( (Resposta == sim ; Resposta == s)
		->
		assert(sim(Pergunta)) ;
		assert(nao(Pergunta)), fail).

:- dynamic sim/1, nao/1.

/* verificar */
verify(X) :-
	(sim(X)
	->
	true ;
	(nao(X)
	 ->
	 fail ;
	 ask(X))).

/* limpar os asserts */
undo :- retract(sim(_)), fail.
undo :- retract(nao(_)), fail.
undo.
