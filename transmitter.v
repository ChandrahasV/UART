`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: transmitter
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////

//Top module for the all transmitter modules

module transmitter(
input wire clk,
input wire rst,
input wire [1:0] baud_sel,
input wire [4:0] line_control_reg,
input wire [7:0] data_input,
output wire serial_data_tx, 
output wire active_flag, 
output wire done_flag
    );
    
//Interconnections

wire [10:0] data_frame;
wire piso_start;
wire baud_clk;

//Baud Generator instantiation
baudrategenerator ins1(clk,baud_sel,rst,baud_clk);

//Control Unit instantiation
controlunit ins2(baud_clk,rst,line_control_reg,data_input,data_frame,piso_start);

//PISO shift register instantiation   
piso ins3(data_frame,baud_clk,rst,piso_start,serial_data_tx,active_flag,done_flag); 

endmodule
