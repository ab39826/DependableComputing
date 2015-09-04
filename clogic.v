module clogic (c0,c1,c2, cout);

input c0,c1,c2;
output cout;

//These refer to the outputs of the and gates
wire out01, out02, out12;
wire orOut1, orOut2, norOut,orOut;

wire cout;

assign out01 = c0 & c1;
assign out02 = c0 & c2;
assign out12 = c1 & c2;

//nor gate for when C0=C1=C2=0
assign orOut1 = c0 | c1;


assign norOut = ~(orOut1 | c2);
assign orOut = out01 | out02;


assign orOut2 = out12 | norOut;

//final output
assign cout = orOut | orOut2;



endmodule


