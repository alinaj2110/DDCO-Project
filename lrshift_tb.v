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
    /*initial begin
        test_vecs[0][1]=1'b1; test_vecs[0][0]=1'b0;
        test_vecs[1][1]=1'b1; test_vecs[1][0]=1'b0;
        test_vecs[2][1]=1'b1; test_vecs[2][0]=1'b0;
        test_vecs[3][1]=1'b1; test_vecs[3][0]=1'b1;
        test_vecs[4][1]=1'b1; test_vecs[4][0]=1'b1;
        test_vecs[5][1]=1'b1; test_vecs[5][0]=1'b1;
    end*/
    initial d= 1'b0;
    lrshifter lrshifter_tb(clk, reset, load, d, direction, out );
    /*initial begin
        #20 for(i=0;i<5;i=i+1)
      begin #5{d,direction}=test_vecs[i]; end
    #100 $finish;  
    end*/
    initial begin
        #10 
        d=1'b1;
        direction=1'b0;
        #60 
        direction=1'b1;
        #60
        $finish;
        //#60 d=1'b0;
        //#40 initial {d,direction}={1,}

    end
    initial 
    $monitor("reset=%0b data=%b, load=%0b, direction=%0b, out=%b",reset, d, load, direction, out);


endmodule