#ifndef TSP_H
#define TSP_H

#include <float.h>

typedef struct s_city
{
    float x;
    float y;
}               City;

float  dist(const City *a, const City *b);
void   swap_int(int *a, int *b);
void   backtrack(City *cities, int *path, int n, int pos, float current_dist, float *min_dist);

#endif /* TSP_H */
