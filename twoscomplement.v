

//takes the 2's complement of a three bit input i[0:2]

module twos_complement(i0,i1,i2, s0,s1,s2);

input i0,i1,i2;
output s0,s1,s2;


wire s0,s1,s2,c0,c1,c2;


one_bit_adder aa0_b(~(i0),1,0,s0,c0);
one_bit_adder aa1_b(~(i1),0,c0,s1,c1);
one_bit_adder aa2_b(~(i2),0,c1,s2,c2);

endmodule