# 8086 Assembly for Microprocessors

8086 assembly code for the undergraduate **Microprocessors (Mikroişlemciler)** course at Giresun University. Each `BolumNN` folder holds chapter NN of the course and contains the code shown on that chapter's slides as small runnable emu8086-style programs. Instructions, labels and comments follow the slides, and every program runs the example from the slides and the lecture notes, so its result can be compared directly with them. The expected output is at the end of each file.

Course page, slides, lecture notes and the course book: <https://sercankulcu.github.io/teaching/microprocessors/>

## Chapters

| Folder | Chapter | Programs |
|---|---|---|
| `Bolum01` | Introduction to Microprocessors and Number Systems | IP and `LOOP`, clock-cycle counting, 32-bit addition with `ADC`, a CISC read-modify-write `ADD`, a scalar array loop, multiply-accumulate, base conversion by `DIV` remainders and by `SHR`/`RCR`, two's complement (`NOT`+1 vs. `NEG`), Gray code |
| `Bolum02` | 8086 Architecture and Registers | Memory vs. I/O access, ALU operations, instruction lengths and encodings, 20-bit address wraparound, default segments and segment:offset aliasing, the roles of AX/BX/CX/DX/BP, `REP MOVSB` forward and backward, `LAHF`/`SAHF`/`CMC` |
| `Bolum03` | Assembly Language | `x = a + b` at assembly and machine-code level, a two-pass assembler listing, DOS "Merhaba", a C `while` loop in 8086, labels and names, implicit operands, how IP advances, which instructions change flags, the .COM program layout |
| `Bolum04` | Memory Access and Variables | Addressing modes, segment override and the BP/SS pitfall, `BYTE PTR`/`WORD PTR` and little-endian order, `MOV`/`XCHG` rules, writing to video memory, number bases; variables (`DB`/`DW`/`DD`, `LABEL`, `EVEN`), arrays and strings, 2-D tables, `LEA` vs. `OFFSET`, pointer variables, `EQU`, `$`, `TYPE`/`LENGTHOF`/`SIZEOF` |
| `Bolum05` | Interrupts and BIOS/DOS Services | Installing interrupt service routines (save and restore a vector, `RET` vs. `IRET`, divide error, single step), 8259A mask; BIOS `INT 10h` (cursor, teletype, `13h`, scrolling, B800h text and A000h graphics memory), `INT 16h` key read and polling, `INT 1Ah` clock, the tick counter; DOS `INT 21h` input and output, date and time, .COM and .EXE templates, a mini menu |
| `Bolum06` | Arithmetic, Logic and Shift Instructions | Flags (CF/OF/AF/PF), `ADD`/`SUB`/`CMP`, `ADC`/`SBB` multiword arithmetic, `AND`/`OR`/`XOR`/`TEST`, `MUL`/`DIV`/`IDIV` with `CBW`/`CWD`, signed overflow with `JO`, 32×32-bit multiply, `INC`/`DEC`/`NOT`/`NEG`, multiply and divide by shifting, ASCII/BCD adjust (`AAA`, `AAS`, `AAM`, `AAD`, `DAA`), temperature conversion |
| `Bolum07` | Flow Control | `JMP`, synonym jumps, signed vs. unsigned jumps, `CMP`-based if/else and while, out-of-range conditional jumps, `LOOP`, nested loops, `LOOPNE` search, `JCXZ` and `DEC`–`JNZ`, array sum, palindrome check |
| `Bolum08` | Stack and Procedures | `PUSH`/`POP` and LIFO order, swapping values, reversing a string, `PUSHF`/`POPF`, unbalanced stacks, `PROC`/`CALL`/`RET`, far return, indirect `CALL` and jump tables, parameters in registers, memory, a parameter block and the stack (`BP` frame, `RET n`, local variables), results in flags, saving registers, recursive number printing |
| `Bolum09` | Macros and the emu8086.inc Library | Macro definition and expansion, parameter pitfalls, macro vs. procedure, `LOCAL` labels, a register-saving `POWER` macro, nested macros, `REPT`/`IRP`/`IRPC`, conditional assembly; `PUTC`/`GOTOXY`/`PRINT`/`PRINTN` expansions, CR vs. LF, `PRINT_STRING`/`PTHIS`/`GET_STRING`/`CLEAR_SCREEN`, the logic of `SCAN_NUM` and `PRINT_NUM` |
| `Bolum10` | 8086 Hardware and Device Control | Aligned vs. unaligned word access, bus-cycle status codes, `LOCK XCHG` semaphore, 8255 PPI setup, `INT 15h` and loop delays, the emu8086 devices (traffic lights, stepper motor, LED display, thermometer, printer, robot, test device), half-step motor drive and multiplexed 7-segment scanning with `XLAT` |
| `Bolum11` | Instruction Encoding and String Instructions | `XLAT` hex printing, `LEA` vs. `MOV` and `LES` far pointers, `REP MOVSB`/`STOSW` block copy and screen fill, `LODSB`/`STOSB` in-place uppercase, `REPNE SCASB` search |

## Running the examples

Every file is a complete emu8086 program: open it in emu8086 and press *Emulate*. Programs that use `include 'emu8086.inc'` use emu8086's own library there.

The repository also checks every program automatically without emu8086. `ci/run86.py` assembles each file with [UASM](https://github.com/Terraspace/UASM) (a MASM-compatible assembler; emu8086 syntax is close to MASM) and runs it on an 8086 emulator built on [Unicorn](https://www.unicorn-engine.org/), with the DOS and BIOS services the slides use. It then compares the final screen, the values written to ports, and the registers and memory named in the file with the expected output at the end of the file. GitHub Actions runs it on every push.

```bash
pip install unicorn
python ci/run86.py              # every program
python ci/run86.py -v Bolum07   # one chapter, printing each program's output
```

A file can give the emulator keyboard input (`; GIRDI: "12\r"`), values for `IN` (`; PORT 125: 30 40`), registers and memory to report (`; YAZMACLAR: AX CF`, `; BELLEK: sonuc 4`) and an instruction limit for programs that control a device forever (`; SINIR: 2000`). The full list is at the top of `ci/run86.py`.

`inc/emu8086.inc` is written for this repository. It provides the same macros and procedures as emu8086's library (`PUTC`, `GOTOXY`, `PRINT`, `PRINTN`, `CURSOROFF`, `CURSORON`, `SCAN_NUM`, `PRINT_NUM`, `PRINT_NUM_UNS`, `PRINT_STRING`, `PTHIS`, `GET_STRING`, `CLEAR_SCREEN`) so that the programs assemble with UASM; it is not used inside emu8086.

What the emulator does not reproduce: emu8086's device windows (only the values written to and read from their ports are checked), text colours and graphics pixels, real timing, the actual date and time (fixed at 1 January 2026, 12:00), the addresses of the default interrupt routines (here F000:n×4), and bits 12–15 of FLAGS, which are always 1 on an 8086. Three programs in `Bolum08` hold deliberately wrong slide code (an unbalanced stack, a near/far mismatch); they are only assembled, not run. Under UASM a few labels the slides use are reserved words (`c`, `str`, `low`, `high`, `wait` …); those files add `option nokeyword:<…>`, which emu8086 does not need.

Comments, labels and variable names are in Turkish, as on the slides. Where a slide's code needs something it does not show (an `ORG 100h`, a data definition, a `RET`), the file adds the smallest piece needed and marks it with `; sunumda yok`.

## Contact

For questions or suggestions, contact [Sercan Külcü](https://github.com/sercankulcu) or open an issue on GitHub.
