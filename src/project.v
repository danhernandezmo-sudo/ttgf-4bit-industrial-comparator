`default_nettype none

module tt_um_industrial_comparator (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

    wire GT, EQ, LT;

    // Instancia del comparador de 4 bits
    comparador_4bits DUT (
        .A(ui_in[3:0]),
        .B(ui_in[7:4]),
        .GT(GT),
        .EQ(EQ),
        .LT(LT)
    );

    // Salidas del comparador
    assign uo_out[0] = GT;
    assign uo_out[1] = EQ;
    assign uo_out[2] = LT;

    // Salidas no utilizadas
    assign uo_out[7:3] = 5'b00000;
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    // Entradas no utilizadas
    wire unused = &{ena, clk, rst_n, uio_in, 1'b0};

endmodule
