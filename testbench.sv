`timescale 1ns/1ns

module pwm_tb;
  reg CLK = 0;
  reg inc_duty;   // Used to increase duty cycle by 10% 
  reg dec_duty;   // Used to decrease duty cycle by 10%
  wire out;
  
  pwm myTask(.clk(CLK),.inc(inc_duty),.dec(dec_duty),.PWM_out(out));
  
  always
    begin
    #1 CLK = ~CLK;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(2);
      inc_duty = 0;   
      dec_duty = 0;	  
      
      #100
      inc_duty = 1;
      
      #39
      inc_duty = 0;
      #1
      dec_duty = 1;
      #40
      inc_duty = 1;
      dec_duty = 0;
            $finish;
    end
endmodule
