#include "mem_refmod.h"

#define MEM_DEPTH 1024

static uint32_t reference_memory[MEM_DEPTH];

static uint8_t memory_initialized[MEM_DEPTH];

void mem_refmod_init(void)
{
    for (uint32_t addr = 0; addr < MEM_DEPTH; addr++)
    {
        reference_memory[addr] = 0;
        memory_initialized[addr] = 0;
    }
}

void mem_refmod_write(uint32_t addr, uint32_t data)
{
    if (addr >= MEM_DEPTH)
        return;

    reference_memory[addr] = data;
    memory_initialized[addr] = 1;
}


int mem_refmod_read(uint32_t addr, uint32_t *expected_data)
{
    if (addr >= MEM_DEPTH || expected_data == 0)
        return 0;

    if (memory_initialized[addr] == 0)
        return 0;

    *expected_data = reference_memory[addr];

    return 1;
}
