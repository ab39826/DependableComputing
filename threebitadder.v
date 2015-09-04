`include "onebitadder.v"

module three_bit_adder(A0,A1,A2,B0,B1,B2,R0,R1,R2,RC);

//input operands to be added
input A0,A1,A2,B0,B1,B2;

//r's correspond to result and final carry bit
output R0,R1,R2,RC;


wire t1,t2,R0,R1,R2,RC;

one_bit_adder a1(A0,B0,0,R0,t1);
one_bit_adder a2(A1,B1,t1,R1,t2);
one_bit_adder a3(A2,B2,t2,R2,RC);

endmodule