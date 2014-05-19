
deducao :- hipotese(Professor, Professor_img),
		write('Acho que o(a) professor(a) eh: '),
		write(Professor),
		nl,
		undo,
		shell(Professor_img).


/* hipoteses */
hipotese(milene, 'xdg-open milene.jpg')	:- milene, !.
hipotese(elaine, 'xdg-open elaine.jpg')	:- elaine, !.
hipotese(rejane, 'xdg-open rejane.jpg')	:- rejane, !.
hipotese(carla, 'xdg-open carla.jpg')		:- carla, !.
hipotese(edna, 'xdg-open edna.jpg')		:- edna, !.
hipotese(fabiana, 'xdg-open fabiana.jpg')	:- fabiana, !.

hipotese(edgard, 'xdg-open edgard.jpg')	:- edgard, !.
hipotese(andre_lanna, 'xdg-open andre_lanna.jpg')	:- andre_lanna, !.
hipotese(andre_barros, 'xdg-open andre_barros.jpg')	:- andre_barros, !.
hipotese(fabricio_braz, 'xdg-open fabricio_braz.jpg')	:- fabricio_braz, !.
hipotese(luiz_laranjeira, 'xdg-open luiz_laranjeira.jpg')	:- luiz_laranjeira, !.
hipotese(mauricio, 'xdg-open mauricio.jpg')	:- mauricio, !.
hipotese(sergio_freitas, 'xdg-open sergio_freitas.jpg')	:- sergio_freitas, !.
hipotese(hilmer, 'xdg-open hilmer.jpg')	:- hilmer, !.
hipotese(edson, 'xdg-open edson.jpg')		:- edson, !.
hipotese(george, 'xdg-open george.jpg')		:- george, !.
hipotese(paulo, 'xdg-open paulo.jpg')		:- paulo, !.
hipotese(ricardo_ajax, 'xdg-open ricardo_ajax.jpg')		:- ricardo_ajax, !.

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

paulo :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_media,
			verify('Possui mestrado pela USP'),
			verify('Ministra MES').


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

george :- homem,
			software,
			preto,
			cabelo_curto,
			estatura_baixa,
			verify('Possui mestrado em Gestao do Conhecimento e da Tecnologia da Informacao MGCTI (UCB)'),
			verify('Ministra Requisitos').

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

ricardo_ajax :- homem,
		  software,
		  preto,
		  cabelo_curto,
		  estatura_alta,
		  verify('Possui Mestrado em Gestao do Conhecimento e da Tecnologia da Informacao- UcB'),
		  verify('Ministrava TMES e VERIVAL').


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
	write('O professor(a) tem a seguinte caracteristica: '),
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
