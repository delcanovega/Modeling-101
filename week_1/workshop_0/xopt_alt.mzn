var 0..10: x;
var int: quotient;

constraint 4 * quotient + 0 = x;

solve minimize pow(x - 7, 2);

output ["x = \(x)"];