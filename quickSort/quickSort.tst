load quickSort.asm,
output-file quickSort.out,
compare-to quickSort.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[40]%D2.6.2 RAM[41]%D2.6.2 RAM[42]%D2.6.2 RAM[43]%D2.6.2 RAM[44]%D2.6.2 RAM[45]%D2.6.2;

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  40, // Set R1
set RAM[2]  6,  // Set R2
set RAM[40] 2,  // Set Arr[0]
set RAM[41] 4,  // Set Arr[1]
set RAM[42] 6,  // Set Arr[2]
set RAM[43] 3,  // Set Arr[3]
set RAM[44] 1,  // Set Arr[4]
set RAM[45] 5;  // Set Arr[5]
repeat 800 {
  ticktock;    // Run for 800 clock cycles
}
set RAM[1] 40,  // Restore arguments in case program used them
set RAM[2] 6,
output;        // Output to file

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  40, // Set R1
set RAM[2]  6,  // Set R2
set RAM[40] 20000,  // Set Arr[0]
set RAM[41] 1,  // Set Arr[1]
set RAM[42] 4,  // Set Arr[2]
set RAM[43] 22000;  // Set Arr[3]
repeat 2000 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 40,  // Restore arguments in case program used them
set RAM[2] 6,
output;        // Output to file

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  40, // Set R1
set RAM[2]  6,  // Set R2
set RAM[40] -20000,  // Set Arr[0]
set RAM[41] 1,  // Set Arr[1]
set RAM[42] 4,  // Set Arr[2]
set RAM[43] -22000;  // Set Arr[3]
repeat 2000 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 40,  // Restore arguments in case program used them
set RAM[2] 6,
output;        // Output to file

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  40, // Set R1
set RAM[2]  6,  // Set R2
set RAM[40] 20000,  // Set Arr[0]
set RAM[41] 1,  // Set Arr[1]
set RAM[42] 4,  // Set Arr[2]
set RAM[43] -22000;  // Set Arr[3]
repeat 2000 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 40,  // Restore arguments in case program used them
set RAM[2] 6,
output;        // Output to file

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  40, // Set R1
set RAM[2]  6,  // Set R2
set RAM[40] -20000,  // Set Arr[0]
set RAM[41] 1,  // Set Arr[1]
set RAM[42] 4,  // Set Arr[2]
set RAM[43] 22000;  // Set Arr[3]
repeat 2000 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 40,  // Restore arguments in case program used them
set RAM[2] 6,
output;        // Output to file
