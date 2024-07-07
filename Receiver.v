`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
// Module Name: Receiver
// Project Name: UART receiver

//////////////////////////////////////////////////////////////////////////////////

//Top module for the UART receiver

module Receiver(
input wire clk_rx,
input wire rst,
input wire [1:0] baud_sel,
input wire serial_data_tx,
input wire [4:0] line_control_reg,
output wire [7:0] data_received,
output wire data_corrupted_flag,
output wire active_flag_rx,
output wire transmission_done_flag 
    );

wire baud_clk_rx;
wire [10:0] parallel_data_rx;
wire received_flag;

//Baud clock generator instantiation
baudrategenerator_rx unit1(clk_rx,baud_sel,rst,baud_clk_rx);

//SIPO unit instantiation
SIPO unit2(baud_clk_rx,rst,serial_data_tx,parallel_data_rx,active_flag_rx,received_flag);

//control unit instantiation
controlunit_rx unit3(rst,received_flag,parallel_data_rx,line_control_reg,data_received,data_corrupted_flag,transmission_done_flag);
   
    
endmodule
