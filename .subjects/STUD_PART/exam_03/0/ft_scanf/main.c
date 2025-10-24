#include <stdio.h>
#include <stdarg.h>
#include <ctype.h>
#include <string.h>

int ft_scanf(const char *, ... );

int main(int argc, char **argv)
{
    if (argc < 3)
    {
        // If no arguments provided, use default test cases
        printf("Usage: %s \"format\" \"input\"\n", argv[0]);
        return 1;
    }

    const char *format = argv[1];
    const char *input = argv[2];
    
    // Create a temporary file with the input
    FILE *temp_file = fopen("temp_input.txt", "w");
    if (!temp_file)
        return 1;
        
    fprintf(temp_file, "%s", input);
    fclose(temp_file);
    
    // Redirect stdin to read from the temporary file
    freopen("temp_input.txt", "r", stdin);
    
    // Variables for different conversion types
    char c = 0;
    int n = 0;
    char str[100] = {0};
    int result = -1;
    
    // Parse based on format
    if (strcmp(format, "%c") == 0)
    {
        result = ft_scanf("%c", &c);
        printf("result=%d char='%c'", result, c);
    }
    else if (strcmp(format, "%d") == 0)
    {
        result = ft_scanf("%d", &n);
        printf("result=%d number=%d", result, n);
    }
    else if (strcmp(format, "%s") == 0)
    {
        result = ft_scanf("%s", str);
        printf("result=%d string='%s'", result, str);
    }
    else if (strcmp(format, "%c %d %s") == 0)
    {
        result = ft_scanf("%c %d %s", &c, &n, str);
        printf("result=%d char='%c' number=%d string='%s'", result, c, n, str);
    }
    else
    {
        printf("Unsupported format: %s", format);
    }
    
    // Clean up
    remove("temp_input.txt");
    return 0;
}