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
`include "projectsetInput.v"

module main(A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2,X0,X1,X2,XC,XE0,XE1,
            Y0,Y1,Y2,YC,YE0,YE1);

input A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2;
output X0,X1,X2,XC,XE0,XE1,Y0,Y1,Y2,YC,YE0,YE1;


//individual duplicated module signals
wire Xerror, Yerror;
wire x0,x1,x2,xc,y0,y1,y2,yc; //these refer to the individual module outputs




/* add your design here */

mainBasic mainX(A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2,x0,x1,x2,xc,Xerror);

mainBasic mainY(A0,A1,A2,B0,B1,B2,PAR,C0,C1,C2,y0,y1,y2,yc,Yerror);
			
//if one module fails, the other should keep operating			
assign XE0 = (Xerror) ? Xerror : 0;
assign XE1 = (Xerror) ? Xerror : 1;

assign YE0 = (Yerror) ? Yerror : 0;
assign YE1 = (Yerror) ? Yerror : 1;


//assign each set of outputs respectively from their individual computation module
assign X0 = x0;
assign X1 = x1;
assign X2 = x2;
assign Y0 = y0;
assign Y1 = y1;
assign Y2 = y2;
assign XC = xc;
assign YC = yc;

endmodule
