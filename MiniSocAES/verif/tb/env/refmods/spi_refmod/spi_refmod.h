#ifndef SPI_REFMOD_H
#define SPI_REFMOD_H

#include <stdint.h>

/* Inicializa o Reference Model */
void spi_ref_init(void);

/* Reseta o banco de registradores */
void spi_ref_reset(void);

/* Escreve em um registrador */
void spi_ref_write(uint8_t addr, uint32_t data);

/* Lê um registrador */
uint32_t spi_ref_read(uint8_t addr);

/* Consulta o valor esperado de um registrador */
uint32_t spi_ref_get_expected(uint8_t addr);

#endif