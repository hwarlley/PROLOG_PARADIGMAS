
deducao :- hipotese(Professor),
		write('Acho que o professor e: '),
		write(Professor),
		nl,
		undo.


/* hipoteses */
hipotese(milene)	:- milene, !.
hipotese(rejane)	:- rejane, !.
hipotese(carla)		:- carla, !.

hipotese(mauricio)	:- mauricio, !.
hipotese(sergio)	:- sergio, !.

/*hipotese(hilmer)	:- hilmer, !.
hipotese(edson)		:- sergio, !.*/
hipotese(nao_encontrado).

/* regras de identificacao de cada professor */

milene :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  verify(estatura_baixa).
rejane :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  verify(estatura_alta).
carla  :- mulher,
		  software,
		  loiro,
		  cabelo_medio,
		  verify(estatura_media).


mauricio :- homem,
			software,
			verify(cabelo_preto),
			verify(cabelo_medio),
			verify(estatura_media).
sergio_freitas :- homem,
		  software,
		  grisalho,
		  cabelo_medio,
		  verify(estatura_alta).


/* regras de classificação */

mulher	:- verify(e_mulher), !.
homem	:- verify(e_homem), !.
software :- verify(e_do_curso_de_software).
loiro   :- verify(cabelo_loiro).
preto 	:- verify(cabelo_preto).
grisalho :- verify(cabelo_grisalho).
cabelo_longo :- verify(cabelo_longo). /* pode ter um e o outro n */
cabelo_medio :- verify(cabelo_medio).
cabelo_curto :- verify(cabelo_curto).
				  



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
undo :- retract(yes(_)), fail.
undo :- retract(nao(_)), fail.
undo.