--[[
            ~~ NtNative PROJECT BUILD SYSTEM ~~
 Defines the 'MyApp' Visual Studio project
 
 To run the build system, go the ~/scripts/build-windows.bat
--]]

project_name = "MyApp"

project "MyApp"
    kind "ConsoleApp"
    language "C"
    uuid (os.uuid(project_name .. "UUID"))
    targetdir (binFolder)
    objdir (binObjFolder)
    ignoredefaultlibraries { "LIBCMTD" }

    files {
        "**.c",
        "**.h"
     }
    includedirs {
        "%{wks.location}/thirdparty/phnt"
    }
  

    postbuildcommands
    {
    }

    pchheader "pch.h"
    pchsource "pch.c"

    flags { "NoRuntimeChecks" }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"
        linkoptions { "/SUBSYSTEM:NATIVE", "/NODEFAULTLIB" }  -- Define subsystem and entry point

        defines
        {
            'EXE_NAME="' .. project_name ..'"'
        }

    filter "architecture:x64"
        links {
            "%{wks.location}/src/lib/ntdll64.lib"
        }
    
    filter "architecture:x86"
        links {
            "%{wks.location}/src/lib/ntdll86.lib"
        }

    filter "configurations:Debug"
        symbols "On"
        staticruntime "off"
        runtime "Debug"
        defines
        {
        }   

    filter "configurations:Release"
        optimize "On"
        staticruntime "off"
        runtime "Release"
        defines
        {
        }

        