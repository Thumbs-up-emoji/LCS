# LCS
 Prolog

in ''=atom, else var
first capitalized= var, else atom
first underscore=var, else atom
if whitespaces without '' outside, then neither

clause-combo of rule and fact
student('vineet') is fact - here student is predicate, vineet is an atom, we could also have used some variable, say Vineet

.(period) after every line
:- is if then, i.e. implication
, is and operator when outside predicate
if comma is inside predicate, it becomes, intuitive [Example- "loves(x,Y):-father(X,Y)" means " if X loves Y then X is father of Y"]
; is or operator
?-query

ishappy(bob):-sings(bob), OR IF GENERALISED head:-body - here ishappy() and sings() are both rules

