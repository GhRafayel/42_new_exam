#include "n_queens.h"
#include <unistd.h> /* write */
#include <stdlib.h>

static int int_to_buf(int num, char *buf)
{
    int len = 0;
    int n = num;
    char rev[12];
    int i = 0;

    if (n == 0)
    {
        buf[0] = '0';
        return 1;
    }

    if (n < 0)
    {
        buf[len++] = '-';
        n = -n;
    }

    while (n > 0)
    {
        rev[i++] = (char)('0' + (n % 10));
        n /= 10;
    }

    /* reverse into buf (after possible '-') */
    while (i-- > 0)
    {
        buf[len++] = rev[i];
    }

    return len;
}

static int is_safe(int *board, int col, int row)
{
    int c;
    for (c = 0; c < col; ++c)
    {
        int r = board[c];
        if (r == row)
            return 0; 
        if ((r - row) == (c - col))
            return 0; 
        if ((row - r) == (c - col))
            return 0;
    }
    return 1;
}

static void print_solution(int *board, int n)
{
    int c;
    char buf[32];
    int len;

    for (c = 0; c < n; ++c)
    {
        len = int_to_buf(board[c], buf);
        if (len > 0)
            write(1, buf, (size_t)len);
        if (c + 1 < n)
            write(1, " ", 1);
        else
            write(1, "\n", 1);
    }
}

/* recursive backtracking */
static void backtrack(int *board, int col, int n)
{
    int row;
    if (col == n)
    {
        print_solution(board, n);
        return;
    }

    for (row = 0; row < n; ++row)
    {
        if (is_safe(board, col, row))
        {
            board[col] = row;
            backtrack(board, col + 1, n);
        }
    }
}

void solve_n_queens(int *board, int n)
{
    if (!board || n <= 0)
        return;
    backtrack(board, 0, n);
}


int main(int argc, char **argv)
{
    int n;
    int *board;

    if (argc != 2) return (printf("Error:\n"), 1);

    n = atoi(argv[1]);
    if (n <= 0) return (printf("Error:\n"), 1);

    board = (int *)calloc((size_t)n, sizeof(int));
    if (!board) return (printf("Error:\n"), 1);

    solve_n_queens(board, n);

    free(board);
    return 0;
}