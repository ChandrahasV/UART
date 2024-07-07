`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: UART
// Project Name: UART

//////////////////////////////////////////////////////////////////////////////////

//top module for UART

module UART(
input wire clk,
input wire clk_rx,
input wire rst,
input wire [1:0] baud_sel,
input wire [4:0] line_control_reg,
input wire [7:0] data_input,
output wire [7:0] data_received,
output wire data_corrupted_flag,
output wire active_flag_rx,
output wire transmission_done_flag,
output wire active_flag_tx,
output wire done_flag_tx
    );
    
wire serial_data_tx;

transmitter instance1(clk,rst,baud_sel,line_control_reg,data_input,serial_data_tx, active_flag_tx, done_flag_tx);

Receiver instance2(clk_rx,rst,baud_sel,serial_data_tx,line_control_reg,data_received,data_corrupted_flag,active_flag_rx,transmission_done_flag );

endmodule
