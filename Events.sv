/* Implemented the use cases of events and fork-join, which are used for IPC between classes of a testbench */
    module tb;
      
          task first();
            $display("Task 1 Started at %0t",$time);
          #20;      
            $display("Task 1 Completed at %0t",$time);     
        endtask
         
        task second();
          $display("Task 2 Started at %0t",$time);
          #30;      
         $display("Task 2 Completed at %0t",$time);     
        endtask
      
        task third();
          $display("Reached next to Join at %0t",$time);     
        endtask
      
      initial begin  
        fork
          
          first();
          second();
          
        join_none
        
          third();
      end
      
      
      
    endmodule
