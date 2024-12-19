// Precompiled header for MyApp
#ifndef PCH_H
#define PCH_H

#include <phnt_windows.h>
#include <phnt.h>

#ifdef _UNICODE
    #define _tcslen wcslen
    #define _tcscpy wcscpy
#else
    #define _tcslen strlen
    #define _tcscpy strcpy
#endif

#ifdef _WIN64
#define BREAK __debugbreak()
#else
#define BREAK __asm {int 3}
#endif

#endif // PCH_H