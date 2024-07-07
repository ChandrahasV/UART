`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: transmittertest
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////

//Test bench for the transmitter top module

module transmittertest();

reg clk;
reg rst;
reg [1:0] baud_sel;
reg [4:0] line_control_reg;
reg [7:0] data_input;
wire serial_data_tx; 
wire active_flag; 
wire done_flag;

//Generating 18.432 MHz clock
always begin
   #27.12968 clk = ~clk;
end

transmitter instance1 ( clk,
                        rst,
                        baud_sel,
                        line_control_reg,
                        data_input,
                        serial_data_tx,
                        active_flag,
                        done_flag
                      );
                 
initial begin

   clk = 1'b0;
   rst = 1'b0;
 baud_sel = 2'b00;
   line_control_reg = 5'b0;
   data_input= 8'b0;
   #800000;
   rst = 1'b1;
   #800000;
   line_control_reg = 5'b10000;
   data_input = 8'b1;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b11111111;
   #8000000;
 baud_sel = 2'b01;
   line_control_reg = 5'b0;
   data_input= 8'b0;
   #800000;
   rst = 1'b1;
   #800000;
   line_control_reg = 5'b10000;
   data_input = 8'b1;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b11111111;
   #8000000;
 baud_sel = 2'b10;
   line_control_reg = 5'b0;
   data_input= 8'b0;
   #800000;
   rst = 1'b1;
   #800000;
   line_control_reg = 5'b10000;
   data_input = 8'b1;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b11111111;
   #8000000;
 baud_sel = 2'b11;
   line_control_reg = 5'b0;
   data_input= 8'b0;
   #800000;
   rst = 1'b1;
   #800000;
   line_control_reg = 5'b10000;
   data_input = 8'b1;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101010;
   #800000;
   line_control_reg = 5'b00000;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00001;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b000010;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01100;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01101;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01110;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b01111;
   data_input = 8'b10101110;
   #800000;
   line_control_reg = 5'b00011;
   data_input = 8'b11111111;
   #800000;
   $finish;
end

endmodule

