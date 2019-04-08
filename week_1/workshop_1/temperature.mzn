array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: HOUR = 1..n;
set of int: HOUR0 = 0..n;

% Action information
enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CHOICE] of int: costs = [1, 5, 3, 9, 0];
array[CHOICE] of int: change = [1, 4, -2, -5, 0];

% Decision variables
array[HOUR0] of var 25..30: temp;
array[HOUR] of var CHOICE: choice;
var int: cost = sum(ch in choice)(costs[ch]);

constraint temp[0] = start;
constraint forall(h in HOUR)
                 (temp[h] = (temp[h-1] + readings[h]) div 2 + change[choice[h]]);

solve minimize cost;

output ["temp = \(temp);\n"
        ++ "choice = \(choice);\n"
        ++ "cost = \(cost);\n"];