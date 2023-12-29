`include "decoder.v"

module tb_decoder;

    reg S0, S1  ;
    wire R0,R1,R2,R3 ;

    decoder DUT(S0,S1,R0,R1,R2,R3);

    initial 
        begin
        $dumpfile("tb_decoder.vcd");
        $dumpvars(0,tb_decoder);

        $monitor($time," S0 = %b, S1 = %b, R0= %b, R1 = %b, R2 = %b, R3 = %b",S0,S1,R0,R1,R2,R3);

        #5 S0 = 0 ; S1 = 0 ;
        #5 S0 = 1 ; S1 = 0 ;
        #5 S0 = 0 ; S1 = 1 ;
        #5 S0 = 1 ; S1 = 1 ;
        #5 $finish;


        end

endmodule