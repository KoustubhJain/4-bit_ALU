# Verilog
Code for a 4-bit ALU I am trying to make in verilog,

As of now, I am working on the 1-bit ALU. And I plan to connect four 1-bit ALUs in order to get my 4-bit ALU.

half_adder.v and full_adder.v are the for the half and full adders respectively. The full_adder is a carry look ahead type adder i.e. made up of 2 half_adder.v
I am trying to use the full_adder itself for the subtraction i.e. by taking inverse of second input when in subtract mode.

### Files and what they do
decoder_2to4.v is a 2 to 4 decoder which is being used to switch the mode of operation of the ALU.

comparator_1_bit.v is a 1-bit-magnitude comparator, it compares the two bits and gives output >,< or =.

ALU_1_bit.v is the ALU itself, where I have connected/tried to connect all these modules so they work together as the intended 1-bit ALU.

testbenches associated with each of these files have the same name with the prefix tb_ and same extension .v

### 1-bit ALU
ALU should be able to perform addition/subtraction/comparison/AND-ing of two 1-bit inputs (A and B).

ALU has 2 select lines: M1 and M0 which control its mode of operation.

The 4 outputs of the decoder control to which block(adder/subtract/comparator/and) the bits go to. I am trying to do so, by AND-ing the bits with the output of the comparator for each mode and sending that as inputs to the respective block.

Also, since my ALU has only 3 outputs F, Cout and N(a negative flag which is yet to be wired to adder, it is being used only by the comparator), I am first ANDing the outputs of a block with the decoder output corresponding to that block, and then OR-ing all these terms for the 4 different operations to get my final output, i.e. F = F0&(t0|t1) | F1&t2 | F2&t3 where t0,t1 are the decoder outputs enabling the add/subtract, t2 is the decoder output enabling comparator, t3 is enbaling the AND-ing and F0,F1,F2 are the outputs of those blocks respectively.

#### Issues with 1-bit ALU
As of now, the ALU can do all operations except subtraction.

I have tested all the modules individually and they work fine, it seems I am making some error while connecting them to make my ALU. Any help would be appreciated.
