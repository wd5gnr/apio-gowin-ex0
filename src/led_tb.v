`timescale 1ms / 1us
// each "tick" is worth 1ms so #100 == 0.1 second delay
`default_nettype none
module led_tb;
  reg clk;
  reg reset;
  wire [5:0] leds;
  wire serialout;
  // create top block for testing
  led #(
      .CLOCK_FREQUENCY(10),  // but tell it to expect 10 Hz
      .INTERVAL_MS(1000)
  ) uut (
      .reset(reset),
      .Clock(clk),
      .serialin(1'b0),
      .pushbtn(1'b0),
      .leds(leds),
      .serialout(serialout)
  );
  // generate simulation clock
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end

  // simulation "main"
  initial begin
    $dumpvars(0, led_tb);  // store variables
    reset = 1;  // generate a reset pulse
    #200;
    reset = 0;
    #50000  // let simulation run for a bit
    $finish;  // exit
  end
endmodule
