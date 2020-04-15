
read_list(A,N):-r_l([],A,0,N).
r_l(A,A,N,N):-!.
r_l(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),r_l(B1,A,I1,N).

write_list([]):-!.
write_list([H|T]):-write(H),write_list(T).

ind2:-read(N),read_list(A,N),max_list1(A,Max),arithmetic_mean(A,Am), build_new_list(A,B,Am,Max), write_list(B).

max_list1([H|T],M):-m_l1(T,H,M).
m_l1([],M,M):-!.
m_l1([H|T],Max,M):-H>Max,!,m_l1(T,H,M).
m_l1([_|T],Max,M):-m_l1(T,Max,M).

arithmetic_mean(A,Am):-sum_list(A,S),length_list(A,Length), Am is S div Length.

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1), S is S1+Head.

length_list(A,Length):-length_list(A,0,Length).
length_list([],Length,Length):-!.
length_list([_|T],L,Length):-L1 is L+1,length_list(T,L1,Length).

build_new_list(A,B,Am,Max):-b_n_w(A,[],B,Am,Max).
b_n_w([],B,B,_,_):-!.
b_n_w([Head|Tail],Z,B,Am,Max):-Head>Am,Head<Max,append(Z,[Head],Z1),b_n_w(Tail,Z1,B,Am,Max),!.
b_n_w([_|Tail],Z,B,Am,Max):-b_n_w(Tail,Z,B,Am,Max).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):- K1 is K+1,append(B,[X],B1), get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

ind3:-read_str(A,N),write_str(A),nl,new_list(A,B),write_str(B).

new_list(A,B):-new_list(A,[],B).
new_list([],B,B):-!.
new_list([H|T],C,B):-count_el([H|T],Count,H),name(Count,X),append(C,[H],C1),append(C1,X,C2),delete_el([H|T],H,Nlist),new_list(Nlist,C2,B).

count_el(A,Count,El):-count_el(A,0,Count,El).
count_el([],Count,Count,_):-!.
count_el([El|T],Z,Count,El):- Z1 is Z+1,count_el(T,Z1,Count,El),!.
count_el([_|T],Z,Count,El):-count_el([],Z,Count,El).

delete_el(A,El,Nlist):-delete_el(A,El,[],Nlist).
delete_el([],El,Nlist,Nlist):-!.
delete_el([El|T],El,Z,Nlist):-delete_el(T,El,Z,Nlist),!.
delete_el(A,El,Z,Nlist):-delete_el([],El,A,Nlist),!.

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


ind4:-Students =[_,_,_,_,_],
		in_list(Students,[sergey,_,riga]),

		(in_list(Students,[sergey,penza,_]);
		 in_list(Students,[sergey,harkov,_]);
		 in_list(Students,[sergey,moscow,_])
		),

		in_list(Students,[boris,riga,penza]),
		in_list(Students,[victor,lvov,moscow]),
		in_list(Students,[grigoriy,_,harkov]),

		(
		 in_list(Students,[grigoriy,penza,_]);
		 in_list(Students,[grigoriy,moscow,_])
		),

		in_list(Students,[leonid,harkov,lvov]),		
		in_list(Students,[_,penza,harkov]),
		in_list(Students,[Who,moscow,Rod]),!,
		write(Students),
		nl,write(Who),nl,write(Rod).

