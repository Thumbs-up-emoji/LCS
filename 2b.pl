resistor(1, 0).
resistor(0, 1).

transistor(1, 1, 0).
transistor(0, _, 1).

inverter(In,Out):-         
    resistor(1,Out),transistor(In,0,Out).

bachelor(X):- male(X), not(married(X)).
married(john).
male(john).
male(bill).

% wants(Student, Course)
wants(adams, semantics).
wants(adams, proofs_and_types).
wants(arnold, semantics).
wants(arnold, proofs_and_types).
wants(milton, requirements).

% avail(Student, Course)
avail(adams, semantics).
avail(arnold, proofs_and_types).
avail(milton, semantics).
avail(milton, proofs_and_types).

% Base case: the set of an empty list is an empty list.
list_to_set([], []).

% If the head of the list is in the tail, remove it.
list_to_set([H|T], Set) :-
    member(H, T),
    list_to_set(T, Set).

% If the head of the list is not in the tail, include it in the set.
list_to_set([H|T], [H|Set]) :-
    \+ member(H, T),
    list_to_set(T, Set).

% Union of wants and avail
union(Student, Course) :-
    wants(Student, Course);
    avail(Student, Course).


% Intersection of wants and avail
intersection(Student, Course) :-
    wants(Student, Course),
    avail(Student, Course).

% Difference of wants and avail
difference(Student, Course) :-
    wants(Student, Course),
    \+ avail(Student, Course). % not

% If X equals Y, then the GCD is X.
gcd(X, X, X).

% If X is less than Y, then the GCD is the GCD of X and (Y - X).
gcd(X, Y, Z) :-
    X < Y,
    Y1 is Y - X,
    gcd(X, Y1, Z).

% If X is greater than Y, then the GCD is the GCD of Y and X.
gcd(X, Y, Z) :-
    X > Y,
    gcd(Y, X, Z).

% Base case: the permutations of an empty list is an empty list.
permutations([], []).

% Recursive case: insert the head into all permutations of the tail.
permutations([Head|Tail], Permutations) :-
    permutations(Tail, SmallerPermutations),
    insert_all(Head, SmallerPermutations, Permutations).

% Base case: if the list of smaller permutations is empty, the result is also an empty list.
insert_all(_, [], []).

% Recursive case: insert the element into the first smaller permutation, then recursively insert it into the rest.
insert_all(X, [H|T], [H1|T1]) :-
    insert(X, H, H1),
    insert_all(X, T, T1).

% Insert X into list L at one possible position to get list Y.
insert(X, L, Y) :-
    append(Prefix, Suffix, L),
    append(Prefix, [X|Suffix], Y).

% Base case: the empty set is a subset of any set.
subset([], _).

% Recursive case: if H is in S and T is a subset of S, then [H|T] is a subset of S.
subset([H|T], S) :-
    member(H, S),
    subset(T, S).

% S1 is in the power set of S if it's a subset of S.
in_powerset(S1, S) :-
    subset(S1, S).

% Two subsets form a partition of a set if they are both non-empty, their intersection is empty, and their union is the original set.
partition(S, S1, S2) :-
    subset(S1, S),
    subset(S2, S),
    intersection(S1, S2, []),
    union(S1, S2, S).
