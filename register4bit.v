// 4-bit Register with 4x1 MUX control and D Flip-Flops
// Modes:
// 00 - No change
// 01 - Complement
// 10 - Shift Right
// 11 - Shift Left

module register4bit (
    input clk,          // clock input
    input reset,        // asynchronous reset
    input [1:0] s,      // select lines s1s0
    input [3:0] data_in, // initial data load
    output reg [3:0] q   // output of register
);

    reg [3:0] d; // next state inputs for D flip-flops

    always @(*) begin
        case (s)
            2'b00: d = q;              // No change
            2'b01: d = ~q;             // Complement
            2'b10: d = {q[0], q[3:1]}; // Shift right
            2'b11: d = {q[2:0], q[3]}; // Shift left
            default: d = q;
        endcase
    end

    // D Flip-Flop logic (on clock edge)
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= data_in; // Load initial data on reset
        else
            q <= d;       // Update based on mode
    end

endmodule
