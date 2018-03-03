# Precompiled header should be compiled using the same parameters
$sw = [Diagnostics.Stopwatch]::StartNew()
$filePath = $args[0]
$fileBase = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
$cmdPath = "g++"
$cmdArgList = @(
	"-Winvalid-pch", "-I.", "-include", "C:\Users\dev\Documents\Work\precompiled\stdc++.h",
	"-Wall", "-Wextra", "-Wl,--stack=1000000",
	"-std=c++17", "-DLOCAL", "-O2", $filePath, "-o", "$fileBase.exe"
)

$cmdListDebug = @(
	"-pedantic", "-Wshadow", "-Wformat=2",
	"-Wfloat-equal", "-Wconversion", "-Wshift-overflow", "-Wcast-qual",
	"-Wcast-align", "-D_GLIBCXX_DEBUG", "-D_GLIBCXX_DEBUG_PEDANTIC",
	"-D_FORTIFY_SOURCE=2"
)

# !
# Stop-Process -processname $fileBase

& $cmdPath $cmdArgList $cmdListDebug; & ".\$fileBase.exe"
$sw.Stop()
$sw.ElapsedMilliseconds.ToString() + " ms"
