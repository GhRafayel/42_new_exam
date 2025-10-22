#include "get_next_line.h"

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("Uso: %s <arquivo_para_ler>\n", argv[0]);
        return 1;
    }

	// Abrimos argv[1]
    int fd = open(argv[1], O_RDONLY);
    if (fd < 0) // Cubrimos que sea negativo
    {
        perror("Error: no se puede abrir el archivo");
        return 1;
    }

    char *line;
    int count = 0;

    while ((line = get_next_line(fd)) != NULL)
    {
        printf("Linea %d: %s", count + 1, line);
		free(line); // Podemos liberar directamente despues de generarla, aunque no se entrega main
		count++;
	}

    close(fd);
    return 0;
}