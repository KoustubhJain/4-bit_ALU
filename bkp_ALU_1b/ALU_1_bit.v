module ALU_1_bit(A,B,Cin,M0,M1,F,Cout,N);
    input A,B,Cin,M0,M1 ;
    output F, Cout,N;
    // When performing arithmetic operations F, Cout and N are used to represent the result, the carry out and negative
    // when ALU is in comparator mode, F --> A == B, Cout --> A>B, N --> A<B

    wire t0,t1,t2,t3;

    wire A0,B0,C0,A1,B1,C1,A2,B2,A3,B3;

    wire F0,F2,F3;

    wire Cout0, Cout1;

    decoder_2to4 dcd1(M0,M1,t0,t1,t2,t3);

    and G1 (A0,t0,A),
        G2 (B0,t0,B),
        G3 (A1,t1,A),
        G4 (B1,t1,B),
        G5 (A2,t2,A),
        G6 (B2,t2,B),
        G7 (A3,t3,A),
        G8 (B3,t3,B),
        G9 (C0,t0,Cin),
        G10(C1,t1,Cin);

    full_adder f1(A0,B0,C0,F0,Cout0);

    comparator_1_bit comp1(A1,B1,F2,Cout1,N);

    and G11(F3,A3,B3);

    or G12(F,F0&t0,F2&t2,F3&t3),
       G13(Cout,Cout0&t0,Cout1&t2);

endmodule