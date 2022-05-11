// Sorts the array of length R2 whose first element is at R1 in ascending order in place. 
// Sets R0 to True (-1) to indicate completion.

//we are going over write R1,R2,R3, save those values somewhere safe
@R1
D=M
@arr0
M=D
@R2
D=M
@sz0
M=D

// main() {
//     int16_t* end = arr + sz - 1;
//     quickSort(arr, end);
//......
// }
@arr0
D=M
@sz0
D=D+M
D=D-1
@end0
M=D

// get stack ready and call quickSort funcion.


(END)
@END
0;JMP

// For small functions
// let R13 = a, R14 = b, R15 = return value
// let R10 to be return address


// void swapV(int16_t* a, int16_t* b)
(swapV)
@R13
A=M
D=M
@temp
M=D

@R14
A=M
D=M
@R13
A=M
M=D

@temp
D=M
@R14
A=M
M=D

(swapV$return)
@R10
A=M
0;JMP


// For small functions
// let R13 = a, R14 = b, R15 = return value
// let R10 to be return address

// bool LTA(int16_t* a, int16_t* b)
@R13
D=M
@R14
D=D-M