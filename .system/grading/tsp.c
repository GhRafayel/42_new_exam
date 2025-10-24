#include "tsp.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*
 * distance between two cities
 */

float dist(const City *a, const City *b)
{
    float dx = a->x - b->x;
    float dy = a->y - b->y;
    return sqrtf(dx * dx + dy * dy);
}

/*
 * swap two integers (indices)
 */

void swap_int(int *a, int *b)
{
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

/*
 * backtracking with pruning:
 * - path[] holds indices of cities
 * - we keep city 0 fixed in position 0 and permute from pos..n-1
 * - current_dist accumulated distance up to position pos-1
 * - prune if current_dist >= *min_dist
 */
void backtrack(City *cities, int *path, int n, int pos, float current_dist, float *min_dist)
{
    int i;
    if (current_dist >= *min_dist)
        return;
    if (pos == n)
    {
        /* add distance from last city back to first (close cycle) */
        current_dist += dist(&cities[path[n - 1]], &cities[path[0]]);
        if (current_dist < *min_dist)
            *min_dist = current_dist;
        return;
    }
    for (i = pos; i < n; i++)
    {
        /* place path[i] at position pos */
        swap_int(&path[pos], &path[i]);
        /* add distance from previous city (pos-1) to this city (pos) */
        float added = dist(&cities[path[pos - 1]], &cities[path[pos]]);
        backtrack(cities, path, n, pos + 1, current_dist + added, min_dist);
        /* restore */
        swap_int(&path[pos], &path[i]);
    }
}

int main(void)
{
    City cities[11];
    int n = 0;

    /* Read up to 11 cities from stdin, format "%f, %f" per line */
    while (n < 11 && fscanf(stdin, "%f, %f", &cities[n].x, &cities[n].y) == 2)
        n++;
   
    if (n < 2) return (printf("%s", "Error:\n"), 1);

    /* initialize path indices: 0,1,2,...,n-1 */
    int *path = (int *)malloc(sizeof(int) * n);
    if (!path) return (printf("%s", "Error:\n"), 1);

    for (int i = 0; i < n; i++)
        path[i] = i;

    float min_dist = FLT_MAX;

    /* Fix city 0 at position 0 and permute the rest starting at pos = 1 */
    backtrack(cities, path, n, 1, 0.0f, &min_dist);

    /* print result with 2 decimals to stdout */
    fprintf(stdout, "%.2f\n", min_dist);

    free(path);
    return 0;
}
