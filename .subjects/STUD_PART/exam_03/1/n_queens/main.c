#include "n_queens.h"

int main(int argc, char **argv)
{
    int n;
    int *board;

    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s n\n", (argc > 0 ? argv[0] : "n_queens"));
        return 1;
    }

    n = atoi(argv[1]);
    if (n <= 0)
    {
        return 0;
    }

    board = (int *)calloc((size_t)n, sizeof(int));
    if (!board)
    {
        fprintf(stderr, "Allocation error\n");
        return 1;
    }

    solve_n_queens(board, n);

    free(board);
    return 0;
}
