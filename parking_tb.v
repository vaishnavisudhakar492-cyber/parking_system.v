`timescale 1ns/1ps

module test;

reg clk;
reg reset;
reg entry;
reg exit;
reg [2:0] slot_no;

wire [7:0] slots;

parking_system uut(
    .clk(clk),
    .reset(reset),
    .entry(entry),
    .exit(exit),
    .slot_no(slot_no),
    .slots(slots)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
end

initial begin
    clk = 0;
    reset = 1;
    entry = 0;
    exit = 0;
    slot_no = 0;

    #10 reset = 0;

    #10 entry = 1; slot_no = 0;
    #10 entry = 0;

    #20 entry = 1; slot_no = 3;
    #10 entry = 0;

    #20 exit = 1; slot_no = 0;
    #10 exit = 0;

    #20 $finish;
end

endmodule