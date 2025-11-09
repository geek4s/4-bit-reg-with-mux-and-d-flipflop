`include "mux4x1.v.txt"
`include "d_flipflop.v.txt"

// 4-bit Register with selectable operations using 4x1 MUX and D Flip-Flops
module register4bit (
    input clk,
    input reset,
    input [1:0] s,
    input shift_in_R,
    input shift_in_L,
    output [3:0] q
);
    wire [3:0] mux_out;
    wire [3:0] q_internal;

    // For each bit, choose input based on s
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : reg_logic
            wire I0, I1, I2, I3;

            // Select inputs for each operation
            assign I0 = q_internal[i]; // Hold (no change)
            assign I1 = ~q_internal[i]; // Complement
            assign I2 = (i == 3) ? shift_in_R : q_internal[i+1]; // Shift Right
            assign I3 = (i == 0) ? shift_in_L : q_internal[i-1]; // Shift Left

            // 4x1 MUX to select behavior
            mux4x1 mux_inst (
                .I0(I0),
                .I1(I1),
                .I2(I2),
                .I3(I3),
                .S(s),
                .Y(mux_out[i])
            );

            // D Flip-Flop for each bit
            D_FlipFlop dff_inst (
                .D(mux_out[i]),
                .CLK(clk),
                .RST_n(~reset),
                .Q(q_internal[i]),
                .Q_n()
            );
        end
    endgenerate

    assign q = q_internal;
endmodule
