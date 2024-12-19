--[[
            ~~ NtNative PROJECT BUILD SYSTEM ~~
 Defines the 'nativerun' Visual Studio project
 
 To run the build system, go the ~/scripts/build-windows.bat
--]]

project_name = "nativerun"

project "nativerun"
    kind "ConsoleApp"
    language "C++"
    uuid (os.uuid(project_name .. "UUID"))
    targetdir (binFolder)
    objdir (binObjFolder)
    ignoredefaultlibraries { "LIBCMTD" }

    files {
        "**.cpp",
     }
    includedirs {
        "%{wks.location}/thirdparty/phnt"
    }

    debugargs {
        "-d \\??\\%{wks.location}bin\\" .. outputFolder .. "\\MyApp\\MyApp.exe"
    }

    postbuildcommands
    {
    }


    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"

        defines
        {
        }

    filter "architecture:x64"
        links {
        }
    
    filter "architecture:x86"
        links {
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

        