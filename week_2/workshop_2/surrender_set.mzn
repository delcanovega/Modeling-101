% workshop 2
% select a set of trade negotiation party
enum NEGOTIATOR;
NEGOTIATOR: dummy; 

int: l; % minimum party size
int: u; % maximum party size
int: m; % minimum joint ability

array[NEGOTIATOR] of int: honor;
array[NEGOTIATOR,NEGOTIATOR] of int: joint;

var set of NEGOTIATOR: party;
var int: obj;

constraint card(party) >= l /\ card(party) <= u;
constraint sum([ joint[n1, n2] | n1, n2 in party where n1 > n2 ]) >= m;

constraint obj = min([ honor[n] | n in party ]);

solve maximize obj;

output ["party = \(party)\n"
        ++ "obj = \(obj)"];