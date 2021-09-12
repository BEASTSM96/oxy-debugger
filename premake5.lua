workspace( 'Debugger' )
configurations { 'Debug', 'Release' }
startproject( 'Debugger' )

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project           "Debugger"
	location      "Debugger"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++17"
	staticruntime "on"
	warnings      "Off"

	targetdir     ("bin/" .. outputdir .. "/%{prj.name}")
	objdir        ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
				  "%{prj.name}/src/**.h",
				  "%{prj.name}/src/**.cpp"
	}

	defines
	{
				  "_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
				  "%{prj.name}/src"
	}

	filter		  "system:windows"
		systemversion "latest"

		defines
		{
			"__DEBUGGER_PLATFORM_WINDOWS__",
			"__DEBUGGER_BUILD_DLL__",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines "__DEBUGGER_DEBUG__"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "__DEBUGGER_RELEASE__"
		runtime "Release"
		optimize "on"