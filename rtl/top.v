//top.v

module top (
    input [9:0] SW, //swtiches on fpga board
    output [6:0] HEX0, //show result
    output [6:0] HEX1, //show input a
    output [6:0] HEX2 //show input b
);

    wire [3:0] a = SW[3:0];
    wire [3:0] b = SW[7:4];
    wire [2:0] op = SW[9:8];

    wire [3:0] result;
    
    //alu instance
    alu4bit myalu(
        .a(a),
        .b(b),
        .op(op),
        .result(result),
    );

    //show alu result
    hex7seg disp_result (.hex(result), .seg(HEX0));

    //show input A
    hex7seg disp_a (.hex(a), .seg(HEX1));

    //show input b
    hex7seg disp_b (.hex(b), .seg(HEX2));

endmodule