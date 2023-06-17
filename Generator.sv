/* Implemented a basic generator class - an object of layered testbench architecture */
class generator;

  rand bit wr;
  rand bit [3:0] addr;
  constraint wr{

    if(wr==1){
      addr inside {[0:7]};
    }
      else{
        addr inside {[8:15]};
      }
    }

endclass

module tb;

  generator g;
  int i;

  initial
    begin
      for(i=0;i<20;i++)
        begin
          g=new();
          g.randomize();
          $display("wr : %0d and addr : %0d",g.wr,g.addr);
        end
    end

endmodule
