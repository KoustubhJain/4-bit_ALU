module full_adder(A,B,C_in,Sum,C_out);
    input   A,B,C_in    ;
    output  Sum,C_out   ;

    wire t1,t2,t3   ;

    half_adder  H1(A,B,t1,t2)       ;
    half_adder  H2(t1,C_in,Sum,t3)  ;

    or G1(C_out,t2,t3)  ;

endmodule