module float_testbench();
    parameter a_val = 8'b01000100;
    parameter b_val = 8'b00011010;

    reg [7:0] a;
    reg [7:0] b;

    wire [7:0] result;

    assign a = a_val;
    assign b = b_val;

    real sign_a;
    real exp_a;
    real mant_a;

    real sign_b;
    real exp_b;
    real mant_b;

    real sign_result;
    real exp_result;
    real mant_result;

    real float_sign;
    real float_exp;
    real float_mant;

    real float_value_a;
    real float_value_b;
    real float_value_result;

    float8 f8_a (.f8(a), .sign(sign_a), .exponent(exp_a), .mantissa(mant_a));
    float8 f8_b (.f8(b), .sign(sign_b), .exponent(exp_b), .mantissa(mant_b));

    float8_mult f8_mult (.a(a), .b(b), .result(result));

    initial begin
        #10;

        float_sign = sign_a ? -1.0 : 1.0;

        if (exp_a == 0) begin
            // Subnormal numbers
            float_mant = mant_a / 8.0;
            float_exp = 2.0 ** -6;
        end else begin
            // Normalized numbers
            float_mant = 1.0 + (mant_a / 8.0);
            float_exp = 2.0 ** (exp_a - 7);
        end

        float_value_a = float_sign * float_exp * float_mant;

        float_sign = sign_b ? -1.0 : 1.0;

        if (exp_b == 0) begin
            // Subnormal numbers
            float_mant = mant_b / 8.0;
            float_exp = 2.0 ** -6;
        end else begin
            // Normalized numbers
            float_mant = 1.0 + (mant_b / 8.0);
            float_exp = 2.0 ** (exp_b - 7);
        end

        float_value_b = float_sign * float_exp * float_mant;

        sign_result = result[7];
        exp_result = result[6:3];
        mant_result = result[2:0];

        float_sign = sign_result ? -1.0 : 1.0;

        if (exp_result == 0) begin
            // Subnormal numbers
            float_mant = mant_result / 8.0;
            float_exp = 2.0 ** -6;
        end else begin
            // Normalized numbers
            float_mant = 1.0 + (mant_result / 8.0);
            float_exp = 2.0 ** (exp_result - 7);
        end

        float_value_result = float_sign * float_exp * float_mant;

        $display("Bin:\tSign:\t%b, Exponent:\t%b, Mantissa:\t%b", sign_a, exp_a, mant_a);
        $display("Dec:\tSign:\t%d, Exponent:\t%d, Mantissa:\t%d", sign_a, exp_a, mant_a);
        $display("Float a: %f", float_value_a);

        $display("Bin:\tSign:\t%b, Exponent:\t%b, Mantissa:\t%b", sign_b, exp_b, mant_b);
        $display("Dec:\tSign:\t%d, Exponent:\t%d, Mantissa:\t%d", sign_b, exp_b, mant_b);
        $display("Float b: %f", float_value_b);

        $display("Result: %f", float_value_result);

        $finish;
    end
endmodule