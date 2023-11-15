% (a) mygrandchildren(X,Y) returns true iff X is grandchildren of Y.
mygrandchildren(X,Y) :- parent(Y,Z), parent(Z,X).

% Facts for testing
parent(a,b).
parent(b,c).
parent(b,d).
parent(e,b).

% (b) mymember(X,L) returns true iff X is an element of the list L.
mymember(X,[X|_]).
mymember(X,[_|T]) :- mymember(X,T).

% (c) mysubset(L1,L2) returns true iff all the elements of L1 are elements of L2.
mysubset([], []).
mysubset([X|SubTail], [X|Tail]) :- mysubset(SubTail, Tail).
mysubset(Sub, [_|Tail]) :- mysubset(Sub, Tail).


% (d) mylast(X,L) returns true iff X is the last element of the list L.
mylast(X,[X]).
mylast(X,[_|T]) :- mylast(X,T).

% (e) myfirst(X,L) returns true iff X is the first element of the list L.
myfirst(X,[X|_]).

% (f) mytwice(X,Y) returns true iff the left argument X is a list, and the right argument Y is a list consisting of every element in X written twice.
mytwice([],[]).
mytwice([H|T],[H,H|Y]) :- mytwice(T,Y).

% Define the merge predicate
merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], [H1|M]) :- H1 =< H2, merge(T1, [H2|T2], M).
merge([H1|T1], [H2|T2], [H2|M]) :- H1 > H2, merge([H1|T1], T2, M).

% Define the predicate
list_to_num(L, N) :- list_to_num(L, 0, N).

% Base case: An empty list results in the accumulator
list_to_num([], Acc, Acc).

% Recursive case: Multiply the accumulator by 10, add the current digit, and recurse on the tail of the list
list_to_num([H|T], Acc, N) :- NewAcc is Acc * 10 + H, list_to_num(T, NewAcc, N).

% Define the slice predicate
slice(L, I, K, S) :- I1 is I - 1, length(Prefix, I1), append(Prefix, Rest, L), K1 is K - I1, length(S, K1), append(S, _, Rest).

% Define the is_prime predicate
is_prime(2).
is_prime(N) :- N > 2, \+ has_factor(N, 2).

% Define the has_factor predicate
has_factor(N, F) :- N mod F =:= 0.
has_factor(N, F) :- F * F < N, F2 is F + 1, has_factor(N, F2).

% Use the is_prime predicate
?- is_prime(7).

% Define the combination predicate
combination(0, _, []).
combination(K, [X|Xs], [X|Ys]) :- K > 0, K1 is K - 1, combination(K1, Xs, Ys).
combination(K, [_|Xs], Ys) :- K > 0, combination(K, Xs, Ys).

% Use the combination predicate
?- combination(3,[a,b,c,d,e,f],L).

% Define the rotate predicate
rotate(L, N, R) :- length(Prefix, N), append(Prefix, Suffix, L), append(Suffix, Prefix, R).

% Use the rotate predicate
?- rotate([a,b,c,d,e,f,g,h],3,X).
?- rotate([a,b,c,d,e,f,g,h],-2,X).

% Define the dupli predicate
dupli([], _, []).
dupli([X|Xs], N, Y) :- dupli(Xs, N, Ys), replicate(X, N, Z), append(Z, Ys, Y).

% Define the replicate predicate
replicate(_, 0, []).
replicate(X, N, [X|Xs]) :- N > 0, N1 is N - 1, replicate(X, N1, Xs).
