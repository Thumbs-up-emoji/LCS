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
