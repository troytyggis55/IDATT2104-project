module elementwise_mult_seq #(parameter N = 8) (
    input wire [N-1:0] a [0:3],
    input wire [N-1:0] b [0:3],
    output reg [2*N-1:0] result [0:3],

    input wire clk,
    output reg pulse_seq,
    output reg [3:0] cycle_count_seq
);

    integer i = 0;
    reg [3:0] done_flags = 0;

    always @(posedge clk) begin
        if (done_flags != 4'b1111) begin
            pulse_seq <= 1;
            result[i] <= a[i] * b[i];
            done_flags[i] <= 1;
            i <= i + 1;
            cycle_count_seq <= cycle_count_seq + 1;


        end else begin
            pulse_seq <= 0;
        end
    end

    initial begin
        cycle_count_seq = 0;
    end
endmodule
