module float8(
    input [7:0] f8,
    output reg sign,
    output reg [3:0] exponent,
    output reg [2:0] mantissa
);

    always @(*) begin
        sign = f8[7];
        exponent = f8[6:3];
        mantissa = f8[2:0];
    end
endmodule
