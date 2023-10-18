sublist(Sublist, List) :-
    member(Element, Sublist),
    member(Element, List).

% list_subset([],[]).
% list_subset([Head|Tail],[Head|Subset]) :- list_subset(Tail,Subset).
% list_subset([Head|Tail],Subset) :- list_subset(Tail,Subset).

reverse([], []).    
reverse([Head|Tail], Reversed) :-
    reverse(Tail, ReversedTail),
    append(ReversedTail, [Head], Reversed).

permutations([], []).
permutations([Head|Tail], Permutations) :-
    permutations(Tail, SmallerPermutations),
    insert_all(Head, SmallerPermutations, Permutations).

insert_all(Element, List, [Element|List]).
insert_all(Element, [Head|Tail], [Head|InsertedPermutations]) :-
    insert_all(Element, Tail, InsertedPermutations).

flatten([], []).
flatten([Head|Tail], FlattenedList) :-
    append(Head, FlattenedTail, FlattenedList),
    flatten(Tail, FlattenedTail).

conc([],L,L).
conc([x|L1],L2,[X,L3]):-
    conc(L1,L2,L3).

list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- 
    list_member(X,TAIL).

list_length([],0).
list_length([_|TAIL],N) :- 
    list_length(TAIL,N1), N is N1 + 1.

list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- 
    list_delete(X,L2,L1).

list_append(A,T,T) :- 
    list_member(A,T),!.
list_append(A,T,[A|T]).

list_rev([],[]).
list_rev([Head|Tail],Reversed) :-
   list_rev(Tail, RevTail),list_concat(RevTail, [Head],Reversed).

list_shift([Head|Tail],Shifted) :- 
    list_concat(Tail, [Head],Shifted).

list_sorted([X, Y | Tail]) :-
    X =< Y, 
    list_sorted([Y|Tail]).
list_sorted([X]).

last([X],X).
last([_|T],X) :-
    last(T,X).

even([]).
even([_| Rest]):- 
    odd(Rest).
odd([_| Rest]) :- 
    even(Rest).