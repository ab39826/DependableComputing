`include "onebitadderUpdate.v"

module three_bit_adder(A0,A1,A2,B0,B1,B2,inPar,S0,S1,S2,C2,P2);

//input operands to be added. inPar is the alu input parity used for parity prediction
input A0,A1,A2,B0,B1,B2,inPar;

//s's correspond to sum bits 
output S0,S1,S2,C2,P2;


//c's refer to carry bits, S's refer to sum bits, P's refer to output parity bits for parity prediction
wire C0,C1,C2,S0,S1,S2;
wire P0,P1,P2;

one_bit_adder a1(A0,B0,0,inPar,S0,C0,P0);
one_bit_adder a2(A1,B1,C0,P0,S1,C1,P1);
one_bit_adder a3(A2,B2,C1,P1,S2,C2,P2);

endmodule