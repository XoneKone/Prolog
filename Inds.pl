ind1:-solve(3,3,Max_P,0,Max_count),write('p = '),write(Max_P),nl,write('Count of right Triangle = '),write(Max_count).


solve(1001,Max_P,Max_P,Max_count,Max_count):-!.
solve(P,Cur_P,Max_P,Cur_C,Max_count):-Z is P-2,split(P,1,1,Z,Number,0),Number>Cur_C,P1 is P+1,solve(P1,P,Max_P,Number,Max_count),!.
solve(P,Cur_P,Max_P,Cur_C,Max_count):-P1 is P+1, solve(P1,Cur_P,Max_P,Cur_C,Max_count).



split(P,A,B,C,Number,Number):- A is P div 3,!.
split(P,A,B,C,Number,Count):- B is (P-A) div 2, A1 is A + 1,B1 is A1,C1 is P-A1-B1,
	(check_exist(A1,B1,C1),check_rightTriangle(A1,B1,C1)->Count1 is Count+1,
	split(P,A1,B1,C1,Number,Count1),!; split(P,A1,B1,C1,Number,Count),!).
split(P,A,B,C,Number,Count):- B1 is B+1, C1 is P - A -B1, 
	(check_exist(A,B1,C1),check_rightTriangle(A,B1,C1) -> Count1 is Count +1,split(P,A,B1,C1,Number,Count1),!;split(P,A,B1,C1,Number,Count),!).

check_exist(A,B,C):- C < A + B. 
check_rightTriangle(A,B,C):- C2 is C*C,A2 is A*A,B2 is B*B, C2 is A2 + B2.


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

write_str(A,B,Length1,Length2):-Length1>Length2,write_str(B),!.
write_str(A,B,Length1,Length2):-write_str(A).

ind3:-read_str(A,N),new_list(A,B),length_list(A,Length1),length_list(B,Length2),write_str(A,B,Length1,Length2).

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

unique([]):-!.
unique([Head|Tail]):-in_list(Tail,Head),!,fail.
unique([_|Tail]):-unique(Tail).

city(riga).
city(penza).
city(lvov).
city(harkov).
city(moscow).

name(sergey).
name(boris).
name(victor).
name(grigoriy).
name(leonid).

ind4:- Students = [student(X,Xcity,Bxcity),student(Y,Ycity,Bycity),student(Z,Zcity,Bzcity),
student(W,Wcity,Bwcity),student(V,Vcity,Bvcity)],

name(X), name(Y),name(Z),name(W),name(V), unique([X,Y,Z,W,V]),

city(Xcity),city(Ycity),city(Zcity),city(Wcity),city(Vcity), unique([Xcity,Ycity,Zcity,Wcity,Vcity]),

city(Bxcity),city(Bycity),city(Bzcity),city(Bwcity),city(Bvcity), unique([Bxcity,Bycity,Bzcity,Bwcity,Bvcity]),

in_list(Students,student(sergey,_,riga)),
in_list(Students,student(boris,riga,penza)),
in_list(Students,student(victor,lvov,moscow)),
in_list(Students,student(grigoriy,_,harkov)),
in_list(Students,student(leonid,P,_)),
in_list(Students,student(_,penza,P)),
not(in_list(Students,student(_,L,L))),

in_list(Students,student(Who,moscow,_)),!,
write(Students),nl,
write(Who).

% 5-ая индивидуалка

ind5:-make_alot(Set,[1,2,3,4,5,6,7,8]),sochet(Sub_set,Set,5),sum_list(Sub_set,S), S is 20, perm(Res,Sub_set),
check(Res),read(;).

check(A):-check(A,0).

check(A,Number):-indexof(A,Number,X), X < 8, Number1 is Number+1,
indexof(A,Number1,X1),X1 < 7, Number2 is Number1+1,
indexof(A,Number2,X2),X2 < 6, Number3 is Number2+1,
indexof(A,Number3,X3),X3 < 5, Number4 is Number3+1,
indexof(A,Number4,X4),X4 < 4.

indexof([Head|_],0,Head):-!.
indexof([_|Tail],I,X):-I1 is I-1,indexof(Tail,I1,X).

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1), S is S1+Head.

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

sochet([],_,0):-!.
sochet([H|Sub_set],[H|Set],K):-K1 is K-1, sochet(Sub_set,Set,K1).
sochet(Sub_set,[_|Set],K):-sochet(Sub_set,Set,K).

make_alot(A,Set,K):-make_alot(A,Set,K,K).
make_alot([],[],_,_):-!.
make_alot(Sub_set,[H|T],K,0):-make_alot(Sub_set,T,K,K),!.
make_alot([H|Tail],[H|T],K,I):-I1 is I-1,make_alot(Tail,[H|T],K,I1).

perm([],[]).
perm(Set,[El|Tail]):-in_list_exlude(El,Set,Set_excluded),perm(Set_excluded,Tail).



