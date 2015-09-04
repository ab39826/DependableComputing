/**************************************************************************/
/*  Stub for Project in EE382M - Dependable Computing
*/
/*
*/
/*  Do not change I/O names in main() module
*/
/*
*/
/**************************************************************************/
//Anurag Banerjee
`include "onebitadder.v"
`include "threebitadder.v"
`include "twoscomplement.v"
`include "clogic.v"

module main(A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2,X0,X1,X2,XC,XE0,XE1,
            Y0,Y1,Y2,YC,YE0,YE1);

input A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2;
output X0,X1,X2,XC,XE0,XE1,Y0,Y1,Y2,YC,YE0,YE1;

/* add your design here */

//final computation wires
wire s0,s1,s2,sc;
wire mux_sela,mux_selb;
wire a0,a1,a2,b0,b1,b2;
wire a0c,a1c,a2c,b0c,b1c,b2c;

wire cout, errorout, parout, parcheck;


//generate logic to check for valid c signal code word
clogic clog(C0,C1,C2, cout);
assign parout = A0^A1^A2^B0^B1^B2;
assign parcheck = ~(parout & PAR);

assign errorout = parcheck | cout;



//creating the select signal to choose A or A'
assign mux_sela = C0 | C1;

//creating the select signal to choose B or B'
assign mux_selb = C0 | C2;

//generate 2's complement
twos_complement tca(A0,A1,A2,a0c,a1c,a2c);
twos_complement tcb(B0,B1,B2,b0c,b1c,b2c);

//mux to choose between A and A'
assign a0 = (mux_sela) ? A0 : a0c;
assign a1 = (mux_sela) ? A1 : a1c;
assign a2 = (mux_sela) ? A2 : a2c;

//mux to choose between B and B'
assign b0 = (mux_selb) ? B0 : b0c;
assign b1 = (mux_selb) ? B1 : b1c;
assign b2 = (mux_selb) ? B2 : b2c;

assign XE0 = (errorout) ? errorout : 0;
assign XE1 = (errorout) ? errorout : 1;

assign YE0 = (errorout) ? errorout : 0;
assign YE1 = (errorout) ? errorout : 1;

//actual arithmetic operation
three_bit_adder tba(a0,a1,a2,b0,b1,b2,s0,s1,s2,sc);



assign X0 = s0;
assign X1 = s1;
assign X2 = s2;
assign Y0 = s0;
assign Y1 = s1;
assign Y2 = s2;
assign XC = sc;
assign YC = sc;


endmodule
