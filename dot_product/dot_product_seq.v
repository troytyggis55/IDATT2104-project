module dot_product_seq #(parameter N = 8) (
    input wire [N-1:0] a [0:3],
    input wire [N-1:0] b [0:3],
    output reg [4*N-1:0] result,
    input wire clk,
    output reg pulse_seq,
    output reg [3:0] cycle_count_seq
);

    reg [2*N-1:0] sum;
    reg [1:0] i;
    reg [3:0] done_flags;

    always @(posedge clk) begin
        if (done_flags != 4'b1111) begin
            pulse_seq <= 1;
            if (!done_flags[i]) begin
                sum <= sum + (a[i] * b[i]);
                done_flags[i] <= 1;
                i <= i + 1;
            end
            cycle_count_seq <= cycle_count_seq + 1;
        end else begin
            pulse_seq <= 0;
            result <= sum;
        end
    end

    initial begin
        sum = 0;
        i = 0;
        cycle_count_seq = 0;
        done_flags = 0;
    end
endmodule
