`include "half_adder.v"
`include "full_adder.v"

module tb_full_adder;
    reg A, B, Cin;
    wire S, Cout;

    full_adder DUT(A,B,Cin,S,Cout);

    initial 
        begin
            $dumpfile("tb_full_adder.vcd");
            $dumpvars(0,tb_full_adder);

            $monitor($time," A = %b, B= %b, Cin =%b, S = %b, Cout =%b ",A,B,Cin,S,Cout);

            #10 A = 1; B = 1; Cin = 0;
            #10 A = 0; B = 1; Cin = 1;
            #10 A = 0; B = 0; Cin = 0;
            #10 A = 0; B=0; Cin=1;
            #10 A=1;B=1;Cin=0;
            #10 A=1; B=1; Cin=1;
            #10 A=1; B=0; Cin=0;
            #10 A=1; B=0; Cin=1;
            #10 $finish;
 
        end
endmodule