module testbench_cla;

reg c0, a0, b0, a1, b1, a2, b2, a3, b3;
wire s0, s1, s2, s3, c4;

carryadder test(s0, s1, s2, s3, c4, c0, a0, b0, a1, b1, a2, b2, a3, b3);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench_cla);
    $monitor($time, " c0 = %b, a0 = %b, b0 = %b, a1 = %b, b1 = %b, a2 = %b, b2 = %b, a3 = %b, b3 = %b",
    c0, a0, b0, a1, b1, a2, b2, a3, b3);

    c0 = 1'b0;
    a0 = 1'b0;
    b0 = 1'b0;
    a1 = 1'b0;
    b1 = 1'b0;
    a2 = 1'b0;
    b2 = 1'b0;
    a3 = 1'b0;
    b3 = 1'b0;

    #2560 $finish;

end

always #5 a0 = ~a0;
always #10 b0 = ~b0;
always #20 a1 = ~a1;
always #40 b1 = ~b1;
always #80 a2 = ~a2;
always #160 b2 = ~b2;
always #320 a3 = ~a3;
always #640 b3 = ~b3;
always #1280 c0 = ~c0;

endmodule