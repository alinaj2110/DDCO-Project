//basic modules
module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module df (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule

module dfr (input wire clk, reset, in, output wire out);
  wire reset_, df_in;
   reset_= ~reset;
  df_in= in & reset_;
  df df_0 (clk, df_in, out);
endmodule

module dfrl (input wire clk, reset, load, in, output wire out);
  wire _in;
  mux2 mux2_0(out, in, load, _in);
  dfr dfr_1(clk, reset, _in, out);
endmodule

//lr shifter module
module lrshifter(input wire clk, reset, load, data, direction, output wire [3:0] out);

    wire [3:0]t;
    mux2 mux2_0(data,out[2],direction,t[0]);
    mux2 mux2_1(out[3],out[1],direction,t[1]);
    mux2 mux2_2(out[2],out[0],direction,t[2]);
    mux2 mux2_3(out[1],data,direction,t[3]);

    dfrl dfrl_0(clk, reset, load, t[0],out[3]);
    dfrl dfrl_1(clk, reset, load, t[1],out[2]);
    dfrl dfrl_2(clk, reset, load, t[2],out[1]);
    dfrl dfrl_3(clk, reset, load, t[3],out[0]);

endmodule