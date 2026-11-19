# code for clk_buf.v
  ...
     module clk_buf(clk,buff);
        input clk;
        output buff;

        buf b1(buff,clk);
        endmodule
...
