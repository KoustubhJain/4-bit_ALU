module comparator_1_bit(A,B,Eq,G,L);
    input A,B;
    output Eq,G,L;

    xnor G1 (Eq,A,B);
    and G2 (G,A,~B),
        G3 (L,~A,B);

endmodule