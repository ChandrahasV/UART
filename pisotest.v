`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: pisotest
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////


module pisotest(
    );

reg [10:0] data_frame;
reg baud_clk;
reg rst;
reg piso_start; //enable for the piso module taken from the control unit
wire serial_data_tx; //serial data which is transmitted from the piso module
wire active_flag; //High if the transmission is happening in the piso module, else goes low
wire done_flag;

piso instance1 (data_frame,baud_clk,rst,piso_start,serial_data_tx,active_flag,done_flag);     
   
always begin
//  Testing the most common BaudRate 9600 
   #3255.208 baud_clk = ~baud_clk;
end

initial begin
   
   baud_clk = 1'b0;
   rst = 1'b0;
   data_frame = 11'b00000000001;
   piso_start = 1'b0;
   
   #300000;
   rst = 1'b1;
   #300000;
   piso_start =1'b1;
   #300000;
   piso_start = 1'b0;
   #10000;
   piso_start =1'b1;
   data_frame = 11'b01010101011;
   #300000;
   piso_start = 1'b0;
   #10000;
   piso_start =1'b1;
   data_frame = 11'b01111001101;
   #400000;
   $finish;
   

end

    
endmodule
