/**************************************************************************/
/*  
principle of this function is to simulate the single set of inputs. This is the first
level of duplication
*/
/**************************************************************************/
`include "threebitadder.v"
`include "twoscomplement.v"
`include "clogic.v"

module mainBasic(A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2,X0,X1,X2,XC,errorout);

input A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2;
output X0,X1,X2,XC,errorout;

/* add your design here */

wire s0,s1,s2,sc;
wire mux_sela,mux_selb;
wire a0,a1,a2,b0,b1,b2;
wire a0c,a1c,a2c,b0c,b1c,b2c;

wire cout, errorout, parout, parcheck;

/////////////// DUPLICATION SIGNALS

wire sd0,sd1,sd2,sdc;
wire muxd_sela,muxd_selb;
wire ad0,ad1,ad2,bd0,bd1,bd2;
wire ad0c,ad1c,ad2c,bd0c,bd1c,bd2c;

wire equalityAnswer;


//generate logic to check for valid c signal code word
clogic clog(C0,C1,C2, cout);
assign parout = ~(A0^A1^A2^B0^B1^B2);
assign parcheck = parout^PAR;





//creating the select signal to choose A or A'
assign mux_sela = C0 | C1;

//creating the select signal to choose B or B'
assign mux_selb = C0 | C2;

////DUPLICATION SIGNALS
assign muxd_sela = C0 | C1;
assign muxd_selb = C0 | C2;

//generate 2's complement
twos_complement tca(A0,A1,A2,a0c,a1c,a2c);
twos_complement tcb(B0,B1,B2,b0c,b1c,b2c);

///DUPLICATION SIGNALS
twos_complement tcaD(A0,A1,A2,ad0c,ad1c,ad2c);
twos_complement tcbD(B0,B1,B2,bd0c,bd1c,bd2c);

//mux to choose between A and A'
assign a0 = (mux_sela) ? A0 : a0c;
assign a1 = (mux_sela) ? A1 : a1c;
assign a2 = (mux_sela) ? A2 : a2c;

//mux to choose between B and B'
assign b0 = (mux_selb) ? B0 : b0c;
assign b1 = (mux_selb) ? B1 : b1c;
assign b2 = (mux_selb) ? B2 : b2c;

//DUPLICATION SIGNALS
assign ad0 = (muxd_sela) ? A0 : ad0c;
assign ad1 = (muxd_sela) ? A1 : ad1c;
assign ad2 = (muxd_sela) ? A2 : ad2c;

assign bd0 = (muxd_selb) ? B0 : bd0c;
assign bd1 = (muxd_selb) ? B1 : bd1c;
assign bd2 = (muxd_selb) ? B2 : bd2c;


//actual arithmetic operation
three_bit_adder tba(a0,a1,a2,b0,b1,b2,s0,s1,s2,sc);

//DUPLICATION SIGNALS
three_bit_adder tbad(ad0,ad1,ad2,bd0,bd1,bd2,sd0,sd1,sd2,sdc);

//EQUALITY CHECKING
assign equalityAnswer = (s0^s1^s2^sc^sd0^sd1^sd2^sdc);


assign errorout = parcheck | cout | equalityAnswer;


assign X0 = s0;
assign X1 = s1;
assign X2 = s2;
assign XC = sc;


endmodule
