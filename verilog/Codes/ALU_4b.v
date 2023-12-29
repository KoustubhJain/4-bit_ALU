module ALU_4b(M1,M0,A,B,Cin,F,Cout);
    // when in comparator mode, MSB of F and Cout represent final result
    input M1,M0,Cin;
    input [3:0]A,B;
    output [3:0]F;
    output Cout;

    wire t0,t1,t2;

    ALU_1b A0(M1,M0,A[0],B[0],Cin,1'b0,1'b0,F[0],t0);

    ALU_1b A1(M1,M0,A[1],B[1],t0,F[0],t0,F[1],t1);

    ALU_1b A2(M1,M0,A[2],B[2],t1,F[1],t1,F[2],t2);

    ALU_1b A3(M1,M0,A[3],B[3],t2,F[2],t2,F[3],Cout);
    
endmodule