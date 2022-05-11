#ifndef QUICKSORT_H
#define QUICKSORT_H
#include <cstdint>
void swapV(int16_t* a, int16_t* b);
bool LTA(int16_t* a, int16_t* b);
bool GTV(int16_t* a, int16_t* b);
bool LTV(int16_t* a, int16_t* b);
void quickSort(int16_t* subarr, int16_t* subend);

#endif