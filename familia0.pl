dd(juan, maria, rosa, m).
dd(juan, maria, luis, h).
dd(jose, laura, pilar, m).
dd(luis, pilar, miguel, h).
dd(miguel,isabel,jaime,h).
dd(pedro, rosa, pablo, h).
dd(pedro, rosa, begoña, m).

padre(X, Y):- dd(X, _, Y, _).
madre(X, Y):- dd( _, X, Y, _).
hijo(X, Y):- (dd( Y, _, X, Z) ; dd( _, Y, X, Z)), Z = h.
hija(X, Y):- (dd( Y, _, X, Z) ; dd( _, Y, X, Z)), Z = m.
hermano(X,Y):- dd( P, M, X, S), dd( P, M, Y, _), S = h, X\=Y.
hermana(X,Y):- dd( P, M, X, S), dd( P, M, Y, _), S = m, X\=Y.
abuelo(X,Y) :- padre(X,Z) , (padre(Z,Y) ; madre(Z,Y)).
abuela(X,Y) :- madre(X,Z) , (padre(Z,Y) ; madre(Z,Y)).
primo(X,Y) :- hijo(X,Z) , (hermano(Z,W) ; hermana(Z,W)), (padre(W,Y) ; madre(W,Y)).
prima(X,Y) :- hija(X,Z) , (hermano(Z,W) ; hermana(Z,W)), (padre(W,Y) ; madre(W,Y)).
asc(X,Y) :- (padre(X,Y) ; madre(X,Y)) ; (asc(X,Z) , (padre(Z,Y) ; madre(Z,Y))).
