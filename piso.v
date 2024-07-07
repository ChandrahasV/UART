`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: piso
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////

//Takes the parallel data frame, converts it to a serial data frame and transmits it serially in 11 baud_clk cycles
module piso(
input wire [10:0] data_frame,
input wire baud_clk,
input wire rst,
input wire piso_start, //enable for the piso module taken from the control unit
output reg serial_data_tx, //serial data which is transmitted from the piso module
output reg active_flag, //High if the transmission is happening in the piso module, else goes low
output reg done_flag //High if the transmission is done, low if the piso module is still active
    );
    reg [3:0] counter;
    reg [10:0] data_replica; // Storing the data frame in this register so that data can be shifted 
    
    always @(posedge baud_clk or negedge rst) begin

    data_replica <= data_frame;
       
       if (~rst) begin
          serial_data_tx <= 1'b1; //Transmitting zero during reset and non-active transmissions since our start bit is 1
          active_flag <= 1'b1;
          done_flag <= 1'b0;
          counter <= 4'd0;   
       end
       
       else begin
          if (piso_start) begin
             if (counter <4'd11) begin
                       
             serial_data_tx <= data_replica[10] ;//Transfer is happening from MSB to LSB since start bit should be transferred first
             data_replica <= data_replica<<1;
             active_flag <= 1'b1;
             done_flag <= 1'b0;
             counter <= counter + 1'd1;
             
             end
          
             else begin
          
             serial_data_tx <= 1'b1; //Transmitting zero during reset and non-active transmissions since our start bit is 1
             active_flag <= 1'b0;
             done_flag <= 1'b1;
             counter <= 4'd0;   
          
             end                  
          end   
          else begin
          
             serial_data_tx <= 1'b1;
             active_flag <= 1'b0;
             done_flag <= 1'b1;
             counter <= 4'd0;
             
          end
       
       end
end
    
    
    
endmodule
