`timescale 1ns / 1ps

module top_LightStand(
    input i_clk,
    input i_reset,
    input [2:0] i_button,

    output o_y
    );

    wire w_clk;
    ClockDivider clkdiv(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk)
    );

    wire [9:0] w_counter; 
    Counter cnt(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_counter(w_counter)
    );

    wire [4:0] w_light;
    Comparator comp(
    .i_counter(w_counter),
    .o_light(w_light)
    );

    wire [2:0] w_button;
    Button_Controler btn0(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_button(w_button[0])
    );

    Button_Controler btn1(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_button(w_button[1])
    );

    Button_Controler btn2(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_button(w_button[2])
    );

    wire [2:0] w_lightState;
    LightMode fsm(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_lightState(w_lightState)
    );

    Mux mux(
    .i_x(w_light),
    .sel(w_lightState),
    .o_y(o_y)
    );

endmodule
