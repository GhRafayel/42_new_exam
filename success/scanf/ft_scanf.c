#include <stdarg.h>
#include <stdio.h>
#include <ctype.h>

int match_space(FILE *f)
{
    int c;
    int count = 0;
    
    while ((c = fgetc(f)) != EOF && isspace(c))
        count++;
    
    if (c != EOF)
        ungetc(c, f);
    
    return (count > 0) ? 1 : 0;
}

int match_char(FILE *f, char c)
{
    int input = fgetc(f);
    
    if (input == EOF)
        return -1;
    
    if (input == c)
        return 1;
    
    ungetc(input, f);
    return 0;
}

int scan_char(FILE *f, va_list ap)
{
    char *ptr = va_arg(ap, char *);
    int c = fgetc(f);
    
    if (c == EOF)
        return -1;
    
    *ptr = (char)c;
    return 1;
}

int scan_int(FILE *f, va_list ap)
{
    int *ptr = va_arg(ap, int *);
    int c;
    int sign = 1;
    int value = 0;
    int digits_found = 0;
    
    // Skip leading whitespace
    while ((c = fgetc(f)) != EOF && isspace(c))
        ;
    
    // Check for sign
    if (c == '-')
    {
        sign = -1;
        c = fgetc(f);
    }
    else if (c == '+')
    {
        c = fgetc(f);
    }
    
    // Read digits
    while (c != EOF && isdigit(c))
    {
        digits_found = 1;
        value = value * 10 + (c - '0');
        c = fgetc(f);
    }
    
    // Put back the last character if not EOF
    if (c != EOF)
        ungetc(c, f);
    
    if (!digits_found)
        return -1;
    
    *ptr = value * sign;
    return 1;
}

int scan_string(FILE *f, va_list ap)
{
    char *ptr = va_arg(ap, char *);
    int c;
    int count = 0;
    
    // Read until whitespace or EOF
    while ((c = fgetc(f)) != EOF && !isspace(c))
    {
        ptr[count++] = (char)c;
    }
    
    if (c != EOF)
        ungetc(c, f);
    
    if (count == 0)
        return -1;
    
    ptr[count] = '\0';
    return 1;
}

int match_conv(FILE *f, const char **format, va_list ap)
{
    // Check for end of string before switching
    if (**format == '\0')
        return -1;
        
    switch (**format)
    {
        case 'c':
            return scan_char(f, ap);
        case 'd':
            match_space(f);
            return scan_int(f, ap);
        case 's':
            match_space(f);
            return scan_string(f, ap);
        default:
            return -1;
    }
}

int ft_vfscanf(FILE *f, const char *format, va_list ap)
{
    int nconv = 0;

    while (*format)
    {
        if (*format == '%')
        {
            format++;
            if (*format == '\0')
                break;
                
            int result = match_conv(f, &format, ap);
            if (result == -1)
                break;
            else if (result == 1)
                nconv++;
        }
        else if (isspace(*format))
        {
            if (match_space(f) == -1)
                break;
        }
        else if (match_char(f, *format) != 1)
            break;
        format++;
    }
    
    if (ferror(f))
        return EOF;
    return nconv;
}

int ft_scanf(const char *format, ...)
{
    va_list ap;
    int ret;
    
    va_start(ap, format);
    ret = ft_vfscanf(stdin, format, ap);
    va_end(ap);
    
    return ret;
}