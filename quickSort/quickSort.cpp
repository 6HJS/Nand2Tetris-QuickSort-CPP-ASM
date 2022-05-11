#include <cstdint>
#include <iostream>

// int16_t arr[6] = {2, 3, 4, 6, 1, 5};  // R1
// int16_t arr[6] = {1, 4, 20000, 22000, 1, 5};  // R1
// int16_t arr[6] = {-22000, -20000, 1, 4, 1, 5};  // R1
int16_t arr[6] = {22000, 1, 4, -20000, 1, 5};  // R1
// int16_t arr[6] = {-20000, 1, 4, 22000, 1, 5};  // R1
int16_t sz = 6;  // R2

// let R13 = a, R14 = b, R15 = return value

void swapV(int16_t* a, int16_t* b) {
    int16_t temp = *a;  // @a
                        // A=M
                        // D=M
                        // @temp
                        // M=D
    *a = *b;            // @b
                        // A=M
                        // D=M
                        // @a
                        // A=M
                        // M=D
    *b = temp;          // @temp
                        // D=M
                        // @b
                        // A=M
                        // M=D
}

bool LTA(int16_t* a, int16_t* b) {
    bool result;
    int16_t D = (int16_t)a;
    D = D - (int16_t)b;
    if (D >= 0)
        goto LTA$aGTb;
    result = true;
    goto LTA$return;
LTA$aGTb:
    result = false;
LTA$return:
    return result;
}

bool GTV(int16_t* a, int16_t* b) {
    bool result;
    int16_t av = *a, bv = *b;  // dereference a and b value
    if (av > 0)
        goto GTV$avGT0;
    goto GTV$avLEQ0;
GTV$avGT0:
    if (bv > 0)
        goto GTV$compare;
    goto GTV$returnTrue;
GTV$avLEQ0:
    if (bv > 0)
        goto GTV$returnFalse;
    goto GTV$compare;
GTV$compare:
    if (av - bv > 0)
        goto GTV$returnTrue;
    goto GTV$returnFalse;

GTV$returnTrue:
    result = true;
    goto GTV$return;
GTV$returnFalse:
    result = false;
GTV$return:
    return result;
}

bool LTV(int16_t* a, int16_t* b) {
    int16_t av = *a, bv = *b;  // dereference a and b value
    uint16_t result;
    if (av < 0)
        goto LTV$avGT0;
    goto LTV$avLEQ0;
LTV$avGT0:
    if (bv < 0)
        goto LTV$compare;
    goto LTV$returnTrue;
LTV$avLEQ0:
    if (bv < 0)
        goto LTV$returnFalse;
    goto LTV$compare;
LTV$compare:
    if (av - bv < 0)
        goto LTV$returnTrue;
    goto LTV$returnFalse;

LTV$returnTrue:
    result = true;
    goto LTV$return;
LTV$returnFalse:
    result = false;
LTV$return:
    return result;
}

void quickSort(int16_t* subarr, int16_t* subend) {
    int16_t* L;               // lesser pointer
    int16_t* G;               // greater pointer
    int16_t* P;               // piviot
    if (subend - subarr < 1)  // return if the subarr only has one number (or none)
        goto quickSort$return;
    else {
        L = subarr;
        G = subend;  // arr starts from 0
        // find pivoit the element in the middle of the array
        while (LTA(L, G)) {
            L++;
            G--;
        }
        P = G;  // select the middle element as the pivoit

        // reset Lesser Greater point to the two subend of the array
        L = subarr;
        G = subend;   // arr starts from 0
        swapV(P, G);  // put the pivoit out of the way, to the end
        P = subend;   // now the Pivoit is at arr[end]
        G--;

        while (LTA(L, G)) {
            while (LTV(L, P)) {  // find the first element larger than pivoit from left
                L++;
            }
            while (GTV(G, P)) {  // find the first element smaller than pivoit from right
                G--;
            }
            if (LTA(L, G)) {
                swapV(L, G);
                L++;
                G--;
            }
        }
        if (GTV(L, P)) {
            swapV(L, P);
        }
        // now pivoit is at tis correct position and all number to its left is smaller, all number to the right is larger.
        // recursive call
        quickSort(subarr, L - 1);
        quickSort(L + 1, subend);
    }
quickSort$return:
    return;
}

int main(int argc, char const* argv[]) {
    int16_t* end = arr + sz - 1;
    quickSort(arr, end);
    for (int16_t num : arr) std::cout << num << ", ";
    return 0;
}
