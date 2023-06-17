/* Implemented usecase of parametrized mailbox, which is used as a part of IPC for communication betweeen the classes of a testbench */

    class transaction;
      
      bit [7:0] data;
      
    endclass
     
 //generator class    
    class generator;
      
      int data = 12;
      transaction t;
      
      mailbox #(transaction)  mbx;
      
      logic [7:0] temp = 3;
      
      function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
      endfunction
      
      
      task run();
        t = new();
        t.data = 45;
        mbx.put(temp);
        $display("[GEN] : Data Send from Gen : %0d ",t.data);
      endtask
      
    endclass
  
  //Driver Class
    class driver;
      mailbox #(transaction) mbx;
      transaction data;
      
      function new(mailbox #(transaction)  mbx);
        this.mbx = mbx;
      endfunction
      
      
      
      task run();
        mbx.get(data);
        $display("[DRV] : DATA rcvd : %0d",data.data);
      endtask
      
      
    endclass
     
  //TestBench top cum Environment   
    module tb;
      generator gen;
      driver drv;
      mailbox #(transaction) mbx;
      
      initial begin
     
        mbx = new();
        gen = new(mbx);
        drv = new(mbx); 
        
        gen.run();
        drv.run();
      end
      
      
    endmodule
