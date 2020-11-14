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
  wire reset_ , df_in;
  assign reset_ = !reset;
  assign df_in= in & reset_;
  df df_0 (clk, df_in, out);
endmodule

module dfrl (input wire clk, reset, load, in, output wire out);
  wire _in;
  mux2 mux2_0(out, in, load, _in);
  dfr dfr_1(clk, reset, _in, out);
endmodule

//lr shifter module
module lrshifter(input wire clk, reset, load, data, direction, output wire [15:0] out);

    wire [15:0]t;
    mux2 mux2_0(data,out[14],direction,t[0]);
    mux2 mux2_1(out[15],out[13],direction,t[1]);
    mux2 mux2_2(out[14],out[12],direction,t[2]);
    mux2 mux2_3(out[13],out[11],direction,t[3]);
    mux2 mux2_4(out[12],out[10],direction,t[4]);
    mux2 mux2_5(out[11],out[9],direction,t[5]);
    mux2 mux2_6(out[10],out[8],direction,t[6]);
    mux2 mux2_7(out[9],out[7],direction,t[7]);
    mux2 mux2_8(out[8],out[6],direction,t[8]);
    mux2 mux2_9(out[7],out[5],direction,t[9]);
    mux2 mux2_10(out[6],out[4],direction,t[10]);
    mux2 mux2_11(out[5],out[3],direction,t[11]);
    mux2 mux2_12(out[4],out[2],direction,t[12]);
    mux2 mux2_13(out[3],out[1],direction,t[13]);
    mux2 mux2_14(out[2],out[0],direction,t[14]);
    mux2 mux2_15(out[1],data,direction,t[15]);
    
    dfrl dfrl_0(clk, reset, load, t[0],out[15]);
    dfrl dfrl_1(clk, reset, load, t[1],out[14]);
    dfrl dfrl_2(clk, reset, load, t[2],out[13]);
    dfrl dfrl_3(clk, reset, load, t[3],out[12]);
    dfrl dfrl_4(clk, reset, load, t[4],out[11]);
    dfrl dfrl_5(clk, reset, load, t[5],out[10]);
    dfrl dfrl_6(clk, reset, load, t[6],out[9]);
    dfrl dfrl_7(clk, reset, load, t[7],out[8]);
    dfrl dfrl_8(clk, reset, load, t[8],out[7]);
    dfrl dfrl_9(clk, reset, load, t[9],out[6]);
    dfrl dfrl_10(clk, reset, load, t[10],out[5]);
    dfrl dfrl_11(clk, reset, load, t[11],out[4]);
    dfrl dfrl_12(clk, reset, load, t[12],out[3]);
    dfrl dfrl_13(clk, reset, load, t[13],out[2]);
    dfrl dfrl_14(clk, reset, load, t[14],out[1]);
    dfrl dfrl_15(clk, reset, load, t[15],out[0]);
    

endmodule