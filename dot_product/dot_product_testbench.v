module dot_product_testbench();
    parameter N = 8;

    reg [N-1:0] a [0:3];
    reg [N-1:0] b [0:3];

    wire [4*N-1:0] result_dot_product_seq;
    wire [4*N-1:0] result_dot_product_par;

    reg clk;
    wire pulse_seq;
    wire pulse_par;
    wire [3:0] cycle_count_seq;
    wire [3:0] cycle_count_par;

    dot_product_seq #(N) seqdot (
        .a(a),
        .b(b),
        .result(result_dot_product_seq),
        .clk(clk),
        .pulse_seq(pulse_seq),
        .cycle_count_seq(cycle_count_seq)
    );

    dot_product_par #(N) pardot (
        .a(a),
        .b(b),
        .result(result_dot_product_par),
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

        $dumpfile("dot_product_testbench.vcd");
        $dumpvars(0, dot_product_testbench);

        #10;

        $display("Sequential: Dot Product Result: %d", result_dot_product_seq);
        $display("Sequential: Cycle Count: %d", cycle_count_seq);

        $display("Parallell: Dot Product Result: %d", result_dot_product_par);
        $display("Parallell: Cycle Count: %d", cycle_count_par);
        $finish;
    end
endmodule