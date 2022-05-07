#include <cstdint>
#include <iostream>

int16_t arr[6] = {2, 3, 4, 6, 1, 5};  // R1
// int16_t arr[6] = {1, 4, 20000, 22000, 1, 5};  // R1
// int16_t arr[6] = {-22000, -20000, 1, 4, 1, 5};  // R1
// int16_t arr[6] = {22000, 1, 4, -20000, 1, 5};  // R1
// int16_t arr[6] = {-20000, 1, 4, 22000, 1, 5};  // R1
int16_t sz = 6;  // R2

void swapV(int16_t* a, int16_t* b) {
    int16_t temp = *a;
    *a = *b;
    *b = temp;
}

bool LTA(int16_t* a, int16_t* b) {
    if (a - b < 0)
        return true;
    else
        return false;
}

bool GTV(int16_t* a, int16_t* b) {
    int16_t av = *a, bv = *b;  // dereference a and b value
    if (av > 0) {
        if (bv > 0)
            goto GTV_compare;
        else
            return true;
    } else {  // av is smaller or equal to 0
        if (bv > 0)
            return false;
        else
            goto GTV_compare;
    }
GTV_compare:
    if (av - bv > 0)
        return true;
    else
        return false;
}

bool LTV(int16_t* a, int16_t* b) {
    int16_t av = *a, bv = *b;  // dereference a and b value
    if (av > 0) {
        if (bv > 0)
            goto LTV_compare;
        else
            return false;
    } else {  // av is smaller or equal to 0
        if (bv > 0)
            return true;
        else
            goto LTV_compare;
    }
LTV_compare:
    if (av - bv < 0)
        return true;
    else
        return false;
}

void quickSort(int16_t* subarr, int16_t* subend) {
    int16_t* L;                 // lesser pointer
    int16_t* G;                 // greater pointer
    int16_t* P;                 // piviot
    if (subend - subarr < 1) {  // return if the subarr only has one number (or none)
        return;
    } else {
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
}

int main(int argc, char const* argv[]) {
    int16_t* end = arr + sz - 1;
    quickSort(arr, end);
    for (int16_t num : arr) std::cout << num << ", ";
    return 0;
}
