`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: baudrategenerator
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////


module baudrategenerator(
input wire clk,
input wire [1:0] baud_sel,
input wire rst,
output reg baud_clk
    );
    
//Taking the baud divisor values for clock frequency 18.432 MHz
//The final divisor values will be divided by 2 and stored the register "final_value", so that the baud_clk toggles once it reaches this value.
//the "counter" will count till the final value and then reset itself.
//formula used for calculating baud divisor. Baud Divisor = 18.432*10^6/(16*Baudrate)
//Note to self: We are dividing by 16 also, because we are oversampling by 16, which means it takes 16 pulses to determine the bit value accurately.
reg [8:0] final_value;
reg [8:0] counter;

always @(*) begin
    case(baud_sel)
    2'b00: final_value = 9'd240; //Baudrate=2400   //note to self: always use the same no.of digits as the register
    2'b01: final_value = 9'd120; //Baudrate=4800
    2'b10: final_value = 9'd60;  //Baudrate=9600
    2'b11: final_value = 9'd15;  //Baudrate=38400
    default: final_value = 9'd60;  //Baudrate=9600    
    endcase
end    

//The baud_clk and the counter will be reset whenever the "rst" is low (active low reset)
//If the counter reaches the final value the counter will reset to zero and baud_clk will toggle
//Else the counter will increment by one at every positive edge of the system clock and the baud_clk will remain in the same state

always @(posedge clk or negedge rst) begin

if (~rst) begin
   counter <= 9'd0;
   baud_clk <= 1'b0;
  end
else if (counter >=final_value-1) begin   //note to self: always use >= not ==
   counter <= 9'd0 ;
   baud_clk <= ~baud_clk; 
  end
else begin
   counter <= counter+1'd1 ;
   baud_clk<= baud_clk; 
  end
  
end    
endmodule
