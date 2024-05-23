module elementwise_mult_par_testbench();
    parameter N = 8;

    reg [N-1:0] a [0:3];
    reg [N-1:0] b [0:3];

    wire [2*N-1:0] result_mult_seq [0:3];
    wire [2*N-1:0] result_mult_par [0:3];

    reg clk;
    wire pulse_seq;
    wire pulse_par;
    wire [3:0] cycle_count_seq;
    wire [3:0] cycle_count_par;

    elementwise_mult_seq #(N) seqmult (
        .a(a),
        .b(b),
        .result(result_mult_seq),
        .clk(clk),
        .pulse_seq(pulse_seq),
        .cycle_count_seq(cycle_count_seq)
    );

    elementwise_mult_par #(N) parmult (
        .a(a),
        .b(b),
        .result(result_mult_par),
        .clk(clk),
        .pulse_par(pulse_par),
        .cycle_count_par(cycle_count_par)
    );

    always begin
        #1 clk = ~clk;
    end

    initial begin
        clk = 0;

        a[0] = 1;
        a[1] = 2;
        a[2] = 3;
        a[3] = 4;

        b[0] = 2;
        b[1] = 4;
        b[2] = 6;
        b[3] = 8;

        $dumpfile("elementwise_mult_par_testbench.vcd");
        $dumpvars(0, elementwise_mult_par_testbench);

        #10;

        $display("Sequential: Elementwise Multiplication Result: %d %d %d %d", result_mult_seq[0], result_mult_seq[1], result_mult_seq[2], result_mult_seq[3]);
        $display("Sequential: Cycle Count: %d", cycle_count_seq);
        $display("Parallell: Elementwise Multiplication Result: %d %d %d %d", result_mult_par[0], result_mult_par[1], result_mult_par[2], result_mult_par[3]);
        $display("Parallell: Cycle Count: %d", cycle_count_par);

        $finish;
    end
endmodule
