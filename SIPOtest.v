`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: SIPOtest
// Project Name: UART receiver

//////////////////////////////////////////////////////////////////////////////////


module SIPOtest();
    
reg baud_clk_rx;
reg rst;
reg serial_data_tx;
wire [10:0] parallel_data_rx;
wire active_flag_rx;
wire received_flag;

SIPO instance1 (
    .baud_clk_rx(baud_clk_rx),
    .rst(rst),
    .serial_data_tx(serial_data_tx),
    .parallel_data_rx(parallel_data_rx),
    .active_flag_rx(active_flag_rx),
    .received_flag(received_flag)
  );
  
always begin
   #3255.208 baud_clk_rx = ~ baud_clk_rx;
end

initial begin
    baud_clk_rx=1'b0;
    rst = 1'b0;
    serial_data_tx =1'b1;
    #6510.416; //6510.416 since serial data comes synchronously with the baud_clk
    rst =1'b1;
    #3255.208;
    serial_data_tx = 1'b0; // start bit
    repeat(9)
    begin
    #6510.416;
    serial_data_tx = 1'b1; //sending 01111111111 data frame
    end
    #6510.416;
    serial_data_tx = 1'b1;
    #13020.832;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b1;
    #6510.416;
    serial_data_tx = 1'b0;
    #6510.416;
    serial_data_tx = 1'b1;
    #12000;
    $finish;

end

endmodule
