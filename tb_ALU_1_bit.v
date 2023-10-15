`include "half_adder.v"
`include "full_adder.v"
`include "comparator_1_bit.v"
`include "decoder_2to4.v"
`include "ALU_1_bit.v"

module tb_ALU_1b;
    reg A,B,Cin,M0,M1;
    wire F, Cout, N;

    ALU_1_bit DUT(A,B,Cin,M0,M1,F,Cout,N);

    initial 
        begin
            $dumpfile("tb_ALU_1b.vcd");
            $dumpvars(0,tb_ALU_1b);
            
            $monitor($time," M1 = %b, M0 = %b, A = %b, B = %b, Cin = %b, F = %b, Cout = %b, N = %b",M1,M0,A,B,Cin,F,Cout,N);

            #5 M1=0; M0 = 1; A = 0; B = 0; Cin = 0;
            #5 A = 0; B = 0; Cin = 1;
            #5 A = 0; B = 1; Cin = 0;
            #5 A = 0; B=1; Cin=1;
            #5 A=1;B=0;Cin=0;
            #5 A=1; B=0; Cin=1;
            #5 A=1; B=1; Cin=0;
            #5 A=1; B=1; Cin=1;

            #5 $finish;
        end
        
endmodule