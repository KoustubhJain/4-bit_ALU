`include "half_adder.v"
`include "full_adder.v"
`include "decoder.v"
`include "comparator.v"
`include "ALU_1b.v"
`include "ALU_4b.v"

module tb_ALU_4b;
    reg [3:0]A,B;
    reg M1, M0, Cin;
    wire [3:0]F;
    wire Cout;

    ALU_4b DUT(M1,M0,A,B,Cin,F,Cout);

    initial 
        begin
            $dumpfile("tb_ALU_4b.vcd");
            $dumpvars(0,tb_ALU_4b);

            $monitor($time," M1 = %b, M0 = %b, A = %b, B = %b, Cin = %b, F = %b, Cout = %b",M1,M0,A,B,Cin,F,Cout);

            #5 M1 =1; M0 = 1; A =4'd0; B = 4'd0; Cin=0;
            #10 A=4'd10; B = 4'd5; Cin = 0;
            #10 A=4'd3 ; B =4'd3 ; Cin = 1;
            #10 A=4'd7; B=4'd8; Cin = 1;

            #5 $finish;
        end

endmodule