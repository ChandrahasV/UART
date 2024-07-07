`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: Receivertest
// Project Name: UART Receiver

//////////////////////////////////////////////////////////////////////////////////


module Receivertest(
    );
    
reg clk_rx;
reg rst;
reg [1:0] baud_sel;
reg serial_data_tx;
reg [4:0] line_control_reg;
wire [7:0] data_received;
wire data_corrupted_flag;
wire active_flag_rx;
wire transmission_done_flag;

Receiver unit1(clk_rx,rst,baud_sel,serial_data_tx,line_control_reg,data_received,data_corrupted_flag,active_flag_rx,transmission_done_flag );

//Generating 18.432 MHz clock
always begin
   #27.12968 clk_rx = ~clk_rx;
end

//testing for the most commonly used baudrate 9600
initial begin

   clk_rx=0;
   rst=0;
   baud_sel = 2'b10;
   line_control_reg = 5'b00000;
   rst = 1'b0;
   serial_data_tx =1'b1;
    #6510.416; //6510.416 since serial data comes synchronously with the baud_clk
    rst =1'b1;
    serial_data_tx = 1'b0; // start bit
    repeat(9)
    begin
    #6510.416;
    serial_data_tx = 1'b1; //sending 01111111111 data frame
    end
    #6510.416;
    serial_data_tx = 1'b1;
    //sending 01111111101    
    #19531.248;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    //sending 00110011001
    #19531.248;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    //
    #19531.248;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #12000;
    $finish;
   
   

end
endmodule
