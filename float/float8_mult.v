module float8_mult(
    input [7:0] a, // 8-bit float input A
    input [7:0] b, // 8-bit float input B
    output reg [7:0] result // 8-bit float result
);
    reg sign_a, sign_b, sign_r;
    reg [3:0] exp_a, exp_b, exp_r;
    reg [2:0] man_a, man_b;
    reg [5:0] mantissa_r; // To handle product of mantissas

    // Separate the components
    always @(*) begin
        sign_a = a[7];
        exp_a = a[6:3];
        man_a = a[2:0];

        sign_b = b[7];
        exp_b = b[6:3];
        man_b = b[2:0];

        sign_r = sign_a ^ sign_b;
        exp_r = exp_a + exp_b - 7;
        mantissa_r = ({1'b1, man_a} * {1'b1, man_b});

        if (mantissa_r[5]) begin
            exp_r = exp_r + 1;
            mantissa_r = mantissa_r >> 1;
        end

        result = {sign_r, exp_r, mantissa_r[4:2]};
    end
endmodule
