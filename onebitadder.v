module one_bit_adder(a0,b0,c0,s0,c1);

//three inputs which are 1 bit each
input a0;
input b0;
input c0;

//sum and carry respectively
output s0;
output c1;

assign s0 = a0^b0^c0;
assign c1 = (a0&b0) | (b0&c0) | (c0&a0);

endmodule