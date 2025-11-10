module D_FlipFlop (
    input D,
    input CLK,
    input RST_n,
    output reg Q,
    output Q_n
);
    assign Q_n = ~Q;
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule
