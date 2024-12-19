--[[
            ~~ NtNative PROJECT BUILD SYSTEM ~~
 File: premake5.lua (base)
 
 This is the entry point for the premake build process, which
 will create the Visual Studio solution and project files. This
 file will reference other premake5 files through the project
 hierarchy, triggering their build processes.
 
 To run the build system, go the ./scripts/build-windows.bat
--]]


outputFolder = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

binFolder = ("%{wks.location}/bin/" .. outputFolder .. "/%{prj.name}")
libFolder = ("%{wks.location}/lib/" .. outputFolder .. "/%{prj.name}")

binObjFolder = ("%{wks.location}/bin/obj/" .. outputFolder .. "/%{prj.name}")
libObjFolder = ("%{wks.location}/lib/obj/" .. outputFolder .. "/%{prj.name}")

-- Visual Studio Solution
workspace "NtNative"
    platforms  { "x86", "x64" }
    startproject "nativerun"

    configurations 
    {
        "Debug",
        "Release",
    }

-- Visual Studio Projects
include "src/premake5.lua"

group "ThirdParty"
    include "thirdparty/nativerun/premake5.lua"