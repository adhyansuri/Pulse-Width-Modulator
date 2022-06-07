`timescale 1ns / 1ns

module pwm(input clk,input inc,input dec,output PWM_out);
  wire PWM_out;
  
  reg [7:0] counter = 10;
  reg [7:0] x = 0;  //Stores value by which % Duty cycle should be inc
  reg [7:0] y = 0;  
  reg flag = 1;
  reg temp;
  
  always @(clk)
    begin
    
      if(counter<100)     // Couter to keep track of duty cycle
      counter <= counter + 10;
    
      else begin
      counter <= 10;      // Resets the Duty Cycle 
      flag  = 1;
      end
      
      if(flag==1)begin    // Ensures that below code will run if new 						      duty cycle starts
        
        if(inc==1)begin   // Condition to check increase duty
         x = x + 10;
         flag = 0;        // Used so that x=x+10 does not run at every                               clock edge
        end
        
        if(dec==1)begin    // Condition to check decrease duty 
       //y = x;
          x = x - 10;
          flag = 0;
        end
          
      end
      
      if(dec == 1)
        temp = (counter<((40+x)-10)) ? 1:0; 
      
      else
        temp = (counter<(40+x)) ? 1:0;
  end
  
  assign PWM_out = temp;
  
  
  endmodule
