#include "spi_refmod.h"

#include <stdio.h>
#include <string.h>

#define SPI_NUM_REGS 64

/* Banco de registradores */
static uint32_t registers[SPI_NUM_REGS];

/* Inicialização do Reference Model */
void spi_ref_init(void)
{
    memset(registers, 0, sizeof(registers));

    printf("[SPI REFMOD] Initialized\n");
}

/* Reset do Reference Model */
void spi_ref_reset(void)
{
    memset(registers, 0, sizeof(registers));

    printf("[SPI REFMOD] Reset\n");
}

/* Escrita em registrador */
void spi_ref_write(uint8_t addr, uint32_t data)
{
    if (addr >= SPI_NUM_REGS)
    {
        printf("[SPI REFMOD] ERROR: Invalid WRITE address: 0x%02X\n",
               addr);
        return;
    }

    registers[addr] = data;

    printf("[SPI REFMOD] WRITE: ADDR=0x%02X DATA=0x%08X\n",
           addr, data);
}

/* Leitura de registrador */
uint32_t spi_ref_read(uint8_t addr)
{
    if (addr >= SPI_NUM_REGS)
    {
        printf("[SPI REFMOD] ERROR: Invalid READ address: 0x%02X\n",
               addr);
        return 0;
    }

    printf("[SPI REFMOD] READ: ADDR=0x%02X DATA=0x%08X\n",
           addr, registers[addr]);

    return registers[addr];
}

/* Consulta do valor esperado */
uint32_t spi_ref_get_expected(uint8_t addr)
{
    if (addr >= SPI_NUM_REGS)
    {
        printf("[SPI REFMOD] ERROR: Invalid address: 0x%02X\n",
               addr);
        return 0;
    }

    return registers[addr];
}
