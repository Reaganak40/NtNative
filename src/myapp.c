#include <phnt_windows.h>
#include <phnt.h>

#ifdef _WIN64
    #define BREAK __debugbreak()
#else
    #define BREAK __asm {int 3}
#endif


NTSTATUS NtProcessStartup(PPEB* Peb) {
    while (1);
    BREAK;
    return 0;
}