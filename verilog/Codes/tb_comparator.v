`include "comparator.v"

module tb_comparator;
    reg A,B,C0,C1;
    wire Z0, Z1;

    comparator DUT(A,B,C0,C1,Z0,Z1);

    initial 
        begin
            $dumpfile("tb_comparator.vcd");
            $dumpvars(0,tb_comparator);

            $monitor($time,"A = %b, B=%b, C1 = %b, C0 = %b, Z1 = %b, Z0=%b",A,B,C1,C0,Z1,Z0);

            #5 A = 1; B = 0; C1 = 0; C0 = 0;
            #5 A = 1; B = 1; C1 = 0; C0 = 1;
            #5 A = 0; B = 1; C1 = 1; C0 = 0; 

            #5 $finish;

        end
endmodule