% workshop 2
% select a set of trade negotiation party
enum NEGOTIATOR;
NEGOTIATOR: dummy; 

int: l; % minimum party size
int: u; % maximum party size
int: m; % minimum joint ability

array[NEGOTIATOR] of int: honor;
array[NEGOTIATOR,NEGOTIATOR] of int: joint;

array[1..u] of var NEGOTIATOR: party;
var int: obj;

include "alldifferent_except_0.mzn";
constraint alldifferent_except_0(party);
constraint sum([ joint[n1, n2] | n1, n2 in party where n1 > n2 ]) >= m;

constraint forall(n in 1..u-1)(party[n] <= party[n+1]);

constraint obj = min([ honor[n] | n in party where n != dummy]);

solve maximize obj;

output ["party = {"] ++ [show(party[i]) ++ if i == u then "};\n" else ", " endif | i in 1..u ]
        ++ ["obj = \(obj)"];