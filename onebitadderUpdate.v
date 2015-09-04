module one_bit_adder(a0,b0,c0,parInput,sfinal,cfinal,parOutput);

//parity predictor operates such that whenever there is a carry, we flip the input parity.
//this is because a carry occurs when either 2 1's (110) (011) (101) or 3 1's occur (111).
//In all of these cases, the parity should flip because the the XOR of two ones cancel each other out.


//three inputs which are 1 bit each. (TMR voting based on group ABC1, ABC2, ABC3)
input a0;
input b0;
input c0;


//parity based on previous adder computation results (starts off as the PAR input bit for the first stage)
input parInput;

//sum and carry respectively based on TMR voting
output sfinal;
output cfinal;

//parity prediction based on number of carry
output parOutput;


//individual modules (of TMR) results
wire sfinal0, sfinal1, sfinal2;
wire cfinal0, cfinal1, cfinal2;

//other two module results
wire a1,b1,c1;
wire a2,b2,c2;


//split the input between three module wires
assign a1 = a0;
assign a2 = a0;
assign b1 = b0;
assign b2 = b0;
assign c1 = c0;
assign c2 = c0;


//individual module computations
assign sfinal0 = a0^b0^c0;
assign cfinal0 = (a0&b0) | (b0&c0) | (c0&a0);

assign sfinal1 = a1^b1^c1;
assign cfinal1 = (a1&b1) | (b1&c1) | (c1&a1);

assign sfinal2 = a2^b2^c2;
assign cfinal2 = (a2&b2) | (b2&c2) | (c2&a2);

//Voting circuit for the output sum and carry bit + parity prediction
/////////////////////////////////////////
assign sfinal = (sfinal0&sfinal1) | (sfinal0&sfinal2) | (sfinal1&sfinal2);
assign cfinal = (cfinal0&cfinal1) | (cfinal0&cfinal2) | (cfinal1&cfinal2);
assign parOutput = (cfinal) ? ~(parInput) : parInput

endmodule