`include "half_adder.v"

module testbench;

    reg A,B;
    wire Sum, Cout;

    half_adder DUT(A,B,Sum,Cout);

    initial 
        begin
            $dumpfile("half_adder.vcd");
            $dumpvars(0, testbench);

            $monitor($time," A = %b, B = %b, Sum= %b, Cout = %b ",A,B,Sum,Cout);

            #5 A = 0; B = 0;
            #5 A = 0; B = 1;
            #5 A = 1; B = 0;
            #5 A = 1; B = 1;
            #5 $finish;
                
        end

endmodule