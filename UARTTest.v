`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
// Module Name: UARTTest
// Project Name: UART

//////////////////////////////////////////////////////////////////////////////////


module UARTTest();

reg clk;
reg clk_rx;
reg rst;
reg [1:0] baud_sel;
reg [4:0] line_control_reg;
reg [7:0] data_input;
wire [7:0] data_received;
wire data_corrupted_flag;
wire active_flag_rx;
wire transmission_done_flag;
wire active_flag_tx;
wire done_flag_tx;

UART instance1 (clk,clk_rx,rst,baud_sel,line_control_reg,data_input,data_received,data_corrupted_flag,active_flag_rx,transmission_done_flag,active_flag_tx,done_flag_tx);

//Generating 18.432 MHz clock
always begin
   #27.12968 clk = ~clk;
end

//Generating 18.432 MHz clock
always begin
   #27.12968 clk_rx = ~clk_rx;
end

initial begin
clk = 1'b0;
clk_rx =1'b0;
rst = 1'b0;
baud_sel = 2'b00;
line_control_reg = 5'b0;
data_input = 8'b0;
#3000000;
rst = 1'b1;
line_control_reg = 5'b00000;
data_input = 8'b1111111;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b10101010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b01101101;
#3000000;
line_control_reg = 5'b00001;
data_input = 8'b01010101;
#3000000;
line_control_reg = 5'b00010;
data_input = 8'b11100010;
#3000000;
line_control_reg = 5'b00011;
data_input = 8'b11100010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b00011101;
#3000000;
baud_sel = 2'b01;
line_control_reg = 5'b0;
data_input = 8'b0;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b1111111;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b10101010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b01101101;
#3000000;
line_control_reg = 5'b00001;
data_input = 8'b01010101;
#3000000;
line_control_reg = 5'b00010;
data_input = 8'b11100010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b00011101;
#3000000;
baud_sel = 2'b10;
line_control_reg = 5'b0;
data_input = 8'b0;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b1111111;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b10101010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b01101101;
#3000000;
line_control_reg = 5'b00001;
data_input = 8'b01010101;
#3000000;
line_control_reg = 5'b00010;
data_input = 8'b11100010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b00011101;
#3000000;
baud_sel = 2'b11;
line_control_reg = 5'b0;
data_input = 8'b0;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b1111111;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b10101010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b01101101;
#3000000;
line_control_reg = 5'b00001;
data_input = 8'b01010101;
#3000000;
line_control_reg = 5'b00010;
data_input = 8'b11100010;
#3000000;
line_control_reg = 5'b00000;
data_input = 8'b00011101;
#3000000;
$finish;

end
endmodule
