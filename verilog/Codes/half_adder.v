module half_adder(A,B,Sum,C_out);
    input A,B;
    output C_out,Sum;

    xor  G1  (Sum,A,B)   ;
    and G2  (C_out,A,B) ; 

endmodule