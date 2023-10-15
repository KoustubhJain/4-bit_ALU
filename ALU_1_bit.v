module ALU_1_bit(A,B,Cin,M0,M1,F,Cout,N);
    input A,B,Cin,M0,M1 ;
    output F, Cout,N;
    // When performing arithmetic operations F, Cout and N are used to represent the result, the carry out and negative
    // when ALU is in comparator mode, F --> A == B, Cout --> A>B, N --> A<B

    wire t0,t1,t2,t3;
    decoder_2to4 dcd1(M0,M1,t0,t1,t2,t3);

    wire [2:0]EN_add,EN_sub;
    wire [1:0]EN_cmp,EN_and;

    and (EN_add[0],t0,A),
        (EN_add[1],t0,B),
        (EN_add[2],t0,Cin),
        (EN_sub[0],t1,A),
        (EN_sub[1],t1,B^t1),
        (EN_sub[2],t1,Cin^t1),
        (EN_cmp[0],t2,A),
        (EN_cmp[1],t2,B),
        (EN_and[0],t3,A),
        (EN_and[1],t3,B);

    wire j0,j1,j2,F0,F1,F2,C0,C1;

    or  (j0,EN_add[0],EN_sub[0]),
        (j1,EN_add[1],EN_sub[1]),
        (j2,EN_add[2],EN_sub[2]);
        
    full_adder f1(j0,j1,j2,F0,C0);
    comparator_1_bit cmp1(EN_cmp[0],EN_cmp[1],F1,C1,N);
    and (F2,EN_and[0],EN_and[1]);

    or (F,F0&(t0|t1),F1&t2,F2&t3);
    or (Cout,C0&(t0|t1),C1&t2);
    

endmodule