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
D=M  // int16_t D = (int16_t)a;
@R14
D=D-M // D = D - (int16_t)b;
@LTA$aGTb
D;JGE // if (D >= 0) goto LTA$aGTb;
@R15
M=-1 // result = true
@LTA$return
0;JMP
(LTA$aGTb)
@R15
M=0 // result = false
(LTA$return)
@R10
0;JMP

// For small functions
// let R13 = a, R14 = b, R15 = return value
// let R10 to be return address

// bool GTV(int16_t* a, int16_t* b)
@R13 // int16_t av = *a, bv = *b;
A=M
D=M
@GTV$avGT0
D;JGT
@GTV$avLEQ0
0;JMP

(GTV$avGT0)
@R14
A=M
D=M
@GTV$compare
D;JGT
@GTV$returnTrue
0;JMP

(GTV$avLEQ0)
@R14
A=M
D=M
@GTV$returnFalse
D;JGT
@GTV$compare
0;JMP

(GTV$compare)
@R13
A=M
D=M
@R14
A=M
D=D-M
@GTV$returnTrue
D;JGT
@GTV$returnFalse
0;JMP

(GTV$returnTrue)
@R15
M=-1
@GTV$return
0;JMP
(GTV$returnFalse)
@R15
M=0
(GTV$return)
@R10
0;JMP

// For small functions
// let R13 = a, R14 = b, R15 = return value
// let R10 to be return address

// bool LTV(int16_t* a, int16_t* b)
@R13 // int16_t av = *a, bv = *b;
A=M
D=M
@LTV$avLT0
D;JLT
@LTV$avGEQ0
0;JMP

(LTV$avLT0)
@R14
A=M
D=M
@LTV$compare
D;JLT
@LTV$returnTrue
0;JMP

(LTV$avGEQ0)
@R14
A=M
D=M
@LTV$returnFalse
D;JLT
@LTV$compare
0;JMP

(LTV$compare)
@R13
A=M
D=M
@R14
A=M
D=D-M
@LTV$returnTrue
D;JLT
@LTV$returnFalse
0;JMP

(LTV$returnTrue)
@R15
M=-1
@LTV$return
0;JMP
(LTV$returnFalse)
@R15
M=0
(LTV$return)
@R10
0;JMP

// quickSort recursive call.
// void quickSort(int16_t* subarr, int16_t* subend)

// apply new space in Stakc to store local variables
// L,G,P
@SP
D=M
@LCL
M=D

@SP
AM=M+1
A=A-1
M=0 // initialize L

@SP
AM=M+1
A=A-1
M=0 // initialize G

@SP
AM=M+1
A=A-1
M=0 // initialize P

@ARG
A=M // address of subarr
D=M // value of subarr (still a pointer)

A=A+1 // address of subend
D=D-M // value of subend (still a pointer)

D=D-1 // (subend - subarr < 1)
@quickSort$return
D;JLT
















(quickSort$return)
@ARG
D=M
@2
A=D+A // memory location sores return address
A=M // get the return address
0;JMP