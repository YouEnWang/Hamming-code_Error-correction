### Hamming-code Error-correction

- input為32bits，包含1錯誤位元的Hamming-code
- input的位元順序為顛倒，即最左邊是LSB，最右邊是MSB
- 將input的錯誤位元以Hamming-code編碼規則找出錯誤位置並修正，即可得出output
