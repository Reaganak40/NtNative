#include "pch.h"
#include "utils.h"

TCHAR logPath[MAX_PATH] = { 0 };



BOOL SetLogPath(WCHAR* path)
{
    if (wcslen(path) > MAX_PATH) {
        return FALSE;
    }

    if (!DirectoryExists(path)) {
        return FALSE;
    }

    wcscpy_s(logPath, MAX_PATH, path);
    return TRUE;
}

const WCHAR* GetLogPath()
{
    return NULL;
}

BOOL DirectoryExists(WCHAR* path)
{
    OBJECT_ATTRIBUTES obj_attr;
    UNICODE_STRING uni_path;
    FILE_BASIC_INFORMATION basic_info;
    BOOL success = FALSE;
    NTSTATUS status;

    RtlInitUnicodeString(&uni_path, path);
    InitializeObjectAttributes(
        &obj_attr,
        &uni_path,
        OBJ_CASE_INSENSITIVE,
        NULL,
        NULL
    );
    
    status = NtQueryAttributesFile(&obj_attr, &basic_info);
    if (NT_SUCCESS(status)) {
        success = basic_info.FileAttributes & FILE_ATTRIBUTE_DIRECTORY;
    }

    return success;
}

BOOL GetProcessPath(DWORD pid, WCHAR* out_path, DWORD out_path_size)
{
}

DWORD FindMyProcess()
{
    HANDLE current = NULL;
    DWORD pid = 0;
    char process_name[MAX_PATH] = { 0 };
    ULONG len;
    NTSTATUS status;
    while (!NtGetNextProcess(current, MAXIMUM_ALLOWED, 0, 0, &current)) {
        status = NtQueryInformationProcess(
            current,
            ProcessImageFileName,
            process_name,
            sizeof(process_name),
            &len);

        if (NT_SUCCESS(status)) {
            if (wcsstr(process_name, EXE_NAME)) {
                
            }
        }

    }
}
