module ALU_1_bit(A,B,Cin,M0,M1,F,Cout,N);
    input A,B,Cin,M0,M1 ;
    output F, Cout,N;
    // When performing arithmetic operations F, Cout and N are used to represent the result, the carry out and negative
    // when ALU is in comparator mode, F --> A == B, Cout --> A>B, N --> A<B

    wire t0,t1,t2,t3;
    decoder_2to4 dcd1(M0,M1,t0,t1,t2,t3);

    wire k0,k1,k2,k3,k4,k5,k6,k7;

    and (k0,t0|t1,A);
    xor (k1,t1,k0);

    and (k2,t0|t1,B),
        (k3,t2,A),
        (k4,t2,B),
        (k5,t3,A),
        (k6,t3,B),
        (k7,t0|t1,Cin);

    wire F0,F1,F2;
    wire C0,C1;

    full_adder f1(k1,k2,k7,F0,C0);

    comparator_1_bit cmp1(k3,k4,F1,C1,N);

    and g1(F2,k5,k6);

    or (F,F0&(t0|t1),F1&t2,F2&t3);
    or (Cout,C0&(t0|t1),C1&t2);

endmodule