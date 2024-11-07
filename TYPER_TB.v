`timescale 1ns/1ns
module ISA_tb;
    reg [31:0] instruccion;
    wire [31:0] salida;

    // Instanciar la ISA
    ISA uut (
        .instruccion(instruccion),
        .salida(salida)
    );

    initial begin
        // Inicializar datos
        // Escribir datos en el Banco de Registros
        #100  instruccion = 32'b000000_00001_00010_00111_00000_100000; // Ejemplo de instrucción 1
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01000_00000_100100; // Ejemplo de instrucción 2
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01001_00000_100101; // Ejemplo de instrucción 3
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01010_00000_100010; // Ejemplo de instrucción 4
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01011_00000_101010; // Ejemplo de instrucción 5
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01100_00000_100110; // Ejemplo de instrucción 5
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 32'b000000_00001_00010_01101_00000_100111; // Ejemplo de instrucción 5
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100 $stop; // Detener la simulación
    end

    // Monitor para observar las instrucciones y salidas
    initial begin
        $monitor("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);
    end
endmodule
