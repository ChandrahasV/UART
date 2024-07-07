`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
// Module Name: UARTFullDuplexConfig
// Project Name: UART Full Duplex

//////////////////////////////////////////////////////////////////////////////////

//Module for instiating two UARTs. They both will be transmitting and receiving the data simultaneously


module UARTFullDuplexConfig(
input wire clk1,
input wire clk2,
input wire rst1,
input wire rst2,
input wire [1:0] baud_sel1,
input wire [1:0] baud_sel2,
input wire [4:0] line_control_reg1,
input wire [4:0] line_control_reg2,
input wire [7:0] data_input1,
input wire [7:0] data_input2,
output wire [7:0] data_received1,
output wire [7:0] data_received2,
output wire data_corrupted_flag1,
output wire data_corrupted_flag2,
output wire active_flag_rx1,
output wire active_flag_rx2,
output wire transmission_done_flag1,
output wire transmission_done_flag2,
output wire active_flag_tx1,
output wire active_flag_tx2,
output wire done_flag_tx1,
output wire done_flag_tx2
    );

wire serial_data_tx1;
wire serial_data_tx2;


//Each UART processor has a transmitter and a receiver module
//transmitter of UART 1 will send the data to receiver of UART 2 
//transmitter of UART 1 and the receiver of the UART 2 must agree on the baud_rate(baud_sel1) and the line control register (line_control_register1)
//Simultaneously transmitter of UART2 will send the data to receiver of UART 2 in the full duplex configuaration
//Similarly transmitter of UART 2 and the receiver of the UART 1 must agree on the baud_rate(baud_sel2) and the line control register (line_control_register2)

transmitter uart1t (clk1,rst1,baud_sel1,line_control_reg1,data_input1,serial_data_tx1, active_flag_tx1, done_flag_tx1);

transmitter uart2t (clk2,rst2,baud_sel2,line_control_reg2,data_input2,serial_data_tx2, active_flag_tx2, done_flag_tx2);

Receiver uart1r (clk1,rst1,baud_sel2,serial_data_tx2,line_control_reg2,data_received2,data_corrupted_flag2,active_flag_rx2,transmission_done_flag2);

Receiver uart2r(clk2,rst2,baud_sel1,serial_data_tx1,line_control_reg1,data_received1,data_corrupted_flag1,active_flag_rx1,transmission_done_flag1);

endmodule
