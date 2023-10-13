module decoder_2to4 (S0,S1,R0,R1,R2,R3);

    input   S0, S1;
    output  R0,R1,R2,R3;

    wire inv0,inv1;

    not G1 (inv0,S0),
        G2 (inv1,S1);

    and G3 (R0,inv0,inv1),
        G4 (R1,S0,inv1),
        G5 (R2,inv0,S1),
        G6 (R3,S0,S1);

endmodule