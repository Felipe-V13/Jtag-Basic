module prueba_sumador(
    input wire clk,         // Entrada de reloj
    output wire [4:0] suma  // Salida de la suma
);
    reg [3:0] a, b;
    reg [1:0] estado;

    // Instancia del sumador
    sumador sumador_inst(
        .a(a),
        .b(b),
        .suma(suma)
    );

    // Lógica para cambiar los valores de a y b
    always @(posedge clk) begin
        case(estado)
            2'b00: begin a <= 4'b0101; b <= 4'b0011; end // 5 + 3
            2'b01: begin a <= 4'b1001; b <= 4'b0110; end // 9 + 6
            2'b10: begin a <= 4'b1111; b <= 4'b0001; end // 15 + 1
            2'b11: begin a <= 4'b0000; b <= 4'b0000; end // 0 + 0
        endcase
        estado <= estado + 2'b1;
    end
endmodule