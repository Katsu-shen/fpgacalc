// 6-function 4-bit ALU for calculator
// Functions: ADD, SUB, AND, OR, XOR, NOT
module alu4bit (
    input  [3:0] a,      
    input  [3:0] b,      
    input  [2:0] op,  
    output reg [3:0] result // 4-bit result for HEX display
);

    // Combinational logic
    always @(*) begin
        case(op)
            3'b000: result = a + b; // ADD
            3'b001: result = a - b; // SUB
            3'b010: result = a & b; // AND
            3'b011: result = a | b; // OR
            3'b100: result = a ^ b; // XOR
            3'b101: result = ~a;    // NOT (ignore B)
            default: result = 4'b0000;
        endcase
    end

endmodule
