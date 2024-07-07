`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: controlunit
// Project Name: UART Transmitter

//////////////////////////////////////////////////////////////////////////////////

//Takes the parallel data from the line control register and performs the instructions accordingly

module controlunit(
input wire baud_clk,
input wire rst, //Reset is considered to be active low and negative edge trigerred through out the project
input wire [4:0] line_control_reg ,
//The line control register contains the send break bit, parity bit, parity enable bit, 
//and 2 bits for selecting the width of the data.
input wire [7:0] data_input, //The actual data which is to be transferred
output reg [10:0] data_frame, //The actual data along with start, parity and stop bits
output reg piso_start //Tells the piso module that parallel data is ready
    );
    
    reg send_break; //As long as this bit is high a data frame with all 0's will be transmitted
    reg P; //register for the parity
    reg PE; //register for parity enable
    reg [1:0] d_width; //register for the data width select bits
    reg parity; //register for the parity bit in the data frame

    
//assigning the registers their corresponding bit values from the line control register 
    always @(*) begin
       
       send_break = line_control_reg[4];
       P=line_control_reg[3];
       PE=line_control_reg[2];
       d_width = line_control_reg[1:0];
    end
    
//used sequential circuit for this because the piso_start which is acting as an enable for the piso unit must be synchronized with the baud_clk, else the circuit is momentarily going into a high impedance state for a few edge cases.     
//the receiver control unit does not have this problem so made it combinational
    always @(posedge baud_clk or negedge rst) begin
       if (~rst) begin
          data_frame <= 11'b0;
          piso_start <= 1'b0;
       end   
       else begin
          if(send_break) begin
             data_frame <= 11'b0;
          end 
          else begin
             
             case(d_width)
//Note: Start bits are taken to be 0, and stop bits are taken to be 1 by default. Since the UART transmission line goes high by default when no transmission is happening.
//When the transmission is not happening, UART maintains an idle high state                  
                    2'b00: begin                        
                            if (PE) begin //if parity enable is high parity is given based on the "P" bit else by default it is made zero
                                   if (P) begin 
                                   parity <= (^data_input[4:0])? 1'b0 : 1'b1; //even parity when "P" is high
                                   end
                                   else begin
                                   parity <= (^data_input[4:0])? 1'b1 : 1'b0; //odd parity when "P" is low
                                   end
                               end
                            else parity =1'b0;
                       data_frame <= {1'b0,3'b000,data_input [4:0],parity,1'b1}; //the MSBs are made 0,and only the 5 bits from the input register are being transferred
                    end
                    2'b01: begin                        
                            if (PE) begin //if parity enable is high parity is given based on the "P" bit else by default it is made zero
                                   if (P) begin //
                                   parity <= (^data_input[5:0])? 1'b0 : 1'b1;
                                   end
                                   else begin
                                   parity <= (^data_input[5:0])? 1'b1 : 1'b0;
                                   end
                               end
                            else parity <=1'b0;
                       data_frame <= {1'b0,2'b00,data_input [5:0],parity,1'b1}; //the MSBs are made 0,and only the 6 bits from the input register are being transferred
                    end
                    2'b10: begin                        
                            if (PE) begin //if parity enable is high parity is given based on the "P" bit else by default it is made zero
                                   if (P) begin //
                                   parity <= (^data_input[6:0])? 1'b0 : 1'b1;
                                   end
                                   else begin
                                   parity <= (^data_input[6:0])? 1'b1 : 1'b0;
                                   end
                               end
                            else parity <=1'b0;
                       data_frame <= {1'b0,1'b0,data_input [6:0],parity,1'b1}; //the MSBs are made 0,and only the 7 bits from the input register are being transferred
                    end
                    2'b11: begin                        
                            if (PE) begin //if parity enable is high parity is given based on the "P" bit else by default it is made zero
                                   if (P) begin //
                                   parity <= (^data_input[7:0])? 1'b0 : 1'b1;
                                   end
                                   else begin
                                   parity <= (^data_input[7:0])? 1'b1 : 1'b0;
                                   end
                               end
                            else parity <=1'b0;
                       data_frame <= {1'b0,data_input [7:0],parity,1'b1}; //All the data bits are transferred.
                    end
             endcase
          end
          piso_start <=1'b1;
       end
    
    end
endmodule
