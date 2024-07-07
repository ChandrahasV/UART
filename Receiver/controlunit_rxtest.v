`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
// Module Name: controlunit_rxtest
// Project Name: UART receiver

//////////////////////////////////////////////////////////////////////////////////

module controlunit_rxtest();
    
reg rst;
reg [10:0] parallel_data_rx;
reg [4:0] line_control_reg;
reg received_flag;
wire [7:0] data_received; 
wire data_corrupted_flag; 
wire transmission_done_flag; 
    
controlunit_rx unit1 (
    .rst(rst),
    .parallel_data_rx(parallel_data_rx),
    .line_control_reg(line_control_reg),
    .received_flag(received_flag),
    .data_received(data_received),
    .data_corrupted_flag(data_corrupted_flag),
    .transmission_done_flag(transmission_done_flag)
);

initial begin
rst = 1'b1;  
parallel_data_rx = 11'b0;
line_control_reg = 5'b00000;
received_flag = 1'b0;
#120000;
rst = 1'b0;  
#120000;
rst = 1'b1;  
#10; 
received_flag = 1'b1;
#120000;
#10; 
received_flag = 1'b0;
#10; 
parallel_data_rx = 11'b11111111111;
#120000;
#10; received_flag = 1'b1;
#120000;
#10; received_flag = 1'b0;
#10; parallel_data_rx = 11'b01111111111;
#120000;
#10; parallel_data_rx = 11'b01111111101;
#10; line_control_reg = 5'b00001;
#10; received_flag = 1'b1;
#120000;
#10; received_flag = 1'b0;
#10; parallel_data_rx = 11'b0;
#10; line_control_reg = 5'b00001;
#10; received_flag = 1'b0;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00001;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00011;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00100;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00101;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00110;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b00111;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b01100;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b01101;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b01110;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
received_flag =1'b1;
#120000;
parallel_data_rx = 11'b0;
line_control_reg = 5'b01111;
received_flag = 1'b0;
#120000;
rst = 1'b1;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b11111111111;
#120000;
received_flag = 1'b1;
#120000;
received_flag =1'b0;
parallel_data_rx = 11'b01111111111;
#120000;
$finish;
end


endmodule
