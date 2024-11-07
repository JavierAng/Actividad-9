`timescale 1ns/1ns

module ISA(
	input [31:0]instruccion,
	output [31:0]salida
);
//BR
wire [31:0] d1BR_Op1Alu;
wire [31:0] d2BR_Op2Alu;
//mux
wire [31:0] Dato_Mem_to_BR;
//alu
wire [31:0] Resultado_Alu;
//Unidad de control
wire BR_Enabler;
wire [2:0]AluControl;
wire MemW;
wire MemR;
wire Mem_to_BR;

//cables para memoria
wire [31:0] MemD;

wire [2:0]AluCtrl2Alu;

U_control UC(
	.Opcode(instruccion[31:26]),
	.BR_En(BR_Enabler),
	.AluC(AluControl),//alu control
	.EnR(MemW),
	.EnW(MemR),
	.Mux1(Mem_to_BR)
);

Banco instBanco(
	.DL1(instruccion [25:21]),
	.DL2(instruccion [20:16]),
	.DE(instruccion [15:11]),
	.Dato(Dato_Mem_to_BR),
	.WE(BR_Enabler),
	.op1(d1BR_Op1Alu),
	.op2(d2BR_Op2Alu)
	);
	
ALU instAlu(
	.Ope1(d1BR_Op1Alu),
	.Ope2(d2BR_Op2Alu),
	.AluOp(AluCtrl2Alu),// de alu control
	.Resultado(Resultado_Alu)
);

Mux2_1 mux1(
	.sel(Mem_to_BR),
	.A(Resultado_Alu),
	.B(Resultado_Alu),
	.C(Dato_Mem_to_BR)
);

AluCtrl aluCTRL(
	.funct(instruccion[5:0]),
	.En_UC(AluControl),
	.to_Alu(AluCtrl2Alu)
);



endmodule


