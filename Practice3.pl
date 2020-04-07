pr1:-read(N),read_list(A,N),sum_list(A,S),write(S).
read_list(A,N):-r_l([],A,0,N).
r_l(A,A,N,N):-!.
r_l(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_l(B1,A,I1,N).

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1), S is S1+Head.

pr2:-read(N),read(I),read_list(A,N),indexof(A,I,X),write(X).
indexof([Head|_],0,Head):-!.
indexof([_|Tail],I,X):-I1 is I-1,indexof(Tail,I1,X).


write_list([]):-!.
write_list([H|T]):-write(H),write_list(T).

pr3:-read(N),read_list(A,N),min_list(A,M),write(M).
min_list([H|T],M):-m_l(T,H,M).
m_l([],M,M):-!.
m_l([H|T],Min,M):-H<Min,!,m_l(T,H,M).
m_l([_|T],Min,M):-m_l(T,Min,M).

pr4:-read(N),read_list(A,N),read(El),find(A,El).
find([X|_],X):-!.
find([_|Y],E):-find(Y,E).

pr5:-read(N),read_list(A,N),read(X),num_list(A,X,M),write(M).
num_list(A,X,M):-num_list(A,X,0,M).
num_list([X|_],X,I,I):-!.
num_list([],_,_,-1):-!.
num_list([_|T],X,I,M):-I1 is I+1,num_list(T,X,I1,M).

pr6:-read(N),read_list(A,N),reverse_list(A,B),write_list(B).
reverse_list(A,B):-reverse_list(A,[],B).
reverse_list([],B,B):-!.
reverse_list([H|T],C,B):-reverse_list(T,[H|C],B).

pr7:-read(N),read_list(A,N),read(M),read_list(B,M), sublist(B,A).
match([],_):-!.
match([H1|T1],[H1|T]):-match(T1,T).

sublist(B,A):-match(B,A),!.
sublist(B,[_|Tail]):-match(B,Tail).


pr8:- read(N),read_list(A,N),read(Index),build_w_ind(A,B,Index),write_list(B).
build_w_ind(A,B,Index):-b_w_i(A,[],B,0,Index).
b_w_i([],B,B,_,_):-!.
b_w_i([H|T],Z,B,CurInd,Index):-CurInd \=Index,CurInd1 is CurInd+1,append(Z,[H],Z1),b_w_i(T,Z1,B,CurInd1,Index).
b_w_i([_|T],Z,B,CurInd,Index):-C is CurInd+1,b_w_i(T,Z,B,C,Index).

pr9:- read(N),read_list(A,N),read(El),build_w_el(A,B,El),write_list(B).
build_w_el(A,B,El):-b_w_e(A,[],B,El).
b_w_e([],B,B,_):-!.
b_w_e([H|T],Z,B,El):-H\=El,append(Z,[H],Z1),b_w_e(T,Z1,B,El).
b_w_e([_|T],Z,B,El):-b_w_e(T,Z,B,El).

pr10:- read(N),read_list(A,N),different(A).

different([]):-!.
different([Head|Tail]):- not(in_list(Tail,Head)),different(Tail).

in_list([H|_],H):-!.
in_list([_|T],El):-in_list(T,El).

pr11:-read(N),read_list(A,N),new_list(A,B),write_list(B).

new_list(A,B):-n_l(A,[],B).
n_l([],B,B):-!.
n_l([Head|Tail],CurList,B):-not(in_list(CurList,Head)),append(CurList,[Head],B1),n_l(Tail,B1,B),!.
n_l([_|Tail],CurList,B):-n_l(Tail,CurList,B).

pr12:-read(N),read(El),read_list(A,N),count(A,El,Kol),write(Kol).
count(A,El,Kol):-count(A,0,Kol,El).
count([],Kol,Kol,_):-!.
count([El|T],Z,Kol,El):- Z1 is Z+1,count(T,Z1,Kol,El),!.
count([_|T],Z,Kol,El):-count(T,Z,Kol,El).

pr13:-read(N),read_list(A,N),length_list(A,Length),write(Length).
length_list(A,Length):-length_list(A,0,Length).
length_list([],Length,Length):-!.
length_list([_|T],L,Length):-L1 is L+1,length_list(T,L1,Length).