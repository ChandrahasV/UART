`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: controlunit_rx
// Project Name: UART receiver

//////////////////////////////////////////////////////////////////////////////////

//Takes the parallel data from the sipo unit and seperates the data frame into data output, parity bit, start bit, and stop bit

module controlunit_rx(
    input wire rst,
    input wire received_flag,
    input wire [10:0] parallel_data_rx,
    input wire [4:0] line_control_reg,
    output reg [7:0] data_received,
    output reg data_corrupted_flag,
    output reg transmission_done_flag 
);
    
reg parity_bit_rx;
reg P;
reg PE;
reg start_bit_rx;
reg stop_bit_rx;
reg par;
reg [1:0] d_width;

always@(*) begin
    PE = line_control_reg[2];
    P = line_control_reg[3]; 
    d_width = line_control_reg[1:0];
    
    if (~rst) begin
        data_received = 8'b0;
        data_corrupted_flag = 1'b0;
        transmission_done_flag = 1'b0;
        parity_bit_rx = 1'b0;
        start_bit_rx = 1'b0;
        stop_bit_rx = 1'b0;
        par = 1'b0;
    end 
    else begin
        data_received = parallel_data_rx[9:2];
        parity_bit_rx = parallel_data_rx[1];
        start_bit_rx = parallel_data_rx[10];
        stop_bit_rx = parallel_data_rx[0];
        
        if (start_bit_rx)  data_corrupted_flag = 1'b1;
        else if (~stop_bit_rx) data_corrupted_flag = 1'b1;
        else begin
            if (~PE) begin 
                data_corrupted_flag = (parity_bit_rx == 1'b1);
            end
            else begin
               case (d_width)
               2'b00 : begin
                        if (~P) par = ^data_received[4:0]; //If P is low then odd parity else even parity
                        else par = ~(^data_received[4:0]);
                    end
               2'b01 : begin
                        if (~P) par = ^data_received[5:0];
                        else par = ~(^data_received[5:0]);
                    end
               2'b10 : begin
                        if (~P) par = ^data_received[6:0];
                        else par = ~(^data_received[6:0]);
                    end
               2'b11 : begin
                        if (~P) par = ^data_received[7:0];
                        else par = ~(^data_received[7:0]);
                    end
                endcase

                data_corrupted_flag = (par != parity_bit_rx);
            end
        end
        transmission_done_flag = received_flag;
    end 
end
endmodule
