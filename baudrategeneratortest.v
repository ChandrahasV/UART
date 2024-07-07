`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: baudrategeneratortest
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////


module baudrategeneratortest(
);

reg clk;
reg [1:0] baud_sel;
reg rst;
wire baud_clk;

//Generating 18.432 MHz clock
always begin
   #27.12968 clk = ~clk;
end


baudrategenerator instance1 (.clk(clk),.baud_sel(baud_sel),.rst(rst),.baud_clk(baud_clk));

initial begin
   clk = 0;
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
