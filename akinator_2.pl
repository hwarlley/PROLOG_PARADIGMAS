
deducao :- hipotese(Professor),
		write('Acho que o professor e: '),
		write(Professor),
		nl,
		undo.


/* hipoteses */
hipotese(milene)	:- milene, !.
hipotese(elaine)	:- elaine, !.
hipotese(rejane)	:- rejane, !.
hipotese(carla)		:- carla, !.
hipotese(edna)		:- edna, !.
hipotese(fabiana)	:- fabiana, !.

hipotese(edgard)	:- edgard, !.
hipotese(andre_lanna)	:- andre_lanna, !.
hipotese(andre_barros)	:- andre_barros, !.
hipotese(fabricio_braz)	:- fabricio_braz, !.
hipotese(luiz_laranjeira)	:- luiz_laranjeira, !.
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
		  verify('ministra paradigmas de programacao'). /*Com espaco, so funciona com aspas simples - string*/

rejane :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_alta,
		  verify('possui mestrado em matematica computacional'),
		  verify('possui doutorado em engenharia mecanica'),
		  verify('ministra pds').

elaine :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_alta,
		  verify('possui mestrado em ciencia da computacao pela UFSC'),
		  verify('ministra verival').

carla  :- mulher,
		  software,
		  loiro,
		  cabelo_medio,
		  estatura_media,
		  verify(mestrado),
		  verify(doutorado),
		  verify('ministra icg').

edna   :- mulher, 
		  software,
		  loiro,
		  cabelo_medio,
		  estatura_baixa,
		  verify('possui mestrado em sistemas software'),
		  verify('possui doutorado em engenharia eletrica'),
		  verify('ministra sbd').

fabiana  :- mulher, 
		  	software,
		  	preto,
		  	cabelo_longo,
		  	estatura_baixa,
		  	verify('possui mestrado em ciencia computacao pela UFG'),
		  	verify('ministra gcs').

edgard :- homem,
			software,
			preto,
			cabelo_medio,
			estatura_alta,
			verify('possui mestrado ciencia computacao pela UNB'),
			verify('ministra pi1').

andre_lanna :- homem,
			software,
			loiro,
			cabelo_curto,
			estatura_alta,
			verify('possui mestrado em engenharia eletrica pela PUC - MG'),
			verify('ministrava das').

andre_barros :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_alta,
			verify('possui mestrado em ciencia computacao pela UFSC'),
			verify('ministra ihc').

fabricio_braz :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_baixa,
			verify('possui doutorado em engenharia eletrica'),
			verify('ministra das').

mauricio :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_media,
			verify('possui mestrado em ciencia computacao'),
			verify('ministra eda2').

luiz_laranjeira :- homem,
		  software,
		  grisalho,
		  cabelo_curto,
		  estatura_alta,
		  verify('possui doutorado em engenharia da computacao - Texas'),
		  verify('ministra sistemas criticos').

sergio_freitas :- homem,
		  software,
		  grisalho,
		  cabelo_curto,
		  estatura_alta,
		  verify('possui mestrado em computacao'),
		  verify('possui doutorado em engenharia eletrica'),
		  verify('ministra fac').

hilmer :- homem,
		  software,
		  preto,
		  cabelo_longo,
		  estatura_media,
		  verify('possui mestrado em ciencia computacao'),
		  verify('ministra mds').

edson :- homem,
		  software,
		  preto,
		  cabelo_curto,
		  estatura_alta,
		  verify('possui mestrado em matematica'),
		  verify('possui doutorado em engenharia eletrica'),
		  verify('ministra jogos').


/* regras de classificação */

mulher	:- verify('e mulher'), !.
homem	:- verify('e homem'), !.
software :- verify('docente do curso de software').
loiro   :- verify('tem cabelo loiro').
preto 	:- verify('tem cabelo preto').
grisalho :- verify('tem cabelo grisalho').
cabelo_longo :- verify('tem cabelo longo'). /* pode ter um e o outro n */
cabelo_medio :- verify('tem cabelo medio').
cabelo_curto :- verify('tem cabelo curto').
estatura_baixa :- verify('estatura baixa').
estatura_media :- verify('estatura media').
estatura_alta  :- verify('estatura alta').				  



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
	(sim(X)	->	true ;	(nao(X)	 ->	 fail ;	 ask(X))).

/* limpar os asserts */
undo :- retract(sim(_)), fail.
undo :- retract(nao(_)), fail.
undo.
