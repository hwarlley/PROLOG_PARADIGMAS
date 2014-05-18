
deducao :- hipotese(Professor),
		write('Acho que o(a) professor(a) eh: '),
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
		  verify('Ministra Paradigmas de Programacao'). /*Com espaco, so funciona com aspas simples - string*/

rejane :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_alta,
		  verify('Possui mestrado em Matematica Computacional'),
		  verify('Possui doutorado em Engenharia Mecanica'),
		  verify('Ministra Processo de Desenvolvimento de Software').

elaine :- mulher,
		  software,
		  loiro,
		  cabelo_longo,
		  estatura_alta,
		  verify('Possui mestrado em Ciencia da Computacao pela UFSC'),
		  verify('Ministra Verificacao e Validacao de Software').

carla  :- mulher,
		  software,
		  loiro,
		  cabelo_medio,
		  estatura_media,
		  verify(mestrado),
		  verify(doutorado),
		  verify('Ministra Introducao a Computacao Grafica').

edna   :- mulher, 
		  software,
		  loiro,
		  cabelo_medio,
		  estatura_baixa,
		  verify('Possui mestrado em Sistemas Software'),
		  verify('Possui doutorado em Engenharia Eletrica'),
		  verify('Ministra Sistemas de Banco de Dados').

fabiana  :- mulher, 
			software,
			preto,
			cabelo_longo,
			estatura_baixa,
			verify('Possui mestrado em Ciencia da Computacao pela UFG'),
			verify('Ministra Gerencia de Configuracao de Software').

edgard :- homem,
			software,
			preto,
			cabelo_medio,
			estatura_alta,
			verify('Possui mestrado em Ciencia da Computacao pela UnB'),
			verify('Ministra Projeto Integrador de Engenharia 1').

andre_lanna :- homem,
			software,
			loiro,
			cabelo_curto,
			estatura_alta,
			verify('Possui mestrado em Engenharia Eletrica pela PUC-MG'),
			verify('Ministrava Desenvolvimento Avancado de Software').

andre_barros :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_alta,
			verify('Possui mestrado em Ciencia da Computacao pela UFSC'),
			verify('Ministra Interacao Humano Computador').

fabricio_braz :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_baixa,
			verify('Possui doutorado em Engenharia Eletrica'),
			verify('Ministra Desenvolvimento Avancado de Software').

mauricio :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_media,
			verify('Possui mestrado em Ciencia Computacao'),
			verify('Ministra Estrutura de Dados e Algoritimos 2').

luiz_laranjeira :- homem,
		  software,
		  grisalho,
		  cabelo_curto,
		  estatura_alta,
		  verify('Possui doutorado em Engenharia da Computacao pela UT-Austin'),
		  verify('Ministra Topicos Especiais em Sistemas Criticos').

sergio_freitas :- homem,
		  software,
		  grisalho,
		  cabelo_curto,
		  estatura_alta,
		  verify('Possui mestrado em Computacao'),
		  verify('Possui doutorado em Engenharia Eletrica'),
		  verify('Ministra Fundamentos de Arquitetura de Computadores').

hilmer :- homem,
		  software,
		  preto,
		  cabelo_longo,
		  estatura_media,
		  verify('Possui mestrado em Ciencia da Computacao'),
		  verify('Ministra Metodos de Desenvolvimento de Software').

edson :- homem,
		  software,
		  preto,
		  cabelo_curto,
		  estatura_alta,
		  verify('Possui mestrado em Matematica'),
		  verify('Possui doutorado em Engenharia Eletrica'),
		  verify('Ministra Introducao aos Jogos Eletronicos').


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
