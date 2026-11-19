# code for clk_buf_tb.v
  ...
     module clk_buf_tb();
        reg clk;
        wire buff;
        time t1,t2,t3,t4,t5,t6;

        clk_buf DUT(clk,buff);

        parameter BUS=10;

        always
        begin
                #(BUS/2);
                clk=1'b1;
                #(BUS/2);
                clk=~clk;
        end

        task initialize;
                begin
                        clk=0;
                end
        endtask

        task master_clk;
                begin
                        @(negedge clk);
                        t1=$time;
                        @(negedge clk);
                        t2=$time;

                        t3=t2-t1;
                end
        endtask

   task master_buff;
                begin
                        @(negedge buff);
                        t4=$time;
                        @(negedge buff);
                        t5=$time;

                        t6=t5-t4;
                end
        endtask

        task delay();
                begin
                        #20;
                end
        endtask

        initial
        begin
                initialize;
                master_clk;
                master_buff;
                if(t2==t4)
                        $display("The phase is equal");
                else
                        $display("The phase is not equal");

                if(t3==t6)
                        $display("The time is equal");
                else
                        $display("The time is not equal");
        end
        endmodule
...
