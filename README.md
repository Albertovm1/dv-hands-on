# CI Expert — Hands-On 2: MiniSoC AES

## 📌 Sobre o projeto

Este repositório contém o desenvolvimento da segunda fase do Hands-On do **CI Expert**, utilizando o projeto MiniSoC AES como objeto de estudo e desenvolvimento.

O MiniSoC AES é um sistema digital que integra uma interface SPI, um PLL mock, um motor criptográfico AES-128 e uma memória compartilhada. O sistema permite que um ambiente externo configure a operação, forneça os dados de entrada e recupere os resultados após o processamento.

O projeto permite estudar a integração entre diferentes blocos de hardware, os mecanismos de controle e o funcionamento de um acelerador criptográfico.

## 🎯 Objetivos

- Compreender a arquitetura e as especificações do MiniSoC AES.
- Estudar a comunicação SPI e o acesso aos registradores.
- Entender o funcionamento do AES-128 e seus modos de operação.
- Compreender o controle de clock e a sinalização de status.
- Analisar o acesso compartilhado à memória.
- Desenvolver conhecimentos relacionados à verificação funcional de sistemas digitais.

## 🏗️ Arquitetura do sistema

O MiniSoC AES é composto pelos seguintes blocos principais:

| Componente | Função |
|---|---|
| SPI Front-End | Recebe as transações SPI utilizadas para configurar e controlar o sistema. |
| Controle | Gerencia os registradores, a sequência de operação e o controle da memória. |
| PLL Mock | Simula a geração do clock do AES e indica quando o clock está bloqueado. |
| AES-128 Engine | Executa as operações de criptografia e descriptografia. |
| Memória compartilhada | Armazena os dados de entrada e os resultados do processamento. |
| Controle de memória | Seleciona o mestre que pode acessar a memória. |

## 🔄 Fluxo de funcionamento

O fluxo conceitual de uma operação de criptografia é:

1. **Reset:** inicialização do sistema.
2. **Configuração:** escrita dos registradores por meio da interface SPI.
3. **Preparação dos dados:** armazenamento do plaintext na memória.
4. **Inicialização do clock:** habilitação do PLL e espera pelo sinal `PLL_LOCKED`.
5. **Transferência da memória:** o controle da memória é transferido para o AES.
6. **Início da operação:** comando `START` para iniciar o processamento.
7. **Processamento:** o AES lê os dados, executa a criptografia e grava o ciphertext na memória.
8. **Conclusão:** acompanhamento dos sinais de status até o término da operação.
9. **Leitura do resultado:** o ambiente externo recupera o ciphertext da memória.

O AES realiza o processamento *in-place*, ou seja, o resultado é gravado nos mesmos endereços utilizados pelos dados originais.

## 🔐 Especificações principais

| Característica | Especificação |
|---|---|
| Algoritmo | AES-128 |
| Tamanho da chave | 128 bits |
| Tamanho do bloco | 128 bits |
| Número de rodadas | 10 |
| Modos suportados | ECB, CBC, PCBC, CFB, OFB e CTR |
| Capacidade da memória | 1024 palavras × 32 bits |
| Capacidade total | 4 KiB |
| Blocos por operação | 1 a 256 |
| Interface de configuração | SPI Mode 0 |
| Frequência máxima da SPI | 25 MHz |
| Sinal de controle da memória | `MEM_SEL_AES` |

## 📝 Registradores principais

| Registradores | Finalidade |
|---|---|
| `KEY0`–`KEY3` | Configuração da chave AES de 128 bits. |
| `IV0`–`IV3` | Configuração do vetor de inicialização, quando necessário. |
| `COUNTER_HI` / `COUNTER_LO` | Configuração do contador utilizado no modo CTR. |
| `NUM_BLOCKS` | Define a quantidade de blocos a processar. |
| `AES_CONTROL` | Configura o modo, a direção da operação e o comando de início. |
| `AES_STATUS` | Informa o estado do processamento. |
| `SYSTEM_CONTROL` | Controla recursos do sistema, incluindo PLL e acesso à memória. |
| `SYSTEM_STATUS` | Disponibiliza o estado do sistema, incluindo `PLL_LOCKED`. |

## 📊 Sinais de status

- `BUSY`: indica que o AES está processando.
- `DONE`: indica que a operação foi concluída.
- `ERROR`: indica uma condição de erro.
- `BLOCKS_DONE`: informa a quantidade de blocos processados.
- `PLL_LOCKED`: indica que o PLL atingiu o estado de bloqueio esperado.

## 🧪 Foco em Design Verification

O estudo do MiniSoC AES oferece oportunidades para investigar cenários de verificação relacionados a:

- Comunicação SPI e acesso aos registradores.
- Criptografia e descriptografia nos diferentes modos.
- Processamento de um ou múltiplos blocos.
- Funcionamento do PLL e sequência de inicialização.
- Controle de acesso à memória.
- Transições de estado e sinais de conclusão.
- Tratamento de configurações inválidas e condições de erro.
- Verificação da integridade dos dados processados.

Esses cenários podem servir como base para um plano de verificação, com testes, mecanismos de checagem e métricas de cobertura, conforme os objetivos e entregáveis desta fase do Hands-On.

## 📚 Documentação

As especificações oficiais do projeto devem ser utilizadas como referência para os detalhes de implementação, os requisitos funcionais e as regras de operação do MiniSoC AES.

## 🚧 Status do projeto

Em desenvolvimento — a implementação, os testes executados e os resultados de verificação serão documentados conforme o avanço do Hands-On.

---

**Projeto:** CI Expert — Hands-On 2  
**Sistema estudado:** MiniSoC AES  
**Área:** Design Verification
