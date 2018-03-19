$filePath = $args[0]
$fileBase = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
$cmdPath = "g++"
$cmdArgList = @(
	"-Winvalid-pch",
	"-I.", "-include", "precompiled\debug.h",
	"-Wall", "-Wextra", "-Wl,--stack=100000000",
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

$compile_watch = [Diagnostics.Stopwatch]::StartNew()
& $cmdPath $cmdArgList $cmdListDebug; 
$compile_watch.Stop()

$exec_watch = [Diagnostics.Stopwatch]::StartNew()
& ".\$fileBase.exe"
$exec_watch.Stop()

$compile_watch.ElapsedMilliseconds.ToString() + " ms | " + $exec_watch.ElapsedMilliseconds.ToString() + " ms"

