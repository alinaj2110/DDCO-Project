module tb;
    reg clk, reset,load;
    reg d, direction;
    wire [15:0] out;
    reg [1:0] test_vecs [0:5];
    integer i;

    initial begin 
        $dumpfile("tb_lrshifter.vcd"); 
        $dumpvars(0,tb); 
    end
    initial begin 
        reset = 1'b1; 
        load=1'b0;
        #10 reset = 1'b0; 
    end
    initial #10 load=1'b1;
    initial clk = 1'b0; always #5 clk =~ clk;
    
    lrshifter lrshifter_tb(clk, reset, load, d, direction, out );
    initial begin
        #10 
        d=1'b1;
        direction=1'b0;
        #60 
        direction=1'b1;
        #60
        $finish;
    end
    initial 
    $monitor("reset=%0b data=%b, load=%0b, direction=%0b, out=%b",reset, d, load, direction, out);


endmodule