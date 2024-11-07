`timescale 1ns/1ns

 module AluCtrl(
    input [5:0] funct,
    input [2:0] En_UC,
    output reg[2:0] to_Alu
 );

always@(*)
begin
    case(En_UC)
        3'b000:
        begin
            case(funct)
                6'b100100:
                begin
                to_Alu = 3'b000;//AND
                end
                6'b100101:
                begin
                to_Alu = 3'b001;//OR
                end
                6'b100000:
                begin
                to_Alu = 3'b010;//ADD
                end
                6'b100010:
                begin
                to_Alu = 3'b110;//SUB
                end
                6'b101010:
                begin
                to_Alu = 3'b111;//SLT
                end
                6'b100110:
                begin
                to_Alu = 3'b011;//XOR
                end
                6'b100111:
                begin
                to_Alu = 3'b100;//NOR
                end
            endcase
        end
        3'b001:
        begin
            
        end
    endcase
end

endmodule

