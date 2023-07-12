module Decoder_tb();
  reg [31:0] data_in;
  wire [31:0] data_out;
  wire [4:0] do_XOR;
  wire [4:0] M;
  	
  Decoder De(
    .data_in(data_in),
    .data_out(data_out),
    .do_XOR(do_XOR),
    .M(M)
    );
  
  initial begin
    data_in = 10'b1101110101;
    #4;
    $dumpfile("De.vcd");
    $dumpvars;
    #16;				// 可改
    $display("TEST START");
    $display("The input codes you enter are:%b", data_in);
    $display("The position of a specific error code:%d", do_XOR);
//     $display("The position of a specific error code:%d", M-do_XOR);
//     $display("The Hamming code:%b", do_XOR);
    $display("The output codes are:%b", data_out);
    $display("TEST FINISH");
    $finish;
  end

endmodule   
