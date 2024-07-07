`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: controlunittest
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////


module controlunittest(
    );
    reg baud_clk;
    reg rst;
    reg [4:0] line_control_reg;
    reg [7:0] data_input;
    wire [10:0] data_frame;
    wire piso_start;
    
controlunit unit1 (baud_clk,rst,line_control_reg,data_input,data_frame,piso_start);

always begin
//  Testing the most common BaudRate 9600 
   #3255.208 baud_clk = ~baud_clk;
end

initial begin
   baud_clk =1'b0;
   rst=1'b0;
   line_control_reg = 5'b0;
   data_input= 8'b0;
   #200000;
   rst = 1'b1;
   #200000;
   line_control_reg = 5'b10000;
   data_input = 8'b1;
   #200000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101010;
   #200000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101110;
   #200000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101110;
   #2000000;
   line_control_reg = 5'b00011;
   data_input = 8'b11111111;
   #2000000;
   $finish;
   
   
   

end
    
endmodule
