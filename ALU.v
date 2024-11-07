`timescale 1ns/1ns
module ALU (
    input [31:0] Ope1,
    input [31:0] Ope2,
    input [2:0] AluOp,
    output reg [31:0] Resultado
);
    always @* 
	begin
        case(AluOp)
            3'b000: 
			begin
			Resultado = Ope1 & Ope2; // AND
			end			
            3'b001:
			begin
			Resultado = Ope1 | Ope2; // OR
            end
			3'b010:
			begin
			Resultado = Ope1 + Ope2; // ADD
            end
			3'b011:
			begin
			Resultado = Ope1 ^ Ope2; // XOR
            end
			3'b100:
			begin
			Resultado = ~(Ope1 | Ope2); // NOR
            end
			3'b110:
			begin
			Resultado = Ope1 - Ope2; // SUBTRACT
            end
			3'b111:
			begin
			Resultado = (Ope1 < Ope2) ? 1:0;  // SLT
			end
        endcase
    end
endmodule
