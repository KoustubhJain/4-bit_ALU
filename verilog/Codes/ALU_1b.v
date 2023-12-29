module ALU_1b(M1,M0,A,B,Cin,C1,C0,F,Cout);
// M1, M0 select mode of operation
// 00 --> Add
// 01 --> Subtract
// 10 --> Comparator
// 11 --> AND
// A,B,Cin are self explanatory 1 bit inputs;
// F is the output of the operation
// Cout is the output carry
// When in comparator mode F&Cout represent the output as a 2 bit value
//                          00 --> A == B
//                          01 --> A < B
//                          10 --> A > B
//                          11 ---> x x
// C1 C0 convey information about previous carry, encoded in manner described above

input A,B,Cin,M1,M0,C1,C0;
output F,Cout;

wire fn0,fn1,fn2,fn3;
// fn0-3 correspond to add, subtract, compare and AND functions respectively

decoder dcdr(M0,M1,fn0,fn1,fn2,fn3);

wire [2:0]en_add, en_sub;
wire [3:0]en_comp; 
wire [1:0]en_and;

wire f0,f1,f2,f3;
wire c0,c1,c2;

and add0(en_add[0],A,fn0),
    add1(en_add[1],B,fn0),
    add2(en_add[2],Cin,fn0);

full_adder add(en_add[0],en_add[1],en_add[2],f0,c0);

and sub0(en_sub[0],~A,fn1),
    sub1(en_sub[1],B,fn1),
    sub2(en_sub[2],Cin,fn1);

full_adder sub(en_sub[0],en_sub[1],en_sub[2],f1,c1);

and comp0(en_comp[0],A,fn2),
    comp1(en_comp[1],B,fn2),
    comp2(en_comp[2],C0,fn2),
    comp3(en_comp[3],C1,fn2);

comparator comp(en_comp[0],en_comp[1],en_comp[2],en_comp[3],c2,f2);

and and0(en_and[0],A,fn3),
    and1(en_and[1],B,fn3);

and (f3,en_and[0],en_and[1]);

or (F,f0&fn0,~f1&fn1,f2&fn2,f3&fn3);
or (Cout,c0&fn0,c1&fn1,c2&fn2);

endmodule