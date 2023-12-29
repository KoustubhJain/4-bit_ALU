`include "half_adder.v"
`include "full_adder.v"
`include "decoder.v"
`include "comparator.v"
`include "ALU_1b.v"

module tb_ALU_1b;
    reg M1,M0,A,B,Cin,C1,C0;
    wire F, Cout;

    ALU_1b DUT(M1,M0,A,B,Cin,C1,C0,F,Cout);

    initial 
        begin
            $dumpfile("tb_ALU_1b.vcd");
            $dumpvars(0,tb_ALU_1b);

            $monitor($time," M1 = %b, M0 = %b, A = %b, B = %b, Cin = %b, C1 = %b, C0 = %b, F = %b, Cout = %b",M1,M0,A,B,Cin,C1,C0,F,Cout);

            #5 M1=1; M0 = 1; A = 0; B = 0; Cin = 0; C1 = 0; C0 = 0;
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