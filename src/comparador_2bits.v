module comparador_2bits(
    input wire [1:0] A,
    input wire [1:0] B,
    output wire GT,
    output wire EQ,
    output wire LT
);

    wire X1, X0;

    // Comparacion de igualdad entre bits
    assign X1 = ~(A[1] ^ B[1]);
    assign X0 = ~(A[0] ^ B[0]);

    // A es igual a B
    assign EQ = X1 & X0;

    // A es mayor que B
    assign GT = (A[1] & ~B[1]) |
                (X1 & A[0] & ~B[0]);

    // A es menor que B
    assign LT = (~A[1] & B[1]) |
                (X1 & ~A[0] & B[0]);

endmodule