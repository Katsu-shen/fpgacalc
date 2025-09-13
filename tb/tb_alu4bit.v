module tb_alu4bit;
    reg [3:0] a,b;
    reg [2:0] op;
    wire [3:0] result;

    alu4bit uut (.a(a), .b(b), .op(op), .result(result));

    initial begin
        // add 5 + 3 = 8
        a = 4'd5;
        b = 4'd3;
        op = 3'b000;
        #10; //delay 10 time units
        //sub 7-2 = 5
        a = 4'd7;
        b = 4'd2;
        op = 3'b001;
        #10;
        //and 12 & 6 = 4
        a = 4'd12;
        b = 4'd6;
        op = 3'b010;
        #10;
        //or 9|5 = 13
        a = 4'd9;
        b = 4'd5;
        op = 3'b011;
        #10;
        //xor 3 ^ 8 = 11
        a = 4'd3;
        b = 4'd8;
        op = 3'b100;
        #10;
        // not 2 = 13
        a = 4'd2;
        op = 3'b101;
        #10;

        $finish;
    end

    initial begin
        $dumpfile("cpu.vcd"); //waveform file
        $dumpvars(0, tb_alu4bit);
    end
endmodule


