/**
* @file utils.h
* @brief Includes utility functions for doing stuff in a native environment.
*/

#ifndef UTILS_H

/**
* @brief Sets the path to the log file. By default, the log path is set to the directory of the executable.
* @param path The path to the log file.
* @return TRUE if the path was set successfully, FALSE otherwise.
*/
BOOL SetLogPath(WCHAR* path);

/**
* @brief Gets the path to the log file.
* @return The path to the log file.
*/
const WCHAR* GetLogPath();

/**
* @brief Checks if a path exists, and if it does, if it is a directory.
* @param path The path to check.
* @return TRUE if the path exists and is a directory, FALSE otherwise.
*/
BOOL DirectoryExists(WCHAR* path);

/**
* @brief Gets the path of a process given its PID.
* @param pid The PID of the process. If 0, gets the path of the current process.
* @param out_path The buffer to store the path.
* @param out_path_size The size of the buffer.
* @return TRUE if the path was retrieved successfully, FALSE otherwise.
*/
BOOL GetProcessPath(DWORD pid, WCHAR* out_path, DWORD out_path_size);

/**
* @brief Gets our PID
* @return Our PID
*/
DWORD FindMyProcess();

#endif // UTILS_H