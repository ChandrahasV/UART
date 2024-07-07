`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: SIPO
// Project Name: UART Receiver

//////////////////////////////////////////////////////////////////////////////////

//Takes the serial data from the transmitter as an input and converts it to parralel for the reciever using a SIPO shift register.
//It will take 11 baud cycles to fully convert the data;

module SIPO(
input wire baud_clk_rx,
input wire rst,
input wire serial_data_tx, 
output reg [10:0] parallel_data_rx,
output reg active_flag_rx, //goes high when the data is still being transferred
output reg received_flag //goes high whenever the previous data transfer is completed and the module is ready to receive new data;
    );
    
reg [3:0] counter;
    
always @(posedge baud_clk_rx or negedge rst) begin
    
    if(~rst) begin
    
       parallel_data_rx <= 11'b0;
       active_flag_rx <= 1'b0; //Note: in the transmitter active_flag was high during reset but in the receiver it stays low during the reset
       received_flag <= 1'b0;
       counter <= 4'b0;
    
    end
    
    else begin
    
       if(counter==4'b0) begin
       
          if(serial_data_tx <=1'b0) begin //start bit detected
             
             parallel_data_rx[10] <= 11'b0;
             parallel_data_rx[10] <= serial_data_tx;
             active_flag_rx <= 1'b1;
             received_flag <= 1'b0;
             counter<=counter +1'b1;
          
          end
          
          else begin
          
             active_flag_rx <= 1'b0;
             received_flag <= 1'b1;
          
          end
       
       end
       
       else if (active_flag_rx&&(counter<=4'd10)) begin
       
          parallel_data_rx[4'd10 - counter] <= serial_data_tx;
          active_flag_rx <= 1'b1;
          received_flag <= 1'b0;
          counter<=counter +1'b1;
       
       end
       
       else begin
          
          counter <= 4'b0;
          active_flag_rx <= 1'b0;
          received_flag <= 1'b1;
       
       end
    
    
    end



end

endmodule
