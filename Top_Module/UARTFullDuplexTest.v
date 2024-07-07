`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: UARTFullDuplexTest
// Project Name: UART Full Duplex

//////////////////////////////////////////////////////////////////////////////////


module UARTFullDuplexTest(
    );
    
reg clk1;
reg clk2;
reg rst1;
reg rst2;
reg [1:0] baud_sel1;
reg [1:0] baud_sel2;
reg [4:0] line_control_reg1;
reg [4:0] line_control_reg2;
reg [7:0] data_input1;
reg [7:0] data_input2;
wire [7:0] data_received1;
wire [7:0] data_received2;
wire data_corrupted_flag1;
wire data_corrupted_flag2;
wire active_flag_rx1;
wire active_flag_rx2;
wire transmission_done_flag1;
wire transmission_done_flag2;
wire active_flag_tx1;
wire active_flag_tx2;
wire done_flag_tx1;
wire done_flag_tx2;

UARTFullDuplexConfig instance1 (clk1,clk2,rst1,rst2,baud_sel1,baud_sel2,line_control_reg1,line_control_reg2,data_input1,data_input2,data_received1,data_received2,data_corrupted_flag1,data_corrupted_flag2,active_flag_rx1,active_flag_rx2,transmission_done_flag1,transmission_done_flag2,active_flag_tx1,active_flag_tx2,done_flag_tx1,done_flag_tx2);

//Generating 18.432 MHz clock
always begin
   #27.12968 clk1 = ~clk1;
end

//Generating 18.432 MHz clock
always begin
   #27.12968 clk2 = ~clk2;
end

initial begin
clk1 = 1'b0;
clk2 =1'b0;
rst1 = 1'b0;
rst2 = 1'b0;
baud_sel1 = 2'b00;
baud_sel2 = 2'b00;
line_control_reg1 = 5'b0;
line_control_reg2 = 5'b0;
data_input1 = 8'b0;
data_input2 = 8'b0;
#3000000;
rst1 = 1'b1;
rst2 = 1'b1;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b1111111;
data_input2 = 8'b1111111;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b10101010;
data_input2 = 8'b10101010;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b01101101;
data_input2 = 8'b01101101;
#3000000;
line_control_reg1 = 5'b00001;
line_control_reg2 = 5'b00001;
data_input1 = 8'b01010101;
data_input2 = 8'b01010101;
#3000000;
line_control_reg1 = 5'b00010;
line_control_reg2 = 5'b00010;
data_input1 = 8'b11100010;
data_input2 = 8'b11100010;
#3000000;
line_control_reg1 = 5'b00011;
line_control_reg2 = 5'b00011;
data_input1 = 8'b11100010;
data_input2 = 8'b11100010;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b00011101;
data_input2 = 8'b00011101;
#3000000;
baud_sel1 = 2'b01;
baud_sel2 = 2'b01;
line_control_reg1 = 5'b0;
line_control_reg2 = 5'b0;
data_input1 = 8'b0;
data_input2 = 8'b0;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b1111111;
data_input2 = 8'b1111111;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b10101010;
data_input2 = 8'b10101010;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b01101101;
data_input2 = 8'b01101101;
#3000000;
line_control_reg1 = 5'b00001;
line_control_reg2 = 5'b00001;
data_input1 = 8'b01010101;
data_input2 = 8'b01010101;
#3000000;
line_control_reg1 = 5'b00010;
line_control_reg2 = 5'b00010;
data_input1 = 8'b11100010;
data_input2 = 8'b11100010;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b00011101;
data_input2 = 8'b00011101;
#3000000;
baud_sel1 = 2'b10;
baud_sel2 = 2'b10;
line_control_reg1 = 5'b0;
line_control_reg2 = 5'b0;
data_input1 = 8'b0;
data_input2 = 8'b0;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b1111111;
data_input2 = 8'b1111111;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b10101010;
data_input2 = 8'b10101010;
#3000000;
line_control_reg1 = 5'b00000;
line_control_reg2 = 5'b00000;
data_input1 = 8'b01101101;
data_input2 = 8'b01101101;
#3000000;
line_control_reg1 = 5'b00001;
line_control_reg2 = 5'b00001;
data_input1 = 8'b01010101;
data_input2 = 8'b01010101;
#3000000;
line_control_reg1 = 5'b00010;
data_input1 = 8'b11100010;
line_control_reg2 = 5'b00010;
data_input2 = 8'b11100010;
#3000000;
line_control_reg1 = 5'b00000;
data_input1 = 8'b00011101;
line_control_reg2 = 5'b00000;
data_input2 = 8'b00011101;
#3000000;
baud_sel1 = 2'b11;
line_control_reg1 = 5'b0;
data_input1 = 8'b0;
baud_sel2 = 2'b11;
line_control_reg2 = 5'b0;
data_input2 = 8'b0;
#3000000;
line_control_reg1 = 5'b00000;
data_input1 = 8'b1111111;
line_control_reg2 = 5'b00000;
data_input2 = 8'b1111111;
#3000000;
line_control_reg1 = 5'b00000;
data_input1 = 8'b10101010;
line_control_reg2 = 5'b00000;
data_input2 = 8'b10101010;
#3000000;
line_control_reg1 = 5'b00000;
data_input1 = 8'b01101101;
line_control_reg2 = 5'b00000;
data_input2 = 8'b01101101;
#3000000;
line_control_reg1 = 5'b00001;
data_input1 = 8'b01010101;
line_control_reg2 = 5'b00001;
data_input2 = 8'b01010101;
#3000000;
line_control_reg1 = 5'b00010;
data_input1 = 8'b11100010;
line_control_reg2 = 5'b00010;
data_input2 = 8'b11100010;
#3000000;
line_control_reg1 = 5'b00000;
data_input1 = 8'b00011101;
line_control_reg2 = 5'b00000;
data_input2 = 8'b00011101;
#3000000;
$finish;

end

endmodule
