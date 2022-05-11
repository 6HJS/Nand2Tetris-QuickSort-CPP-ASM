#include "quickSortCPP.hpp"

#include <cstdlib>
#include <iostream>
int arr[6] = {2, 3, 4, 6, 1, 5};  // R1
// int arr[6] = {1, 4, 20000, 22000, 1, 5};  // R1
// int arr[6] = {-22000, -20000, 1, 4, 1, 5};  // R1
// int arr[6] = {22000, 1, 4, -20000, 1, 5};  // R1
// int arr[6] = {-20000, 1, 4, 22000, 1, 5};  // R1
int sz = 6;  // R2

int main(int argc, char const* argv[]) {
    int* end = arr + sz - 1;
    quickSort(arr, end);
    for (int num : arr) std::cout << num << ", ";
    return 0;
}

void quickSort(int* subarr, int* subend) {
    int* L;                     // lesser pointer
    int* G;                     // greater pointer
    int* P;                     // piviot
    if (subend - subarr < 1) {  // return if the subarr only has one number (or none)
        return;
    } else {
        L = subarr;
        G = subend;  // arr starts from 0
        // find pivoit the element in the middle of the array
        //                                                                          while (L++ < G--)
        //                                                                          P = G;
        while (L < G) {
            L++;
            G--;
        }
        P = G;  // select the middle element as the pivoit
        // reset Lesser Greater point to the two subend of the array
        L = subarr;
        G = subend;         // arr starts from 0
        std::swap(*P, *G);  // put the pivoit out of the way, to the end
        P = subend;         // now the Pivoit is at arr[end]
        G--;

        while (L < G) {
            while (*L < *P)  // find the first element larger than pivoit from left
                L++;
            while (*G > *P)  // find the first element smaller than pivoit from right
                G--;
            if (L < G)
                std::swap(*L++, *G--);
        }
        if (*L > *P)
            std::swap(*L, *P);
        // now pivoit is at tis correct position and all number to its left is smaller, all number to the right is larger.
        // recursive call
        quickSort(subarr, L - 1);
        quickSort(L + 1, subend);
    }
}