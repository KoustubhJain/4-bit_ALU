module comparator(A,B,C0,C1,Z0,Z1);
    //C1C0 indicate result of previous bits
    //Z1Z0 indicate result of current bits
    input A,B,C0,C1;
    output Z0,Z1;

    wire t0, t1, t2, t3, t4, t5;

    and g1(t0,A,~B),
        g2(t1,A,C1),
        g3(t2,~B,C1),
        g4(t3,~A,B),
        g5(t4,~A,C0),
        g6(t5,B,C0);

    or g7(Z1,t0,t1,t2),
       g8(Z0,t3,t4,t5);

endmodule