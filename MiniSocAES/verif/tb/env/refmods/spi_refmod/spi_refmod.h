#ifndef SPI_REFMOD_H
#define SPI_REFMOD_H

#include <stdint.h>

void spi_ref_init(void);

void spi_ref_reset(void);

void spi_ref_write(uint8_t addr, uint32_t data);

uint32_t spi_ref_read(uint8_t addr);

uint32_t spi_ref_get_expected(uint8_t addr);

#endif