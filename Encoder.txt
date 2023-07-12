// Encoder
module Encoder(data_in, data_out, do_XOR,counter1,counter2,i,j,h,n,M);
  input [31:0] data_in;
  output [31:0] data_out;
  output [4:0] do_XOR;
  output [4:0] counter1,counter2,i,j,h,n,M;
    
  reg [31:0] data_out = 32'd0;
  reg [4:0] place_of_1 [31:0];
  reg [4:0] counter1 = 5'd1,counter2 = 5'd0;
  reg [4:0] i = 5'd1;		// 計數用
  reg [4:0] j = 5'd0;		// 計數用
  reg [4:0] h = 5'd0;		// 計數用
  reg [4:0] n = 5'd0,M = 5'd0;
  reg [4:0] k = 5'd0;
  reg [4:0] do_XOR = 5'd0;
  
  initial begin
    // 計算M: input有幾個bit
    while(data_in > 2**M) begin
      M = M+1;
    end
    // 計算n: 幾位漢明碼
    while(M > 2**n) begin
      n = n+1;
    end

    k = M+n+1;		// 漢明碼編碼總位元數

    while((k-i)+1 > 0) begin
      if(i == 2**j) begin
		// 2冪次的位置需要放漢明碼，所以先留空
        j = j+1;
      end
      else begin
        // input從MSB開始放進output非漢明碼的位置
        data_out[k-i] = data_in[M-counter1];
        // output現在為1的位置，後續須做XOR計算，故將那些位置存進place_of_1
        if(data_in[M-counter1] == 1) begin
          place_of_1[counter2] = i;
          counter2 = counter2 + 1;
        end
        counter1 = counter1 + 1;
      end
      i = i+1;
    end
    
    // 將place_of_1內存的每個二進位值做XOR
    while(h < counter2) begin
      do_XOR = do_XOR ^ place_of_1[h];
      h = h + 1;
    end
    
    // 將Hamming code放進code word(output)
    i = 5'd1;
    j = 5'd0;
    
    while((k-i)+1 > 0) begin
      if(i == 2**j) begin
        data_out[k-i] = do_XOR[j];
        j = j+1;
      end
      i = i+1;
    end
    
  end
endmodule
