`timescale 1ns / 1ps

module Comparator(
    input [9:0] i_counter,
    //output o_light_1, o_light_2, o_light_3, o_light_4
    output [4:0] o_light
    );

    assign o_light[0] = (i_counter < 300) ? 1'b1 : 1'b0;
    assign o_light[1] = (i_counter < 600) ? 1'b1 : 1'b0;
    assign o_light[2] = (i_counter < 800) ? 1'b1 : 1'b0;
    assign o_light[3] = (i_counter < 990) ? 1'b1 : 1'b0;
endmodule
