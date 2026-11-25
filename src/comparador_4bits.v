module comparador_4bits(
    input wire [3:0] A,
    input wire [3:0] B,
    output wire GT,
    output wire EQ,
    output wire LT
);

    wire GT_H, EQ_H, LT_H;
    wire GT_L, EQ_L, LT_L;

    // Comparacion de los dos bits mas significativos
    comparador_2bits COMP_HIGH(
        .A(A[3:2]),
        .B(B[3:2]),
        .GT(GT_H),
        .EQ(EQ_H),
        .LT(LT_H)
    );

    // Comparacion de los dos bits menos significativos
    comparador_2bits COMP_LOW(
        .A(A[1:0]),
        .B(B[1:0]),
        .GT(GT_L),
        .EQ(EQ_L),
        .LT(LT_L)
    );

    // Resultado final
    assign GT = GT_H | (EQ_H & GT_L);
    assign EQ = EQ_H & EQ_L;
    assign LT = LT_H | (EQ_H & LT_L);

endmodule