module dot_product_par #(parameter N = 8) (    input wire [N-1:0] a [0:3],
    input wire [N-1:0] b [0:3],
    output reg [4*N-1:0] result,
    input wire clk,
    output reg pulse_par,
    output reg [3:0] cycle_count_par
);

    reg [2*N-1:0] mult [0:3];
    reg [2*N-1:0] sum;
    reg [3:0] done_flags;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : mult_loop
            always @(posedge clk) begin
                mult[i] <= a[i] * b[i];
                done_flags[i] <= 1;
            end
        end
    endgenerate

    always @(posedge clk) begin
        if (done_flags == 4'b1111) begin
            sum <= mult[0] + mult[1] + mult[2] + mult[3];
            result <= sum;
            pulse_par <= 0;
        end else begin
            pulse_par <= 1;
            cycle_count_par <= cycle_count_par + 1;
        end
    end

    initial begin
        sum = 0;
        done_flags = 0;
        cycle_count_par = 0;
    end
endmodule