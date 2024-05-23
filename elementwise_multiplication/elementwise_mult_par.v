module elementwise_mult_par #(parameter N = 8) (
    input wire [N-1:0] a [0:3],
    input wire [N-1:0] b [0:3],
    output reg [2*N-1:0] result [0:3],
    input wire clk,
    output reg pulse_par,
    output reg [3:0] cycle_count_par
);

    genvar i;
    reg [3:0] done_flags = 0;

    generate
        for (i = 0; i < 4; i = i + 1) begin : multiply_elements
            always @(posedge clk) begin
                result[i] <= a[i] * b[i];
                done_flags[i] <= 1;
            end
        end
    endgenerate

    always @(posedge clk) begin
        if (done_flags == 4'b1111) begin
            pulse_par <= 0;
        end else begin
            pulse_par <= 1;
            cycle_count_par <= cycle_count_par + 1;
        end
    end

    initial begin
        cycle_count_par = 0;
    end

endmodule
