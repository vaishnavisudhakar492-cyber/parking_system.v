// Code your testbench here
// or browse Examples
module parking_system(
    input clk,
    input reset,
    input entry,
    input exit,
    input [2:0] slot_no,
    output reg [7:0] slots
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        slots <= 8'b00000000;

    else begin

        if(entry)
            slots[slot_no] <= 1'b1;

        if(exit)
            slots[slot_no] <= 1'b0;

    end
end

endmodule