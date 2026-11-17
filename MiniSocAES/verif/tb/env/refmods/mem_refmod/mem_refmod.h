#ifndef MEM_REFMOD_H
#define MEM_REFMOD_H

#include <stdint.h>

void mem_refmod_init(void);

void mem_refmod_write(uint32_t addr, uint32_t data);

int mem_refmod_read(uint32_t addr, uint32_t *expected_data);

#endif