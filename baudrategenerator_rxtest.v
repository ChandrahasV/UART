`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
// Module Name: baudrategenerator_rxtest
// Project Name: UART receiver 

//////////////////////////////////////////////////////////////////////////////////


module baudrategenerator_rxtest(
    );

reg clk_rx;
reg [1:0] baud_sel;
reg rst;
wire baud_clk_rx;

//Generating 18.432 MHz clock
always begin
   #27.12968 clk_rx = ~clk_rx;
end


baudrategenerator_rx instance1 (clk_rx,baud_sel,rst,baud_clk_rx);

initial begin
   clk_rx= 0;
   rst=0;
   baud_sel=2'b00;
   #1000;
   rst=1;
   #3000000;
   baud_sel = 2'b01;
   #3000000;
   baud_sel = 2'b10;
   #3000000; 
   baud_sel = 2'b11;   
   #3000000;   
   $finish;
end

endmodule
