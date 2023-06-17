/* Implemented the usage of queues in system verilog */
`timescale 1ns/1ns
module tb();

  int arr_fixed[20];
  int arr_q[$];
  int i,j;

  initial
    begin
      for(i=0;i<20;i++)
        arr_fixed[i]=$urandom();
      arr_q={0};

      for(j=0;j<20;j++)
        arr_q.insert(0,arr_fixed[j]);
      j=arr_q.pop_back();

      $display("The fixed array: %p",arr_fixed);
      $display("The queue is: %p",arr_q);

      $dumpfile("test.vcd");
      $dumpvars(0,tb);

    end

endmodule
