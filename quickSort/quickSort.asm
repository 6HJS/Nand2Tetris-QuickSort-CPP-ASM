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
@L
@G
@P

// since we are going to do the quick sorting recursively, need to use stack
// setup Stack bootom position
@256 // Stack bottom at 256, grows towards higher address
D=A
@SP
M=D
@ARG
M=D
@LCL
M=D


(main)
// prepare funciton calling argument
@arr0
D=M
@SP
A=M
M=D // put the pointer to the array to the ARG (now same as SP)
@SP
M=M+1 // incrment SP
// now ARG[0] is arr[0]

@arr0
D=M
@sz0
D=D+M
D=D-1 // the end of array is at arr0 + sz0 -1 as array starts from arr[0]
@SP
A=M
M=D
@SP
M=M+1 // incrment SP
// now ARG[1] is arr[end-1]

@main.return
D=A
@SP
A=M
M=D
@SP
M=M+1 // incrment SP

@ARG
D=M
@SP
A=M
M=D // save the caller ARG to stack
@SP
M=M+1 // incrment SP

// call quckSort function
@quickSort
0;JMP

(main.return)
@R0
M=-1 // put -1 in R0 to indicate finish
(END) // return the main function, halt.
@END
0;JMP

(quickSort)
// load subend from from argument
@ARG
A=M
A=A+1 // subend at ARG[1]
D=M 
@ARG // subaddr at ARG[0]
A=M
D=D-M // subend - subarr
@quickSort.subarr_sz_GT_1 // then do quckSort on this sub string
D=D-1;JGT
@quickSort.return // resursion control condition return
0;JMP // return if the subarr only has one number (or none)

(quickSort.subarr_sz_GT_1)
@ARG
A=M
D=M // load pointer to the subarr
@L
M=D // put it into L pointer
@ARG
A=M
A=A+1
D=M // load pointer to the subend
@G
M=D // put it into G pointer

// seek for middle point
(quickSort.While_L_LT_G)
@L
D=M
@G
D=D-M
@quickSort.While_L_LT_G_EXIT
D;JGE

@L
M=M+1 // L++
@G
M=M-1 // G--

@quickSort.While_L_LT_G
0;JMP

(quickSort.While_L_LT_G_EXIT)
@G
D=M
@P
M=D //P = G;  // select the middle element as the pivoit

// reset Lesser Greater point to the two subend of the array
@ARG
A=M
D=M // load pointer to the subarr
@L
M=D // put it into L pointer
@ARG
A=M
A=A+1
D=M // load pointer to the subend
@G
M=D // put it into G pointer

// swap P and G to put the pivoit out of the way, to the end
// call swap function
@ARG
D=M
@SP
A=M
M=D // save the ARG of quickSrot to the stack before calling swap
@SP
M=M+1 // incrment SP

// Problem why there no argument for the first layer quickSort?
/////////////////////////////////////////////////////////////////

@SP
D=M
@ARG
M=D // move ARG up, now ARG is swap's
@SP
M=M+1 // incrment SP

@P
D=M
@ARG
A=M
M=D

@G
D=M
@ARG
A=M
A=A+1
M=D

// setup return address
@quickSort.P_G_swap_exit
D=A
@ARG
A=M
A=A+1
A=A+1
M=D

@swap
0;JMP // call the swap function

(quickSort.P_G_swap_exit)
@SP
A=M-1 
D=M
@ARG
M=D // recover quickSort's ARG
@SP
M=M-1 // decrment SP

(quickSort.return)
@ARG
A=M
A=A+1
A=A+1
0;JMP // jump to the return address at ARG[2]

(swap)
// get a and b from the stack
@ARG
D=M
@a
M=D
@ARG
D=M+1
@b
M=D

// temp = *a;
@a
A=M
D=M // dereference a to get the value
@temp
M=D

// *a = *b;
@b
A=M
D=M
@a
A=M
M=D

// *b = temp;
@temp
D=M
@b
A=M
M=D

(swap.return)
// load the return address
@ARG
A=A+1
A=A+1
0;JMP // return
