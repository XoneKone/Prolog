max(X,Y,X):-X>Y,!.
max(X,Y,Y):-X<Y.
max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
fact1(N,X):- fact2(1,N,1,X).
fact2(N,N,X,X):-!.
fact2(I,N,Y,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,N,Y1,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

fib1(N,X):- fib2(2,N,1,1,X).
fib2(N,N,_,X,X):-!.
fib2(I,N,A1,A2,X):- I1 is I+1, A3 is A1+A2, fib2(I1,N,A2,A3,X).

pr(X):-pr1(1,X).
pr1(N,N):-!.
pr1(I,A):- R is A mod I,R=0,!,fail.
pr1(I,A):-I1 is I+1, pr1(I1,A).

nprdel(A,X):-n_pr(A,A,X).
n_pr(I,A,I):-pr(I),R is A mod I,R=0,!.
n_pr(I,A,X):-I1 is I-1,n_pr(I1,A,X).

st_num(X,A):-startnumber(1,X,1,A).
startnumber(_,1000000,A,A):-!.
startnumber(Max_length,X,_,Z):-zep(Length,X),X1 is X+1,Length>Max_length,startnumber(Length,X1,X,Z),!.
startnumber(Max_length,X,X_mas,Z):-X1 is X+1,startnumber(Max_length,X1,X_mas,Z),!.
zep(Z,X):-zep1(Z,1,X).
zep1(N,N,1):-!.
zep1(Z,N,X):-R is X mod 2,R=0,N1 is N+1,X1 is X/2,zep1(Z,N1,X1),!.
zep1(Z,N,X):-N1 is N+1,X1 is X*3+1,zep1(Z,N1,X1),!.

sum_digits_num(0,A,A):-!.
sum_digits_num(X,A,S):-R is X mod 10,S1 is S+R,X1 is X div 10,sum_digits_num(X1,A,S1),!.

nod(Nod,0,Nod):-!.
nod(A,B,Nod):-R is A mod B, nod(B,R,Nod).

euler_fun(X,Count):-e_f(X,X,Count,0).
e_f(0,_,Count,Count):-!.
e_f(Z,X,Count,C):-Z1 is Z-1,nod(Z1,X,Nod),Nod = 1,C1 is C+1,e_f(Z1,X,Count,C1),!.
e_f(Z,X,Count,C):-Z1 is Z-1,e_f(Z1,X,Count,C),!.
